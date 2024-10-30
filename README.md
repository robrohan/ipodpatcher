# iPod Patcher

This application lets you load and restore firmware on old ipods.

It was originally written by:
```
(C) Dave Chapman 2006-2009
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

And this code was "forked" from: 

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

- http://www.ipodlinux.org/
- https://github.com/Rockbox/rockbox
- https://github.com/mguentner/rockbox/blob/master/rbutil/ipodpatcher/
