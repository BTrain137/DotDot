#!/bin/bash

# Define the path for the git templates directory
GIT_TEMPLATES_DIR="$HOME/git-templates"

# Create the hooks directory inside the git templates directory
mkdir -p "${GIT_TEMPLATES_DIR}/hooks"

# Create the pre-commit hook script
cat << 'EOF' > "${GIT_TEMPLATES_DIR}/hooks/pre-commit"
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
chmod +x "${GIT_TEMPLATES_DIR}/hooks/pre-commit"

# Configure git to use the custom templates directory
git config --global init.templateDir "${GIT_TEMPLATES_DIR}"

echo "Git templates directory set up successfully."
echo "All new repositories will now use this template and include the ggshield pre-commit hook."
