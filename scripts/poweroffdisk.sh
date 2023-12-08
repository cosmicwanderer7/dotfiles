#!/bin/bash

# Specify the devices
device1="/dev/sda1"
device2="/dev/sda2"

# Check if the first device is mounted
if grep -qs "$device1" /proc/mounts; then
    # Unmount and power off the first device
    echo "Unmounting $device1..."
    udisksctl unmount -b "$device1" > /dev/null 2>&1
    echo "Powering off $device1..."
    udisksctl power-off -b "$device1" > /dev/null 2>&1
fi

# Check if the second device is mounted
if grep -qs "$device2" /proc/mounts; then
    # Unmount and power off the second device
    echo "Unmounting $device2..."
    udisksctl unmount -b "$device2" > /dev/null 2>&1
    echo "Powering off $device2..."
    udisksctl power-off -b "$device2" > /dev/null 2>&1
fi

udisksctl power-off -b /dev/sda > /dev/null 2>&1

# Power off the system using systemctl
echo "Shutting down the system..."
systemctl poweroff > /dev/null 2>&1
