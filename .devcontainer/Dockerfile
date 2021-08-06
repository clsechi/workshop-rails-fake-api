# [Choice] Ruby version: 2, 2.7, 2.6, 2.5
ARG VARIANT=2
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}

# Install Rails
RUN gem install rails -v "~> 6.1" && \
    gem install webdrivers 

# Default value to allow debug server to serve content over GitHub Codespace's port forwarding service
# The value is a comma-separated list of allowed domains 
ENV RAILS_DEVELOPMENT_HOSTS=".githubpreview.dev"

# [Choice] Node.js version: lts, 16, 14, 12
ARG NODE_VERSION="lts/*"
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment this line to install additional gems.
# RUN gem install <your-gem-names-here>

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1

# [Optional] Uncomment if you want to keep terminal history
# You must mount a volume with target=HISTFOLDER
ARG HISTFOLDER=/commandhistory

RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=${HISTFOLDER}/.history" \
    && mkdir ${HISTFOLDER} \
    && touch ${HISTFOLDER}/.history \
    && chown -R vscode ${HISTFOLDER} \
    && echo $SNIPPET >> "/home/vscode/.bashrc" \
    && echo $SNIPPET >> "/home/vscode/.zshrc"

# Change default user shell to zsh
RUN chsh -s $(which zsh) root && chsh -s $(which zsh) vscode

# Install terminal
USER vscode
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
    -t https://github.com/denysdovhan/spaceship-prompt \
    -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
    -p git \
    -p ruby \
    -p rails \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-history-substring-search \
    -p https://github.com/zsh-users/zsh-syntax-highlighting
