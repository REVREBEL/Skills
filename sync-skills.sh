#!/bin/bash

SOURCE_DIR="./skills"
TARGET_DIR="../.gemini/antigravity/skills"

mkdir -p "$TARGET_DIR"

# Rule: Find all SKILL.md files, get their immediate parent folder, and symlink it flatly
find "$SOURCE_DIR" -name "SKILL.md" | while read -r filepath; do
    # Get the exact child folder containing the SKILL.md
    child_dir=$(dirname "$filepath")
    
    # Get just the name of that folder (e.g., "scientific-writing")
    folder_name=$(basename "$child_dir")
    
    # Create a symlink in the Antigravity skills directory pointing to the absolute path of the child folder
    ln -sfn "$(realpath "$child_dir")" "$TARGET_DIR/$folder_name"
done

echo "Symlinks generated successfully!"