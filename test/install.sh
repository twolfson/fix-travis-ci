# Install `node` for testing
if ! which node > /dev/null; then
  sudo apt-get install -y node
fi

# Install `n`, `node@0.8`, and `node@0.10`
if ! which n > /dev/null; then
  sudo npm install -g n
  n 0.8.28
  n 0.10.32
fi
