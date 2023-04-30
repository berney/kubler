# syntax=docker/dockerfile:1

# Global ARGS can be used in FROM lines, need to come before the first FROM.
ARG BASE_IMAGE=gentoo/stage3:musl-hardened

# I have portage copied as a layer into stage3 now
#FROM kubler-gentoo/portage AS portage

FROM $BASE_IMAGE

# glibc
ARG BOB_CHOST="x86_64-pc-linux-gnu"
# musl
#ARG BOB_CHOST="x86_64-gentoo-linux-musl"

ARG BOB_CFLAGS="--mtune=generic -O2 -pipe"
ARG BOB_CXXFLAGS=$BOB_CFLAGS
ARG BOB_BUILDER_CHOST=$BOB_CHOST
ARG BOB_BUILDER_CFLAGS=$BOB_CFLAGS
ARG BOB_BUILDER_CXXFLAGS=$BOB_CXXFLAGS

# DEF_BUILDER_* is only active in configure_bob() hook, generally only differs when using crossdev
ENV DEF_CHOST="${BOB_CHOST}" \
    DEF_CFLAGS="${BOB_CFLAGS}" \
    DEF_CXXFLAGS="${BOB_CXXFLAGS}" \
    DEF_BUILDER_CHOST="${BOB_BUILDER_CHOST}" \
    DEF_BUILDER_CFLAGS="${BOB_BUILDER_CFLAGS}" \
    DEF_BUILDER_CXXFLAGS="${BOB_BUILDER_CXXFLAGS}" \
    PKGDIR="/packages/${BOB_CHOST}"

COPY etc/ /etc/
COPY build-root.sh /usr/local/bin/kubler-build-root
COPY sed-or-die.sh /usr/local/bin/sed-or-die
COPY bashrc.sh /root/.bashrc
COPY portage-git-sync.sh /usr/local/bin/portage-git-sync

CMD ["/bin/bash"]
