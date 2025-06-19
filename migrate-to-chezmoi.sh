#!/bin/bash
# Migration script from stow to chezmoi

set -euo pipefail

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Error handling
trap 'echo -e "${RED}❌ Migration failed${NC}"; exit 1' ERR

echo -e "${GREEN}🔄 Migrating from stow to chezmoi...${NC}"

# Check if stow is being used
if [[ -L ~/.zshrc ]] && [[ "$(readlink ~/.zshrc)" == *".dotfiles"* ]]; then
    echo -e "${YELLOW}📋 Detected stow-managed dotfiles${NC}"
    
    # Backup current setup
    echo -e "${YELLOW}💾 Creating backup...${NC}"
    BACKUP_DIR=~/.dotfiles-backup-$(date +%Y%m%d)
    mkdir -p "$BACKUP_DIR"
    cp -r ~/.dotfiles "$BACKUP_DIR/"
    echo -e "${GREEN}✅ Backup created at: $BACKUP_DIR${NC}"
    
    # Unlink stow-managed files
    echo -e "${YELLOW}🔗 Unlinking stow-managed files...${NC}"
    cd ~/.dotfiles
    for folder in kitty nvim ranger tmux zsh; do
        if [[ -d "$folder" ]]; then
            echo "  Unlinking $folder..."
            stow -D "$folder" 2>/dev/null || echo "  $folder not linked"
        fi
    done
    
    echo -e "${GREEN}✅ Stow unlink complete${NC}"
else
    echo -e "${YELLOW}📋 No stow-managed dotfiles detected${NC}"
fi

# Install chezmoi if not already installed
if ! command -v chezmoi >/dev/null 2>&1; then
    echo -e "${YELLOW}📦 Installing chezmoi...${NC}"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if ! command -v brew >/dev/null 2>&1; then
            echo -e "${RED}❌ Homebrew required for macOS${NC}"
            exit 1
        fi
        brew install chezmoi
    else
        # Linux installation with proper PATH handling
        sh -c "$(curl -fsLS get.chezmoi.io)"
        # Ensure chezmoi is in PATH
        if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
            export PATH="$HOME/.local/bin:$PATH"
        fi
        # Verify installation
        if ! command -v chezmoi >/dev/null 2>&1; then
            echo -e "${RED}❌ Chezmoi installation failed${NC}"
            exit 1
        fi
    fi
else
    echo -e "${GREEN}✅ Chezmoi already installed${NC}"
fi

# Initialize chezmoi with current repo
echo -e "${YELLOW}🚀 Initializing chezmoi...${NC}"
chezmoi init --apply .

echo -e "${GREEN}✅ Migration complete!${NC}"
echo -e "${GREEN}💡 Next steps:${NC}"
echo -e "  1. Restart your terminal"
echo -e "  2. Test your setup: chezmoi verify"
echo -e "  3. Edit files: chezmoi edit ~/.zshrc"
echo -e "  4. Apply changes: chezmoi apply" 