FROM menci/archlinuxarm
ENV LANG=zh_CN.UTF-8 TERM=xterm-256color
COPY pacman.conf /etc
RUN echo "zh_CN.UTF-8 UTF-8">/etc/locale.gen\
 && locale-gen\
 && ln -vsf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime\
 && pacman -Syu --noconfirm --needed --overwrite "*" tmate nginx\
 && rm -rf /var/cache\
 && echo -n 'set -g default-terminal "tmux-256color"'>"$HOME/.tmate.conf"
CMD nginx && exec tmate -F