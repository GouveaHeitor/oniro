FROM kalilinux/kali-linux-docker:latest
MAINTAINER  Heitor Gouvêa hi@heitorgouvea.me

RUN apt -qy update
RUN apt list --upgradable
RUN apt -qy dist-upgrade
RUN apt -qy install
RUN curl -L https://cpanmin.us | perl - --sudo App::cpanminus

RUN apt install -qy \
  wget \
  curl \
  git \
  man \
  unzip \
  nmap \
  wpscan \
  nikto \
  sqlmap \
  hashcat \
  john \
  findmyhash \
  radare2 \
  apktool \
  exploitdb \
  weevely \
  fierce \
  dnsenum \
  dnsmap \
  dnsrecon \
  theharvester \
  gdb \
  fcrackzip \
  metasploit-framework \
  hashid \
  python-pip \
  smali \
  dex2jar \
  sublist3r \
  whois \
  smtp-user-enum \
  && apt clean \
  && apt -y autoremove \
  && rm -rf /var/lib/apt/lists/*

RUN gem install aquatone
RUN cpanm LWP::UserAgent JSON MIME::Base32 Text::Morse WWW::Mechanize

EXPOSE 1337 
VOLUME /Users/$(whoami)/Documents/