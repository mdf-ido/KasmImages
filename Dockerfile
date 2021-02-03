FROM kasmweb/core:1.8.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########


RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
# Register the Microsoft 1repository GPG keys
&& dpkg -i packages-microsoft-prod.deb
# Enable the "universe" repositories

RUN pwsh Install-Module -Name AWS.Tools.Installer -Force
RUN pwsh Install-Module -Name Az -AllowClobber -Scope AllUsers -Force



######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
