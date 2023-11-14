#!/bin/bash
set -e
source /pd_build/buildconfig

## Many Ruby gems and NPM packages contain native extensions and require a compiler.
run minimal_apt_get_install build-essential
## Bundler has to be able to pull dependencies from git.
run minimal_apt_get_install git
## JRuby94 at least requires netbase, and other client stuff must.
run minimal_apt_get_install netbase
## utilities needed to add apt ppas
run minimal_apt_get_install curl gnupg ca-certificates

# Install wkhtmltopdf
run minimal_apt_get_install libcurl4-openssl-dev libfontenc1 xfonts-75dpi xfonts-base xfonts-encodings xfonts-utils fontconfig \
                            fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 \
                            libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 \
                            libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 \
                            libstdc++6 libx11-6 libxtst6 lsb-release wget xdg-utils

RUN wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb \
  && dpkg -i libssl1.1_1.1.0g-2ubuntu4_amd64.deb

#amd64
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb \
  && dpkg -i wkhtmltox_0.12.6-1.focal_amd64.deb \
  && rm wkhtmltox_0.12.6-1.focal_amd64.deb

#arm64 https://github.com/wkhtmltopdf/packaging/issues/98
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_arm64.deb \
  && dpkg -i wkhtmltox_0.12.6.1-2.jammy_arm64.deb \
  && rm wkhtmltox_0.12.6.1-2.jammy_arm64.deb

# imagemagick
run minimal_apt_get_install imagemagick
run apt-get update && minimal_apt_get_install libmagickwand-dev

# Nodejs
run curl -sL https://deb.nodesource.com/setup_16.x | bash -
minimal_apt_get_install nodejs
