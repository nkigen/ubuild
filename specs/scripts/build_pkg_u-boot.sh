#!/bin/bash

. build.include
. toolchain.include

# @DESCRIPTION: bmake wrapper for the Linux kernel build system calls. It
# automatically appends the cross compiler options.
# @USAGE: xkmake [ærgs]
xubmake() {
    # u-boot build system freaks out if LDFLAGS contains spaces
    LDFLAGS="" bmake -C "${S}" ARCH="${ARCH}" CROSS_COMPILE="${CTARGET}-" \
        O="${BUILD_DIR}" "${@}"
}

src_prepare() {
    build_src_prepare || return 1
    cross_setup_environment || return 1
}

src_configure() {
    cd "${BUILD_DIR}" || return 1
    xubmake distclean || return 1
    xubmake "${UBOOT_DEFCONFIG}" || return 1
}

src_compile() {
    cd "${BUILD_DIR}" || return 1
    xubmake || return 1
}

src_install() {
    mkdir "${TARGET_DIR}" || return 1
    mkdir "${TARGET_DIR}/boot" || return 1
    if [ -f MLO ]; then
	    cp MLO "${TARGET_DIR}/boot/" || return 1
    elif [ -f u-boot.imx ]; then
	    cp u-boot.imx "${TARGET_DIR}/boot/" || return 1
    fi
    cp "${UBOOT_IMAGE_NAME}" "${TARGET_DIR}/boot/" || return 1
}

main
