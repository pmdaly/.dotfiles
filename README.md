# Dotfiles

Unifying dotfile management across multiple machines with chezmoi.

## Quick Start

1. **Install chezmoi:**
   ```bash
   sh -c "$(curl -fsLS get.chezmoi.io)"
   ```

2. **Initialize and apply dotfiles:**
   ```bash
   chezmoi init --source ./chezmoi-source --apply
   ```

3. **For fresh machine setup:**
   ```bash
   ./scripts/run_once_install-dotfiles.sh.tmpl
   ```

## Structure

- `chezmoi-source/` - Dotfile templates and configurations
- `scripts/` - Utility scripts for setup and migration
- `chezmoi.toml` - Chezmoi configuration

## Migration from stow

If migrating from stow, use:
```bash
./scripts/migrate-to-chezmoi.sh
```

## Usage

- `chezmoi apply` - Apply all dotfiles
- `chezmoi edit ~/.zshrc` - Edit a dotfile
- `chezmoi diff` - See what would change
- `chezmoi verify` - Check dotfile status
