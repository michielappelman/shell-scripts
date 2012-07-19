#!/bin/bash
# This is a script to semi-automate adding a serial console connection to a KVM host on a proxmox environment.

if [ $# -ne 1 ] ; then
  echo "No VMID given..."
  exit 1
fi
vmid=$1
qm set $vmid -args "-serial unix:/var/run/qemu-server/$vmid.serial,server,nowait"
echo "pu port             unix#/var/run/qemu-server/$vmid.serial" > /etc/minicom/minirc.$vmid
echo "pu minit" >> /etc/minicom/minirc.$vmid
echo "pu mreset" >> /etc/minicom/minirc.$vmid

echo " --- ON THE GUEST ---"
echo "==> Edit /etc/default/grub: "
echo "12: GRUB_CMDLINE_LINUX=\"console=ttyS0\""
echo "==> Run: sudo grub-mkconfig"
echo ""
echo "==> Edit /etc/init/ttyS0.conf"
echo "# ttyS0 - getty"
echo "#"
echo "# This service maintains a getty on tty1 from the point the system is"
echo "# started until it is shut down again."
echo ""
echo "start on stopped rc RUNLEVEL=[2345]"
echo "stop on runlevel [!2345]"
echo ""
echo "respawn"
echo "exec /sbin/getty -8 38400 ttyS0"
echo "==> Run: sudo start ttyS0"

exit 0