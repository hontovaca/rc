FROM vaca/s6

RUN apk -U add luajit lua5.1-filesystem lua5.1-lyaml s6-rc@testing && rm -f /var/cache/apk/*
COPY over /
