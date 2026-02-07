.PHONY: install install-work update clean macos macos-reset dry-run

install:
	./install.sh

install-work:
	./install.sh --work

macos:
	chmod +x ./macos/set-defaults.sh && ./macos/set-defaults.sh

macos-reset:
	chmod +x ./macos/reset-defaults.sh && ./macos/reset-defaults.sh