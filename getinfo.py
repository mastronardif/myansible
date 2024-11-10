import socket
import os
import platform

# Get the hostname
hostname = socket.gethostname()

# Get the IP address (first non-loopback interface)
ip_address = socket.gethostbyname(hostname)

# Get OS Information
os_name = platform.system()
os_version = platform.version()

# Get additional system info (if available)
system_info = os.uname() if hasattr(os, 'uname') else "No uname available"

# Output the system information
print(f"Hostname: {hostname}")
print(f"IP Address: {ip_address}")
print(f"OS: {os_name}")
print(f"OS Version: {os_version}")
print(f"System Info: {system_info}")
