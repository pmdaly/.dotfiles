.PHONY: install uninstall test

configs=\
	kitty\
	nvim\
	ranger\
	tmux\
	system

pkgs=\
     ranger\


deps: 
	echo apt install ${pkgs}

install:
	sudo apt update
	sudo apt install ${pkgs}
	# kitty
	@if ! which kitty >/dev/null 2>&1; then \
		curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin; \
		mkdir -p ~/.local/bin/; \
		ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/; \
		cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/; \
		cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/; \
		sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop; \
		sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop; \
	fi
	# node
	@if ! which node >/dev/null 2>&1; then \
		sudo apt-get install -y ca-certificates curl gnupg; \
		sudo mkdir -p /etc/apt/keyrings; \
		curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg; \
		NODE_MAJOR=20; \
		echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list; \
		sudo apt-get update; \
		sudo apt-get install nodejs -y; \
	fi
	# neovim
	@if ! which nvim >/dev/null 2>&1; then \
		# nvim
		curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage; \
		chmod u+x nvim.appimage; \
		./nvim.appimage; \
	fi
	# link configs
	@for folder in $(configs); do \
		stow "$$folder"; \
	done

uninstall:
	# neovim
	# unlink configs
	@for folder in $(configs); do \
		stow -D "$$folder"; \
	done

# test building in ubuntu / mac docker
test:
	@which docker || { echo "docker is not installed!"; exit 1; }
	sudo docker build -t dotfiles-test -f Dockerfile .
	sudo docker run -it dotfiles-test
