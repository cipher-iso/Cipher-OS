#!/bin/bash

echo "Scanning for unmounted block devices..."

for device in $(lsblk -lnpo NAME,TYPE | awk '$2 == "part" {print $1}'); do
    if [ -z "$(lsblk -no MOUNTPOINT "$device")" ]; then
        # Try to get label; fallback to device name if empty
        label=$(lsblk -no LABEL "$device" | tr -d ' ')
        if [ -z "$label" ]; then
            label=$(basename "$device")
        fi

        mountpoint="/mnt/$label"

        echo "Mounting $device to $mountpoint..."
        sudo mkdir -p "$mountpoint"
        sudo mount "$device" "$mountpoint"

        if [ $? -eq 0 ]; then
            echo "SUCCESS Mounting $device to $mountpoint"
        else
            echo "FAILED to Mount $device"
        fi
    fi
done

echo "Done."

