#!/bin/bash
set -e
source /pd_build/buildconfig

## Many Ruby gems and NPM packages contain native extensions and require a compiler.
run minimal_apt_get_install build-essential
## Bundler has to be able to pull dependencies from git.
run minimal_apt_get_install git
## JRuby94 at least requires netbase, and other client stuff must.
run minimal_apt_get_install netbase

# Install wkhtmltopdf

#amd64
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb \
  && dpkg -i wkhtmltox_0.12.6-1.focal_amd64.deb \
  && rm wkhtmltox_0.12.6-1.focal_amd64.deb

#arm64 https://github.com/wkhtmltopdf/packaging/issues/98
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.stretch_arm64.deb \
  && dpkg -i wkhtmltox_0.12.6-1.stretch_arm64.deb \
  && rm wkhtmltox_0.12.6-1.stretch_arm64.deb

# Nodejs
run curl -sL https://deb.nodesource.com/setup_12.x | bash -
minimal_apt_get_install nodejs
