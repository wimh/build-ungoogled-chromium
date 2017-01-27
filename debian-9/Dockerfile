FROM debian:stretch

RUN apt-get update && apt-get install -y --no-install-recommends \
                bison \
                build-essential \
                ca-certificates \
                clang-3.9 \
                git \
                gperf \
                libasound2-dev \
                libatk1.0-dev \
                libcups2-dev \
                libffi-dev \
                libgconf2-dev \
                libgnome-keyring-dev \
                libgtk2.0-dev \
                libkrb5-dev \
                libnss3-dev \
                libpango1.0-dev \
                libpci-dev \
                libpulse-dev \
                libx11-xcb-dev \
                libxss-dev \
                libxtst-dev \
                lsb-release \
                mesa-common-dev \
                ninja-build \
                python \
                python3 \
                quilt \
                vim \
                && rm -rf /var/lib/apt/lists/* \
                && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.9 390 \
                  --slave /usr/bin/clang++ clang++ /usr/bin/clang++-3.9 \
                  --slave /usr/bin/clang-check clang-check /usr/bin/clang-check-3.9 \
                  --slave /usr/bin/clang-query clang-query /usr/bin/clang-query-3.9 \
                  --slave /usr/bin/clang-rename clang-rename /usr/bin/clang-rename-3.9

WORKDIR /
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["static", "master"]

