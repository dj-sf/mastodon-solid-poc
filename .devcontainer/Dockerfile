# For details, see https://github.com/devcontainers/images/tree/main/src/ruby
FROM mcr.microsoft.com/devcontainers/ruby:1-3.2-bullseye

# Switch to system Ruby and uninstall RVM
RUN /bin/bash -lc "rvm use system" \
    && /bin/bash -lc "rvm implode --force" \
    && rm -rf /usr/local/rvm \
    && NEW_PATH=$(echo $PATH | awk -v RS=: -v ORS=: '/rvm/ {next} {print}' | sed 's/:$//') \
    && echo "export PATH=$NEW_PATH" >> /home/vscode/.bashrc \
    && echo "unset GEM_HOME GEM_PATH" >> /home/vscode/.bashrc

# Initialize rbenv and set Ruby version
USER vscode
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vscode/.bashrc \
    && echo 'eval "$(rbenv init -)"' >> /home/vscode/.bashrc \
    && /bin/bash -l -c "rbenv global system"

# Install Rails
# RUN gem install rails webdrivers

# Run gem env to check settings
RUN /bin/bash -l -c "gem env"

USER root

# Change ownership for the Ruby gems directory
RUN chown -R vscode:vscode /usr/local/lib/ruby/gems/3.2.0
RUN chown -R vscode:vscode /usr/local/bin

# Install Node.js
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
