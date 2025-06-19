# Migrating to Chezmoi

## 🚀 Quick Migration

Run the migration script to automatically transition from stow to chezmoi:

```bash
./migrate-to-chezmoi.sh
```

## 📋 What's Changed

### Before (stow)
- Manual symlink management
- Separate installation steps
- No cross-platform templates
- Limited dependency management

### After (chezmoi)
- **Automatic dependency installation**
- **Cross-platform templates** (macOS/Linux detection)
- **Template support** for different configurations
- **Better error handling**
- **Built-in secrets management** (future)
- **Modern tooling**

## 🗂️ New Structure

```
chezmoi-source/
├── chezmoi.toml                    # Configuration
├── run_once_install-dotfiles.sh.tmpl  # One-time setup
├── dot_zshrc.tmpl                 # Zsh config template
├── dot_config/
│   ├── nvim/                      # Neovim config
│   ├── kitty/                     # Kitty config
│   └── ranger/                    # Ranger config
├── dot_tmux.conf.tmpl             # Tmux config
└── README.md.tmpl                 # Documentation
```

## 🔧 Key Features

### 1. **Cross-Platform Support**
- Automatically detects macOS vs Linux
- Uses appropriate package managers (Homebrew/apt)
- OS-specific paths and configurations

### 2. **Automatic Installation**
- Installs all dependencies automatically
- Sets up applications (kitty, neovim, node.js)
- Configures Python integration

### 3. **Template System**
- Variables like `{{ .chezmoi.username }}`
- OS-specific conditions
- Easy customization

## 🛠️ Usage

### Basic Commands
```bash
# Apply all changes
chezmoi apply

# Edit a file
chezmoi edit ~/.zshrc

# See what would change
chezmoi diff

# Update from source
chezmoi update

# Remove dotfiles
chezmoi unapply
```

### Advanced Commands
```bash
# Verify installation
chezmoi verify

# Check what's managed
chezmoi managed

# Execute a command
chezmoi execute-template "echo {{ .chezmoi.os }}"
```

## 🔄 Migration Steps

1. **Backup** (automatic)
   - Current setup is backed up to `~/.dotfiles-backup-YYYYMMDD/`

2. **Unlink stow** (automatic)
   - Removes all stow-managed symlinks

3. **Install chezmoi** (automatic)
   - Installs chezmoi on your system

4. **Initialize** (automatic)
   - Sets up chezmoi with your current repository

5. **Test** (manual)
   ```bash
   chezmoi verify
   ```

## 🎯 Benefits

- **Simpler installation**: One command to set up everything
- **Better cross-platform support**: Works seamlessly on macOS and Linux
- **Template system**: Easy to customize for different environments
- **Modern tooling**: Active development and community
- **Future-proof**: Supports secrets, templates, and advanced features

## 🚨 Important Notes

- **Backup created**: Your old setup is safely backed up
- **No data loss**: All your configurations are preserved
- **Reversible**: You can always go back to stow if needed
- **Test first**: Run `chezmoi diff` to see what will change

## 🆘 Troubleshooting

### If something goes wrong:
```bash
# Restore from backup
cp -r ~/.dotfiles-backup-YYYYMMDD/* ~/.dotfiles/

# Re-link with stow
cd ~/.dotfiles
stow kitty nvim ranger tmux zsh
```

### Common issues:
- **Permission errors**: Run with `sudo` if needed
- **Missing dependencies**: The install script handles this automatically
- **Template errors**: Check `chezmoi.toml` configuration

## 🎉 You're Ready!

After migration, you'll have a modern, powerful dotfile management system that's easier to maintain and more flexible than stow. 