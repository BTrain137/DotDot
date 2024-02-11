#!/bin/bash

# Setup ggsheild for existing git repositories
echo "----------------------------------"

# Function to check if a command exists
command_exists () {
    type "$1" &> /dev/null ;
}

echo "Starting setup..."

# Check for Homebrew, install if we don't have it
if ! command_exists brew; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check for ggshield, install if we don't have it
if ! command_exists ggshield; then
    echo "ggshield not found, installing..."
    brew install ggshield
else
    echo "ggshield is already installed."
fi

# Check for pre-commit, install if we don't have it
if ! command_exists pre-commit; then
    echo "pre-commit not found, installing..."
    brew install pre-commit
else
    echo "pre-commit is already installed."
fi

echo "Setup complete. ggshield and pre-commit have been configured."
echo "----------------------------------"
echo "Setting up ggshield pre-commit hook for new repositories..."

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
echo "All 'git init' or 'git clone' from now on will be ggshield enabled."
echo "WARNING!! WARNING!! ONLY NEW repositories!!"
echo "To apply this template to EXISTING repositories, please see 'setup_ggshield_existing_repo.sh'"
echo "----------------------------------"
