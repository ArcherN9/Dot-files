# Container aliases (Apple Container runtime)

# pi-new — launch a fresh pi-agent container with 2 CPUs, 4GB RAM, interactive TTY
alias pi-new='container run --cpus 2 --memory 4G --rm --interactive --tty --volume ~/Docker/Pi/home/:/root --volume ~/Development:/root/Development pi'

# dooit — task management TUI (persistent config & data via bind mounts)
alias dooit='container run --rm --interactive --tty \
  --volume ~/Docker/dooit/data/config:/root/.config/dooit \
  --volume ~/Docker/dooit/data/data:/root/.local/share/dooit \
  dooit:3.3.4'
