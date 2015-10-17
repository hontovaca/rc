FROM vaca/s6

RUN apk -U add s6-rc@testing && rm -f /var/cache/apk/*
