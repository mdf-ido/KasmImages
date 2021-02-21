FROM kasmweb/core:1.8.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########


RUN apt-get update && apt-get install -y \
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
    libappindicator1 \
    libasound2 \
    wget \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.1.0-amd64.deb -O /tmp/slack-desktop-2.1.0-amd64.deb && \
    cd /tmp/ && \
    dpkg -i slack-desktop-2.1.0-amd64.deb && \
    rm -rf /tmp/slack-desktop*.deb

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

# Autorun Slack
CMD ["/usr/lib/slack/slack"]


######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
