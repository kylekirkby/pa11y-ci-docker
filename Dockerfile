FROM buildkite/puppeteer:latest
# NPM Config
RUN npm -g config set user root
ENV NPM_CONFIG_LOGLEVEL=warn \
    NPM_CONFIG_PROGRESS=false \
    NPM_CONFIG_SPIN=false
# Install the pa11y-ci tool
RUN npm install -g pa11y-ci
# Install the pa11y-ci-reporter-html tool
RUN npm install -g pa11y-ci-reporter-html
# Create our working directory
WORKDIR /app
COPY pa11y-config.json /app
# Run everything after as non-privileged user.
RUN useradd -ms /bin/bash  pptruser
USER pptruser
