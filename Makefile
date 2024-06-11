deploy:
	nix build .#darwinConfigurations.mattiasalvetti-macbook.system \
	   --extra-experimental-features 'nix-command flakes'

	./result/sw/bin/darwin-rebuild switch --flake .#mattiasalvetti-macbook
