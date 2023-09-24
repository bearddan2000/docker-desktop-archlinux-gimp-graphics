FROM archlinux

ENV APP gimp

ENV DISPLAY :0

ENV USERNAME developer

WORKDIR /app

# update
RUN	pacman -Syy

RUN pacman -S --noconfirm reflector

RUN reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

# install
RUN pacman -S --noconfirm $APP

RUN useradd --system -s /usr/bin/nologin $USERNAME

USER $USERNAME

WORKDIR /home/$USERNAME

CMD "${APP}"