#!/usr/bin/env bash
# Apply clang-format to all C/C++ source files in the project.
# Usage: ./scripts/format.sh [--check]
#   --check   Only report files that would change, don't modify them.
set -euo pipefail

cd "$(dirname "$0")/.."

CHECK_ONLY=0
if [[ "${1:-}" == "--check" ]]; then
    CHECK_ONLY=1
fi

FILES=$(git ls-files '*.c' '*.cc' '*.cpp' '*.cxx' '*.h' '*.hh' '*.hpp' '*.hxx')

if [[ -z "$FILES" ]]; then
    echo "No C/C++ files found."
    exit 0
fi

CHANGED=()

while IFS= read -r file; do
    if [[ $CHECK_ONLY -eq 1 ]]; then
        if ! clang-format --dry-run --Werror "$file" > /dev/null 2>&1; then
            CHANGED+=("$file")
        fi
    else
        if ! diff -q <(clang-format "$file") "$file" > /dev/null 2>&1; then
            CHANGED+=("$file")
            clang-format -i "$file"
        fi
    fi
done <<< "$FILES"

if [[ ${#CHANGED[@]} -eq 0 ]]; then
    echo "All files already formatted."
else
    if [[ $CHECK_ONLY -eq 1 ]]; then
        echo "Files that need formatting:"
    else
        echo "Formatted files:"
    fi
    printf '  %s\n' "${CHANGED[@]}"
fi
