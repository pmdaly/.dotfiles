.PHONY: install uninstall test

configs=\
	kitty\
	nvim\
	ranger\
	tmux\
	system

pkgs=

deps: 
	echo apt install ${pkgs}

install:
	@for folder in $(configs); do \
		echo stow "$$folder"; \
	done

uninstall:
	@for folder in $(configs); do \
		echo stow -D "$$folder"; \
	done

# test building in ubuntu / mac docker
test:
	@which docker || { echo "docker is not installed!"; exit 1; }
	sudo docker build -t dotfiles-test -f Dockerfile .
	sudo docker run -it dotfiles-test
