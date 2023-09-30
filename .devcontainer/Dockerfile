# For details, see https://github.com/devcontainers/images/tree/main/src/ruby
FROM mcr.microsoft.com/devcontainers/ruby:1-3.2-bullseye

# Uninstall RVM
RUN /bin/bash -lc "rvm implode --force" \
    && rm -rf /usr/local/rvm \
    && sed -i '/rvm/d' ~/.bashrc


# Remove references to RVM from path
ENV PATH="/usr/local/share/rbenv/bin:/usr/local/share/nvm/versions/node/v16.20.2/bin:/usr/local/bundle/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin"

# Install Rails
# RUN gem install rails webdrivers

ARG NODE_VERSION="16"
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends libicu-dev libidn11-dev ffmpeg imagemagick libpam-dev

# [Optional] Uncomment this line to install additional gems.
RUN gem install foreman

# [Optional] Uncomment this line to install global node packages.
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g yarn" 2>&1

COPY welcome-message.txt /usr/local/etc/vscode-dev-containers/first-run-notice.txt
