#!/bin/bash

set -euo pipefail

readonly target_dir=subtitles

main() {
	if ! cd -- "$target_dir"; then
		echo "can't cd to $target_dir"
		exit 1
	fi

	if ! command -v fdupes; then
		echo "fdupes is not installed."
		exit 1
	fi

	fdupes -q -rdNI --order=time --reverse --nohidden .
	find . -empty -delete
}

main "$@"
