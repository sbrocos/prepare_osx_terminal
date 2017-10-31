@app_list = [
  { app: 'brew', type: 'function' },
  { app: 'brew_services', type: 'function' },
  { app: 'coreutils', post: 'coreutils' },
  { app: 'git' },
  { app: 'git-lfs', depend: 'git' },
  { app: 'git-flow', depend: 'git' },
  { app: 'git-extras', depend: 'git' },
  { app: 'gnupg' },
  { app: 'grep'},
  { app: 'imagemagick' },
  { app: 'lynx' }, 
  { app: 'openssl' },
  { app: 'screen' },
  { app: 'wget', option: '--with-iri' },
  { app: 'zsh', child: 'zsh-completions', post: 'zsh' },
  { app: 'zsh-completions', depend: 'zsh' },
  # languages
  { app: 'python', child: 'python3' },
  { app: 'python3', depend: 'python' },
  { app: 'rvm', type: 'funtion', depend: 'gnupg'},
  { app: 'node' },
  { app: 'yarn', depend: 'node' },
  { app: 'elixir', type: 'function' },
  # editors
  { app: 'vim', option: '--override-system-vi' },
  { app: 'macvim', depend: 'vim' },
  # databases
  { app: 'mysql' },
  { app: 'postgresql' },
  { app: 'redis' },
  { app: 'sqlite' },
  # finally
]
