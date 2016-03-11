#!/sbin/busybox sh
set +x
_PATH="$PATH"
export PATH=/sbin

/lvm/sbin/lvm vgscan --mknodes --ignorelockingfailure
/lvm/sbin/lvm vgchange -aly --ignorelockingfailure
