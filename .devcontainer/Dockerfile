# For details, see https://github.com/devcontainers/images/tree/main/src/ruby
FROM mcr.microsoft.com/devcontainers/ruby:1-3.2-bullseye

# Switch to system Ruby and uninstall RVM.
# ALSO remove RVM from the path for both vscode AND root users.
RUN /bin/zsh -lc "rvm use system" \
    && /bin/zsh -lc "rvm implode --force" \
    && rm -rf /usr/local/rvm \
    && NEW_PATH=$(echo $PATH | awk -v RS=: -v ORS=: '/rvm/ {next} {print}' | sed 's/:$//') \
    && echo "export PATH=$NEW_PATH" >> /home/vscode/.zshrc \
    && echo "unset GEM_HOME GEM_PATH" >> /home/vscode/.zshrc \
    && echo "export PATH=$NEW_PATH" >> ~/.zshrc \
    && echo "unset GEM_HOME GEM_PATH" >> ~/.zshrc
RUN /bin/zsh -l -c "gem env"

# Initialize rbenv and set Ruby version for both ROOT user and vscode user
# Also Install Ruby 3.2.2 using rbenv and set as global default
USER vscode
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vscode/.zshrc \
    && echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc \
    && /bin/zsh -lc "rbenv install 3.2.2" \
    && /bin/zsh -lc "rbenv global 3.2.2" \
    && echo 'eval "$(rbenv init -)"' >> /home/vscode/.zshrc \
    && echo 'eval "$(rbenv init -)"' >> ~/.zshrc

RUN /bin/zsh -l -c "gem env"


# RUN /bin/zsh -lc "rbenv install 3.2.2" \
#     && /bin/zsh -lc "rbenv global 3.2.2"

RUN /bin/zsh -l -c "gem env"
# Install Rails
# RUN gem install rails webdrivers

# Run gem env to check settings
RUN /bin/zsh -l -c "gem env"

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

# # RUN su vscode -c "echo $PATH"
# RUN echo "root GEM ENVIRONMENT"
# RUN gem env

# # vscode user GEM ENVIRONMENT
# RUN echo "root GEM ENVIRONMENT"
# RUN su vscode -c "gem env"

# [Optional] Uncomment this line to install global node packages.
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g yarn" 2>&1

COPY welcome-message.txt /usr/local/etc/vscode-dev-containers/first-run-notice.txt
