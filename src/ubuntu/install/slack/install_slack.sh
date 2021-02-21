#!/usr/bin/env bash

apt-get update && apt-get install -y \
    apt-utils \
    dbus-x11 \
    dunst \
    hunspell-en-us \
    python3-dbus \
    software-properties-common \
    libx11-xcb1 \
    gconf2 \
    libgtk2.0-0 \
    libnotify4 \
    libxtst6 \
    libnss3 \
    gvfs-bin \
    xdg-utils \
    apt-transport-https \
    libgnome-keyring0 \
    gir1.2-gnomekeyring-1.0 \
    libappindicator3-1 \
    libasound2 \
    wget \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.13.0-amd64.deb -O /tmp/slack-desktop-4.13.0-amd64.deb && \
    cd /tmp/ && \
    dpkg -i slack-desktop-4.13.0-amd64.deb && \
    apt-get install -f && \
    dpkg -i slack-desktop-4.13.0-amd64.deb && \
    rm -rf /tmp/slack-desktop*.deb