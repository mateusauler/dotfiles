#!/bin/bash

sudo mount /dev/sda2 /mnt
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo umount /mnt
