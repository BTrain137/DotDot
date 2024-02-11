#!/bin/bash

# Function to add pre-commit hook
add_pre_commit_hook() {
    local git_dir=$1
    local pre_commit_hook="${git_dir}/hooks/pre-commit"

    # Check if pre-commit hook already exists
    if [[ -f "$pre_commit_hook" ]]; then
        echo "Existing pre-commit hook found in ${git_dir}. Skipping..."
        return
    fi

    # Create the pre-commit hook
    cat << 'EOF' > "$pre_commit_hook"
#!/bin/sh
# Prevent committing secrets using ggshield

# Check if ggshield is installed
if ! command -v ggshield &> /dev/null; then
    echo "Error: ggshield is not installed. Please install ggshield to continue."
    exit 1
fi

# Run ggshield scan
ggshield secret scan pre-commit

# Capture the exit code of ggshield scan
exit_code=$?

# Exit with the exit code from ggshield scan
exit $exit_code
EOF

    # Make the pre-commit hook executable
    chmod +x "$pre_commit_hook"
    echo "Added pre-commit hook to ${git_dir}"
}

# Function to recursively search for .git directories
search_git_dirs() {
    local search_dir=$1
    for dir in "${search_dir}"/*; do
        if [[ -d "${dir}" && -d "${dir}/.git" ]]; then
            add_pre_commit_hook "${dir}/.git"
        fi
    done
}

# Main script execution
main() {
    # Prompt user for the directory
    read -p "Enter the path to your parent directory: " repo_path

    if [[ ! -d "$repo_path" ]]; then
        echo "Directory not found: $repo_path"
        exit 1
    fi

    search_git_dirs "$repo_path"
}

# Run the script
main
