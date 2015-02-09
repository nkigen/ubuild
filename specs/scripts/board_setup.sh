#!/bin/bash
# Creates a skeleton for generating a kernel image for a new board
# NOTE: This is just a skeleton. You have to modify the generated files to your specs!!
# (2015) nelson kigen<nellyk89@gmail.com>

set -x
BOARD_NAME="test_board"
SPEC_DIR=`pwd`/.. #ubuild/specs


arch_env(){
	mkdir -p ${SPEC_DIR}/architecture_env/${BOARD_NAME}
	ARCH_DIR=${SPEC_DIR}/architecture_env/${BOARD_NAME}
	cp -r ${ARCH_DIR}/../armel ${ARCH_DIR}/../armhf ${ARCH_DIR}
	echo " Finished generating architecture_env in "${ARCH_DIR}
}

board_env(){
	BOARD_DIR=$SPEC_DIR"/board_env"
	touch ${BOARD_DIR}/${BOARD_NAME}_env
	cp ${BOARD_DIR}/beagleboard_env ${BOARD_DIR}/${BOARD_NAME}_env
	echo " Finished generating "$BOARD_DIR/$BOARD_NAME"_env "

}

kernel(){
	KERNEL_DIR=$SPEC_DIR"/kernel"
	touch $KERNEL_DIR"/"$BOARD_NAME"_config"
	cp $KERNEL_DIR"/armv7_config" $KERNEL_DIR"/"$BOARD_NAME"_config"
	echo " Finished generating "$KERNEL_DIR"/"$BOARD_NAME"_config "
}

boot(){
	BOOT_DIR=$SPEC_DIR"/boot"
	touch $BOOT_DIR"/"$BOARD_NAME".uEnv.txt"
	echo " Finished generating "$BOOT_DIR"/"$BOARD_NAME".uEnv.txt "
}

headers(){
	HEADERS_DIR=$SPEC_DIR"/headers"
	#TODO: check if dir exists then skip
	mkdir -p $HEADERS_DIR"/"$BOARD_NAME
	cd  $HEADERS_DIR"/"$BOARD_NAME
	#we copy from the beagleboard spec dir
	cp ../beagleboard/base.arm.bootloader.header .
	cp ../beagleboard/base.arm.crosscompiler.header .
	cp ../beagleboard/base.arm.userspace.header .
	cp ../beagleboard/base.arm.kernel.header .
	cp ../beagleboard/base.arm.ubuildsettings.header .

	#Now generate the base.{BOARD_NAME}.header file
	touch "base."${BOARD_NAME}".header"
	echo "# Header file used for building base "$BOARD_NAME" BeagleBoard images\n\n" >  "base."${BOARD_NAME}".header"
	echo "#include base.arm.ubuildsettings.header" >>  "base."${BOARD_NAME}".header"
	echo "[ubuild]" >>  "base."${BOARD_NAME}".header"
	echo "env=../../board_env/"${BOARD_NAME} >>  "base."${BOARD_NAME}".header"
	echo "#include base.arm.crosscompiler.header" >>  "base."${BOARD_NAME}".header"
	echo "#include base.arm.kernel.header" >>  "base."${BOARD_NAME}".header"
	echo "[pkg=kernel]" >>  "base."${BOARD_NAME}".header"
	echo "sources=<your source name here>" >>  "base."${BOARD_NAME}".header"
	echo "url=<URL to your sources here>" >>  "base."${BOARD_NAME}".header"
	echo "#include base.arm.bootloader.header" >>  "base."${BOARD_NAME}".header"
	echo "#include base.arm.userspace.header" >>  "base."${BOARD_NAME}".header"
	
	echo " Finished generating the headers in "`pwd`
}

#copies all the patches from beagleboard to $BOARD_NAME
patches(){
	PATCH_DIR=$SPEC_DIR"/patches"
	mkdir -p $PATCH_DIR"/"$BOARD_NAME
	cp -r $PATCH_DIR"/beagleboard/*" $PATCH_DIR"/"$BOARD_NAME
	echo " Finished generating the patches in "$PATCH_DIR"/"$BOARD_NAME
}

spec(){
	MBSPEC_DIR=${SPEC_DIR}/spec/${BOARD_NAME}
	mkdir -p $MBSPEC_DIR
	HF_SPEC_FILE=${MBSPEC_DIR}/ubuild-armhf-base.${BOARD_NAME}.spec
	echo "#include ../../headers/wandboard/base.wandboard.header" > $HF_SPEC_FILE
	echo "[ubuild]" >>$HF_SPEC_FILE
 	echo "build_dir = /var/tmp/ubuild."${BOARD_NAME}"-armhf.build_dir" >>$HF_SPEC_FILE
	echo "compile_dir = /var/tmp/ubuild."${BOARD_NAME}"-armhf.compile_dir" >>$HF_SPEC_FILE
	echo "cache_dir = ../../../cache/"${BOARD_NAME}".armhf.cache/" >>$HF_SPEC_FILE
	echo "image_name = armv7l.hardfp."${BOARD_NAME}".img.xz" >>$HF_SPEC_FILE
	echo "env = ../../architecture_env/"${BOARD_NAME}"/armhf/env" >>$HF_SPEC_FILE
	echo "cross_env = ../../architecture_env/"${BOARD_NAME}"/armhf/cross_env" >>$HF_SPEC_FILE

	echo " Finished generating architecture_env files in "$MBSPEC_DIR

}


main(){
	arch_env
	board_env
	kernel
	boot
	headers
	patches
	spec
}

main
