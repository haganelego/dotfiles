if type git >/dev/null 2>&1; then
  echo "Downloading tmuximum with git..."
  git clone https://github.com/haganelego/tmuximum.git $HOME/usr/tmuximum
else
  tarball="https://github.com/haganelego/tmuximum/archive/master.tar.gz"
  if type curl >/dev/null 2>&1; then
    echo "Downloading tmuximum with curl..."
    curl -L "$tarball" | tar zx
  elif type wget >/dev/null 2>&1; then
    echo "Downloading tmuximum with wget..."
    wget -O - "$tarball" | tar zx
  fi
  mv -f tmuximum-master $HOME/usr/tmuximum
fi

ln -sf $HOME/usr/tmuximum/tmuximum $HOME/.local/bin/tmuximum
