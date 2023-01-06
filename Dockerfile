FROM alpine:edge

ARG AUUID="a5f0915e-7d61-4761-8c53-35b60df48cdf"
ARG CADDYIndexPage="https://www.free-css.com/assets/files/free-css-templates/download/page274/agency-perfect.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
