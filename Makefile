.PHONY: install uninstall test help apply diff edit

configs=\
	kitty\
	nvim\
	ranger\
	tmux\
	zsh

pkgs=\
     ranger\
	 jq

# Help target
help:
	@echo "Available commands:"
	@echo "  apply         - Apply dotfiles using chezmoi (recommended)"
	@echo "  diff          - Show what would change"
	@echo "  edit          - Edit a dotfile"
	@echo "  install       - Install dotfiles using stow (legacy)"
	@echo "  uninstall     - Uninstall dotfiles using stow (legacy)"
	@echo "  update        - Update system packages"
	@echo "  test          - Run local tests"
	@echo ""
	@echo "Note: Comprehensive testing is done via GitHub Actions"
	@echo "  - Real Linux environment testing"
	@echo "  - Real macOS environment testing"
	@echo "  - Automatic testing on push/PR"

# Chezmoi commands (recommended)
apply:
	chezmoi apply

diff:
	chezmoi diff

edit:
	@echo "Usage: make edit FILE=~/.zshrc"
	@if [ -n "$(FILE)" ]; then chezmoi edit $(FILE); else echo "Please specify FILE=path"; fi

update:
	sudo apt update
	sudo apt install ${pkgs}

install:
	# kitty
	$(call install_kitty)

	# node
	$(call install_node)

	# neovim
	$(call install_neovim)

	# link configs
	@for folder in $(configs); do \
		stow -R "$$folder"; \
	done

uninstall:
	# neovim
	# unlink configs
	@for folder in $(configs); do \
		stow -D "$$folder"; \
	done

# Local testing
test:
	@echo "Running local tests..."
	@echo "Note: For comprehensive testing, push to GitHub to trigger Actions"
	@echo "✅ Checking chezmoi installation..."
	@chezmoi --version
	@echo "✅ Checking required files..."
	@[[ -f "scripts/migrate-to-chezmoi.sh" ]] || (echo "❌ scripts/migrate-to-chezmoi.sh not found" && exit 1)
	@[[ -f "scripts/run_once_install-dotfiles.sh.tmpl" ]] || (echo "❌ scripts/run_once_install-dotfiles.sh.tmpl not found" && exit 1)
	@[[ -d "chezmoi-source" ]] || (echo "❌ chezmoi-source directory not found" && exit 1)
	@[[ -f "chezmoi.toml" ]] || (echo "❌ chezmoi.toml not found" && exit 1)
	@echo "✅ Local tests completed"

# installations
define install_kitty
	@if ! which kitty >/dev/null 2>&1; then \
		curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin; \
		ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/; \
		cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/; \
		cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/; \
		sed -i "s|Icon=kitty|Icon=/home/$(USER)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop; \
		sed -i "s|Exec=kitty|Exec=/home/$(USER)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop; \
	fi
endef

define install_node
	@if ! which node >/dev/null 2>&1; then \
		sudo apt-get install -y ca-certificates curl gnupg; \
		sudo mkdir -p /etc/apt/keyrings; \
		curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg; \
		NODE_MAJOR=20; \
		echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list; \
		sudo apt-get update; \
		sudo apt-get install nodejs -y; \
	fi
endef

define install_neovim
	@if ! which nvim >/dev/null 2>&1; then \
		# nvim
		curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage; \
		chmod u+x nvim.appimage; \
		./nvim.appimage; \
	fi
endef
