

help:
	@echo "make all"
	@echo "make clean"

all: build_patcher build_loader

build_patcher:
	cd ./ipodpatcher; \
		make -f Makefile all
	@echo "----------------"
	./ipodpatcher/ipodpatcher -l
	@echo "----------------"

build_loader:
	sudo apt install make
	sudo apt install build-essential
	sudo apt install gcc-arm-none-eabi
	cd ./ipodloader2; \
		make -f Makefile
	@echo "----------------"
	ls -alFh ./ipodloader2/loader.bin
	@echo "----------------"
	cp ./ipodloader2/loader.bin ./firmware/loader.bin

clean:
	cd ./ipodpatcher ; \
		make -f Makefile clean
	cd ./ipodloader2; \
		make -f Makefile clean

#####################################################3

backup:
	mkdir -p firmware

	cd ./ipodpatcher; \
	sudo ./ipodpatcher \
		--read-partition ../firmware/ipod_original_firmware.img

install_ipod:
	sudo ./ipodpatcher/ipodpatcher \
		-ab ./firmware/loader.bin

