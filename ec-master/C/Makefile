modname := junk
obj-m := junk.o
junk-y := device.o master.o module.o linux_kif.o ../obj/demo.x

default:
	make -C /lib/modules/3.16.0-4-amd64/build M=/home/jan/MMS/programs-KERNEL/ec-master/C modules

clean:
	rm -f *.o
	rm -f ./.*.*.cmd
	rm -f *.ko
