#!/usr/bin/env bash

function main() {
    fetch_stage3_archive_name
    # shellcheck disable=SC2154
    echo "$__fetch_stage3_archive_name"
}

main "$@"
