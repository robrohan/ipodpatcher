# iPod Patcher and iPod Loader

The code here is how I successfully loaded Rockbox onto an old video ipod 5th 
generation in 2024.

## High Level Steps

Here are the high level steps:

1. Have an ipod formatted on windows using iTunes (needs to be fat32 file system)
1. Use "ipodpatcher" to backup ipod firmware (see `Makefile`)
1. Build the boot loader in order to duel boot ipod os and linux - "ipodloader2" (see `Makefile`)
1. Copy the boot loader config (`./firmware/loader.conf`) to the root of the ipod
1. Copy the [correct version of Rockbox](https://www.rockbox.org/daily.shtml) 
onto the ipod mounted file system in the `/.rockbox` directory.
1. Reboot reboot the ipod (by holding down `Menu + Select` for 6 seconds) and select
either ipod OS or rockbox.

## Code and What it Does

The code was "forked" from:

- [ipodpatcher](https://github.com/mguentner/rockbox/blob/master/rbutil/ipodpatcher/)
- [ipodloader2](https://github.com/crozone/ipodloader2)
- Download the correct [Rockbox Firmware archive from the Rockbox website](https://www.rockbox.org/download/byhand.cgi). Note I had to use the nightly build for my ipod video 5th gen.

```
unzip ~/Downloads/rockbox-ipodvideo-20241102.zip
rm -rf /media/rob/ROBS\ IPOD/.rockbox/
mv ~/Downloads/rockbox-ipodvideo-20241102/.rockbox /media/rob/ROBS\ IPOD/
```

- reboot it by holding down Menu + Select for 6 seconds.

--- 

## Background

I am resurrecting my old ipod, and, while I love the ipod os, it's become a pain
to use itunes to sync music in 2024 (apple has moved on to streaming over
syncing)

I decided to try to put "rockbox" on my ipod which will let you just drag and
drop music files onto the ipod - see: http://www.ipodlinux.org/

Sadly most of the required tools are old, not maintained, or hard to find. The
first tool I seemed to need is this tool.

## Linux Users

This application seems to still work - so far it at least it compiles, and can
see my ipod on Ubuntu 24.04.

## Mac Users

Currently this will not compile on a modern Mac (2024). The only reason 
seemingly being it needs:

```
-framework IOKit
```

and the header files

```
#include <IOKit/scsi-commands/SCSITaskLib.h>
#include <IOKit/scsi-commands/SCSICommandOperationCodes.h>
```

Which Apple stopped supporting a while ago. I might try to look into this in
the future, but for now, you'll have much better luck just getting your hands
on a Linux box.

## Windows Users

I have not tried windows yet.

## References

- https://www.rockbox.org/
- http://www.ipodlinux.org/
- https://www.rockbox.org/daily.shtml
- https://github.com/Rockbox/rockbox
- https://github.com/mguentner/rockbox/blob/master/rbutil/ipodpatcher/
- https://github.com/crozone/ipodloader2
