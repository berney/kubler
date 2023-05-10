# syntax=docker/dockerfile:1

# Global ARGS can be used in FROM lines, need to come before the first FROM.
ARG BASE_IMAGE=gentoo/stage3:musl-hardened

# I have portage copied as a layer into stage3 now
#FROM kubler-gentoo/portage AS portage

FROM $BASE_IMAGE

# musl use `x86_64-gentoo-linux-musl`
ENV DEF_CHOST="x86_64-pc-linux-gnu"
ENV DEF_CFLAGS="-mtune=generic -O2 -pipe"
ENV DEF_CXXFLAGS="${DEF_CFLAGS}"
# DEF_BUILDER_* is only active in configure_bob() hook, generally only differs when using crossdev
ENV DEF_BUILDER_CHOST="${DEF_CHOST}"
ENV DEF_BUILDER_CFLAGS="${DEF_CFLAGS}"
ENV DEF_BUILDER_CXXFLAGS="${DEF_CXXFLAGS}"
ENV PKGDIR="/packages/${DEF_CHOST}"

COPY etc/ /etc/
COPY build-root.sh /usr/local/bin/kubler-build-root
COPY sed-or-die.sh /usr/local/bin/sed-or-die
COPY bashrc.sh /root/.bashrc
COPY portage-git-sync.sh /usr/local/bin/portage-git-sync

CMD ["/bin/bash"]
