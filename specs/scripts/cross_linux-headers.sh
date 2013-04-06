#!/bin/bash

. build.include
. toolchain.include

src_configure() {
    :;
}

src_compile() {
    BUILD_DIR="${S}" \
        bmake -j1 ARCH="${ARCH}" CROSS_COMPILE="${CTARGET}-" \
        O="${BUILD_DIR}" headers_check
}

src_install() {
    BUILD_DIR="${S}" \
        bmake -j1 ARCH="${ARCH}" CROSS_COMPILE="${CTARGET}-" \
        INSTALL_HDR_PATH="${TARGET_DIR}/usr" \
        O="${BUILD_DIR}" headers_install || return 1
}

main