#!/bin/bash

sudo mount /dev/sdc2 /mnt
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo umount /mnt
