FROM kasmweb/core:1.8.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########


RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y \
powershell \
code

RUN wget https://github.com/m05tr0-DevOps/KasmImages/blob/main/IMG_20201107_134647_Bokeh.jpg?raw=true -O $HOME/.config/bg_kasm.png

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
