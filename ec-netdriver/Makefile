modname := ec_e1000e
obj-m := $(modname).o
$(modname)-y := 82571-3.16-ethercat.o \
		ethtool-3.16-ethercat.o \
		ich8lan-3.16-ethercat.o \
		netdev-3.16-ethercat.o \
		param-3.16-ethercat.o \
		phy-3.16-ethercat.o \
		80003es2lan-3.16-ethercat.o \
		mac-3.16-ethercat.o \
		manage-3.16-ethercat.o \
		nvm-3.16-ethercat.o \
		ptp-3.16-ethercat.o


KVERSION := $(shell uname -r)
KDIR := /lib/modules/$(KVERSION)/build
PWD := "$$(pwd)"

ifdef DEBUG
CFLAGS_$(obj-m) := -DDEBUG
endif

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) O=$(PWD) -C $(KDIR) M=$(PWD) clean

load:
	-rmmod $(modname)
	insmod $(modname).ko

install:
	mkdir -p /lib/modules/$(KVERSION)/misc/$(modname)
	install -m 0755 -o root -g root $(modname).ko /lib/modules/$(KVERSION)/misc/$(modname)
	depmod -a

uninstall:
	rm /lib/modules/$(KVERSION)/misc/$(modname)/$(modname).ko
	rmdir /lib/modules/$(KVERSION)/misc/$(modname)
	rmdir /lib/modules/$(KVERSION)/misc
	depmod -a
