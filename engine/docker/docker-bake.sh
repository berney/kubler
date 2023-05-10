#!/bin/sh

set -eux

echo "== Build Portage"
cd bob-portage || exit 1
# Repeating `--set` adds to the array
# - https://github.com/docker/buildx/issues/872
# - Doing it this way results in one image (repository hash) with two tags
# - doing separate `TAG=xxx docker buildx bake` commands results in two different images (repository hashes), with identical layers, and near identical metadata.
docker buildx bake --load --set kubler-portage.tags=kubler-gentoo/portage:latest --set kubler-portage.tags=kubler-gentoo/portage:buildx2
cd ..

echo "== Build Stage3"
cd bob-stage3 || exit 1
BASE_TAG=musl-hardened docker buildx bake --load --set gentoo-stage3.tags=kubler-gentoo/stage3-amd64-musl-hardened:latest --set gentoo-stage3.tags=kubler-gentoo/stage3-amd64-musl-hardened:20230423T164653Z
cd ..

echo "== Build bob-musl-core"
cd bob-core || exit 1
BASE_IMAGE=kubler-gentoo/stage3-amd64-musl-hardened docker buildx bake --load --set core.tags=kubler/bob-musl-core:latest --set core.tags=kubler/bob-musl-core:buildx2
cd ..
