#!/bin/bash

cd /
git clone https://github.com/Eloston/ungoogled-chromium.git

for arg in "$@"
do
  case "$arg" in
    bash)
      # run bash
      cd /ungoogled-chromium
      bash
      ;;
    *)
      cd /ungoogled-chromium

      # cleanup files from previous build, except downloads
      git ls-files -z --others --exclude="build/downloads/" | xargs -0 --no-run-if-empty rm -f
      find . -type d -empty -delete
      git checkout -- .

      # checkout branch/tag/hash
      git checkout "$arg"
      if [ $? -ne 0 ]; then
        echo "cannot checkout $arg"
        exit 1
      fi

      # fix path to clang in some tags
      grep -q clang_base_path resources/linux_static/gn_flags
      if [ $? -ne 0 ]; then
        echo 'clang_base_path="/usr"' >> resources/linux_static/gn_flags
      fi

      # now build
      python3 ./build.py

      # move output file to mounted host directory
      if [ -d /output ]; then
        mv build/*.tar.xz /output
      fi
      ;;
  esac
done

exit 0
