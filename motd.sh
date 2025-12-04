#!/bin/bash
# Custom MOTD Installer Script

# Disable default dynamic MOTD scripts
chmod -x /etc/update-motd.d/* 2>/dev/null

# Create custom MOTD
cat << 'EOF' > /etc/motd

[38;5;45m┌─────────────────────────────────────────────────────────────┐[0m
[38;5;45m│                                                             │[0m
[38;5;45m│   _    _           _           _   _           _            │[0m
[38;5;45m│  | |  | |         (_)         | \ | |         | |           │[0m
[38;5;45m│  | |  | |  _ __    _  __  __  |  \| | ___   __| | ___  ___  │[0m
[38;5;45m│  | |  | | | '_ \  | | \ \/ /  | . ` |/ _ \ / _` |/ _ \/ __| │[0m
[38;5;45m│  | |__| | | | | | | |  >  <   | |\  | (_) | (_| |  __/\__ \ │[0m
[38;5;45m│   \____/  |_| |_| |_| /_/\_\  |_| \_|\___/ \__,_|\___||___/ │[0m
[38;5;45m│                                                             │[0m
[38;5;45m└─────────────────────────────────────────────────────────────┘[0m

[38;5;82mWelcome to UnixNodes VPS! 🚀[0m

This server is hosted on [38;5;51mUnixNodes Datacenter[0m.
If you need help or have questions:

📧 Contact Support: [38;5;220msupport@unixnodes.xyz[0m  
🌍 Website: unixnodes.xyz

Quality Wise, No Compromise 😄

EOF

echo "Custom MOTD has been successfully installed!"
