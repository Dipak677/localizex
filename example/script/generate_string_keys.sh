#!/bin/bash
#
# generate_string_keys.sh
#
# Purpose:
#   Generates a Dart class (StringKeys) containing static constants for all
#   localization keys found in the "en" (English) locale block of string_store.dart.
#   This automates the creation of type-safe string key references for localization.
#
# Usage:
#   ./generate_string_keys.sh
#
# Input:
#   ../lib/localization/string_store.dart - Contains locale data with key-value pairs
#
# Output:
#   ../lib/localization/string_keys.dart - Generated Dart class with string constants
#
#

# Exit immediately if a command exits with a non-zero status,
# treat unset variables as errors, and fail on pipe errors
set -euo pipefail

# ============================================================================
# Configuration
# ============================================================================

# SCRIPT_DIR: Absolute path to the directory containing this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# INPUT_FILE: Path to the source file containing localization data
# Expected format: Dart file with JSON-like structure containing locale blocks
INPUT_FILE="$SCRIPT_DIR/../lib/localization/string_store.dart"

# OUTPUT_FILE: Path where the generated Dart class will be written
# This file will be completely overwritten each time the script runs
OUTPUT_FILE="$SCRIPT_DIR/../lib/localization/string_keys.dart"

# ============================================================================
# Validation
# ============================================================================

# Verify that the input file exists before proceeding
if [ ! -f "$INPUT_FILE" ]; then
    echo "❌ Input file not found: $INPUT_FILE"
    exit 1
fi

echo "Reading localization keys..."

# ============================================================================
# Key Extraction
# ============================================================================

# Single-pass extraction and formatting using Perl
# This section reads the input file and extracts all keys from the "en" block
#
# Processing steps:
#   1. Slurps the whole file into memory (-0777 flag)
#   2. Finds the "en": { ... } block using regex with nested brace handling
#   3. Extracts all key-value pairs, ignoring escaped quotes inside values
#   4. Formats each key as a Dart static const String declaration
#
# Regex explanation:
#   - /"en"\s*:\s*/ - Matches the "en" locale identifier
#   - (\{((?:[^{}]|(?1))*)\}) - Captures content between braces, handling nesting
#   - /"([^"]+)"\s*:\s*"(?:[^"\\]|\\.)*"/sg - Extracts key-value pairs
#
# Output format:
#   static const String <key_name> = "<key_name>";
#
generated_content=$(perl -0777 -ne '
    if (/"en"\s*:\s*(\{((?:[^{}]|(?1))*)\})/s) {
        my $en_content = $2;
        while ($en_content =~ /"([^"]+)"\s*:\s*"(?:[^"\\]|\\.)*"/sg) {
            print "  static const String $1 = \"$1\";\n" unless $1 eq "en";
        }
    }
' "$INPUT_FILE")

# Verify that at least one key was found
if [ -z "$generated_content" ]; then
    echo "❌ No keys found in the 'en' block."
    exit 1
fi

# ============================================================================
# File Generation
# ============================================================================

# Write the generated Dart class to the output file using a heredoc
# The heredoc allows for clean multi-line content with variable interpolation
cat <<EOF > "$OUTPUT_FILE"
// GENERATED FILE — DO NOT MODIFY MANUALLY

class StringKeys {
  StringKeys._();

$generated_content
}
EOF

# ============================================================================
# Code Formatting
# ============================================================================

# Format the generated file using dart format if available
# This ensures consistent code style and proper indentation
# Errors and output are suppressed for cleaner script output
if command -v dart >/dev/null 2>&1; then
    dart format "$OUTPUT_FILE" >/dev/null 2>&1
fi

# ============================================================================
# Completion Report
# ============================================================================

# Count the number of generated keys and display success message
key_count=$(echo "$generated_content" | wc -l | xargs)
echo "✅ Generated $OUTPUT_FILE with $key_count keys."




# Run this command once to make the script executable
# chmod +x generate_string_keys.sh

# Run this command to generate the StringKeys file
# ./generate_string_keys.sh