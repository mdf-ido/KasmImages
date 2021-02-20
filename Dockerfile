FROM kasmweb/core:1.8.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

##Install Posh
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y powershell

#Install Citrix Workspace App
RUN apt-get install -y libwebkit2gtk-4.0-37
RUN curl https://downloads.citrix.com/19130/icaclient_21.1.0.14_amd64.deb?__gda__=1613797686_3bffb96b1e44eec5d0228040cca796bf -o ctxwrkspace.deb \
    && dpkg -i ctxwrkspace.deb
RUN apt-get -f install && dpkg -i ctxwrkspace.deb

#Add background
RUN wget https://github.com/m05tr0-DevOps/KasmImages/blob/main/IMG_20201107_134647_Bokeh.jpg?raw=true -O $HOME/.config/bg_kasm.png

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000