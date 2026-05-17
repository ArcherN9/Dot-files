# Docker aliases

# Dooit - task management TUI
# Runs the dooit container via docker compose and exec's into the interactive session.
# The container runs a persistent bash shell, so you can:
#   - Run `dooit` to launch the TUI
#   - Quit dooit (q) -> back at container shell, run `dooit` again
#   - Run `exit` -> return to host terminal, container keeps running
#   - Run `dooit` again any time to re-enter
alias dooit='docker-compose -f /Users/daksh_s/Docker/dooit/docker-compose.yml run --rm dooit'
