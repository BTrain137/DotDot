#!/bin/bash

# Setup ggsheild for existing git repositories

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

# Navigate to the git repository directory
read -p "Enter the path to your git repository: " repo_path
cd "$repo_path"

# Check if .pre-commit-config.yaml exists, if not, create it
if [ ! -f .pre-commit-config.yaml ]; then
    echo "Creating .pre-commit-config.yaml..."
    cat <<EOF > .pre-commit-config.yaml
repos:
  - repo: local
    hooks:
      - id: ggshield
        name: ggshield
        entry: ggshield scan pre-commit
        language: system
        types: [text]
        stages: [commit]
EOF
else
    echo ".pre-commit-config.yaml already exists."
fi

# Install the pre-commit hook
pre-commit install

echo "Setup complete. ggshield and pre-commit have been configured."
