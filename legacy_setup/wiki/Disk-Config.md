# Disk Configurations
## List block devices
```
$ lsblk -f
NAME        FSTYPE   FSVER LABEL        UUID                                 FSAVAIL FSUSE% MOUNTPOINTS
loop6       squashfs 4.0                                                           0   100% /snap/core18/2622
loop7       squashfs 4.0                                                           0   100% /snap/ngrok/91
sda
├─sda1      ext4     1.0   usb-ext-hdd1 963ea240-25b3-4efe-aeac-fd89ce4a3c6a
└─sda2      ext4     1.0   usb-ext-hdd2 019f78be-f93d-4468-b5e6-518f9ee02428
mmcblk0
├─mmcblk0p1 vfat     FAT32 system-boot  D7E2-9D99                             104.6M    58% /boot/firmware
└─mmcblk0p2 ext4     1.0   writable     b09bb4c8-de4d-4ce6-a93f-30c4c9241a58  213.8G     5% /
```
## Create partition
```
$ sudo fdisk /dev/sda

Welcome to fdisk (util-linux 2.37.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help):

...
- Enter 'n' to create partition
- Enter 'p' to make primary parition
- Enter '1' to make the partition number 1 (e.g. /dev/sda1)
- Enter 'w' to write the changes
```

## Create file system
```
$ sudo mkfs -t ext4 /dev/sda1
mke2fs 1.46.5 (30-Dec-2021)
/dev/sda1 contains a ext4 file system labelled 'usb-ext-hdd1'
        created on Sat Nov  5 16:56:12 2022
Proceed anyway? (y,N) y
Creating filesystem with 167390000 4k blocks and 41852928 inodes
Filesystem UUID: 3a3c7321-3beb-44c9-aae5-28b1e0271efa
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
        4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
        102400000

Allocating group tables: done
Writing inode tables: done
Creating journal (262144 blocks):
done
Writing superblocks and filesystem accounting information: done
```

## Set `label` to partition
```
$ sudo e2label /dev/sda1 usb-ext-hdd1
```

## Mount partition
```
# Mount
$ sudo mount -t ext4 /dev/sda1 /media/disk1
```
## Delete partition
```
$ sudo fdisk /dev/sda

Welcome to fdisk (util-linux 2.37.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Command (m for help):

...
- Enter 'p' for list of partitions
- Enter 'd' for delete partition
- Enter 'w' to write the changes
```

### fstab config
```
$ cat /etc/fstab
...
LABEL="usb-ext-hdd1" /media/disk1 ext4 rw,async,noauto 0 0
LABEL="usb-ext-hdd2" /media/disk2 ext4 rw,async,noauto 0 0
```