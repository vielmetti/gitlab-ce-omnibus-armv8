apt-get update -q \
  && apt-get install -yq \
      build-essential \
      zlib1g-dev \
      byacc \
      cmake \
      python-pip \
      git \
      gcc \
      libssl-dev \
      libyaml-dev \
      libffi-dev \
      libreadline-dev \
      libgdbm-dev \
      libncurses5-dev \
      make \
      bzip2 \
      curl \
      ca-certificates \
      locales \
      openssh-server \
      libcurl4-openssl-dev \
      libexpat1-dev \
      gettext \
      libz-dev \
      libssl-dev \
      fakeroot \
      python-dev \
      ccache \
      distcc \
      unzip \
	  wget \
      apt-transport-https

# Git 2.13.2
curl -fsSL "https://www.kernel.org/pub/software/scm/git/git-2.13.2.tar.gz" \
	| tar -xzC /tmp \
  && cd /tmp/git-2.13.2 \
  && ls -la \
  && ./configure \
  && make all \
  && make install

curl -fsSL "https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.tar.gz" \
  | tar -xzC /tmp \
  && cd /tmp/ruby-2.3.3 \
  && ./configure --disable-install-rdoc --disable-install-doc --disable-install-capi\
  && make \
  && make install

/usr/local/bin/gem update --system 2.6.8 --no-ri --no-rdoc

/usr/local/bin/gem install bundler --version 1.13.6 --no-ri --no-rdoc

pip install awscli

# Go 1.8.3
cd /tmp && wget https://github.com/elraro/gitlab-ce-omnibus-armv8/releases/download/go1.8.3/go1.8.3-armv8.tar.gz \
  && tar zxvf go1.8.3-armv8.tar.gz && mv go /usr/local
echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.bashrc
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc 
echo 'export GOARCH=arm64' >> ~/.bashrc 
export PATH=/usr/local/go/bin:$PATH
export GOROOT=/usr/local/go
export GOARCH=arm64

# Node 6.X
cd /tmp && curl -sL https://deb.nodesource.com/setup_6.x | bash -
apt-get install -y nodejs

mkdir /usr/local/yarn \
  && curl -fsSL "https://yarnpkg.com/downloads/0.20.3/yarn-v0.20.3.tar.gz" \
	| tar -xzC /usr/local/yarn --strip 1 \
  && ln -sf /usr/local/yarn/bin/yarn /usr/local/bin/

mkdir -p /opt/gitlab /var/cache/omnibus ~/.ssh

git config --global user.email "elraro@elraro.eu"
git config --global user.name "elraro"

rm -rf /tmp/*

echo 'export ALTERNATIVE_SOURCES=true' >> ~/.bashrc
export ALTERNATIVE_SOURCES=true

