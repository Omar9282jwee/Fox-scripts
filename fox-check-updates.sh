#!/bin/bash

echo "🔍 Checking for system updates..."

if command -v apt >/dev/null 2>&1; then
    sudo apt update > /dev/null
    UPDATES=$(apt list --upgradable 2>/dev/null | grep -v "Listing..." | wc -l)
    if [ "$UPDATES" -eq 0 ]; then
        echo "✅ No updates available."
    else
        echo "⚠️ $UPDATES update(s) available:"
        apt list --upgradable 2>/dev/null | grep -v "Listing..."
    fi
else
    echo "❌ Unsupported OS. Only Debian/Ubuntu supported in this version."
fi
