FROM vaca/s6

RUN apk -U add luajit s6-rc@testing && rm -f /var/cache/apk/*
COPY over /
