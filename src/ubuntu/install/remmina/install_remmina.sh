#!/usr/bin/env bash
 apt-get update && \
 apt-get install -y \
	remmina \
	remmina-plugin-exec \
	remmina-plugin-nx \
	remmina-plugin-rdp \
	remmina-plugin-spice \
	remmina-plugin-telepathy \
	remmina-plugin-vnc \
	remmina-plugin-xdmcp && \
apt-get clean