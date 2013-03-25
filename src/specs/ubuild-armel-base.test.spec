# This is an ubuild molecule .spec file that aims to create
# an armel (armv7, softfp) image.

execution_strategy: ubuild

# Directory in where the build process will take place
build_dir: /var/tmp/ubuild_build

# Directory in where builds are cached
cache_dir: cache/

# Directory in where the final image will be placed
destination_dir: /var/tmp/ubuild_out

# Name of the final system image
image_name: ubuild_armel.test.img

# Directory in where the source tarballs are expected to be found.
sources_dir: sources/

# The base root filesystem directory, containing the base set of
# files that are expected to be found in the final image.
rootfs_dir: rootfs/

cross_build_pkg:
    gmp-4.3.2.tar.bz2 scripts/cross_build_gmp.sh scripts/armel/cross_build_env

cross_patch_pkg:
    gmp-4.3.2.tar.bz2 patches/gmp-4.3.2-ABI-multilib.patch

cache_variables:
    CFLAGS, CPPFLAGS, CXXFLAGS, LDFLAGS,
    ARCH, ABI, GMPABI, MAKEOPTS

cross_pre_build: scripts/cross_pre_build.sh armel

cross_post_build: scripts/cross_post_build.sh armel

# TODO, add:
# - {build,patch}_pkg
# - pre_build
# - post_build
# - build_image