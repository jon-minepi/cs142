FROM ruby

WORKDIR /home/$APP_NAME

EXPOSE $PORT

RUN gem install rails bundler
RUN gem install rails
RUN apt-get update
RUN apt-get install -y autoconf \
bison \
build-essential \
g++ \
gcc \
git \
libffi-dev \
libgconf-2-4 \
libgdbm-dev \
libncurses5-dev \
libreadline-dev \
libsqlite3-dev \
libssl-dev \
libxi6 \
libyaml-dev \
make \
sqlite3 \
xvfb \
zip \
zlib1g-dev

RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install --global yarn

# TODO install Chrome
#RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
#RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
#RUN apt-get update
# TODO: FAILS HERE (bad repo?)
#RUN apt-get install -y google-chrome-stable

# install ChromeDriver https://yizeng.me/2014/04/20/install-chromedriver-and-phantomjs-on-linux-mint/
RUN wget -N http://chromedriver.storage.googleapis.com/2.29/chromedriver_linux64.zip -P ~/Downloads
RUN unzip ~/Downloads/chromedriver_linux64.zip -d ~/Downloads
RUN mv -f ~/Downloads/chromedriver /usr/bin/chromedriver
RUN chown root:root /usr/bin/chromedriver
RUN chmod +x /usr/bin/chromedriver

#RUN rails new .
#RUN bundle update && bundle install
ENTRYPOINT [ "/bin/bash" ]

#RUN rails server -p $PORT -b 0.0.0.0
