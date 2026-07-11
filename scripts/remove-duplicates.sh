#!/bin/bash

set -euxo pipefail

readonly target_dir=subtitles

main() {
	if ! [[ -d $target_dir ]]; then
		echo "not a directory: $target_dir"
		exit 1
	fi

	if ! [[ -x $(command -v fdupes) ]]; then
		echo "fdupes is not installed."
		exit 1
	fi

	fdupes -q -rdNI --order=time --reverse --nohidden "$target_dir"
	find "$target_dir" -empty -delete
}

main "$@"
