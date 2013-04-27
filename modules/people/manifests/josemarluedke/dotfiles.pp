class people::josemarluedke::dotfiles {
  $home     = "/Users/${::luser}"

  $dotfiles_dir = "${$home}/.dotfiles"

  file { $dotfiles_dir:
    ensure => "directory",
    owner => $::luser,
    group => "staff"
  }

  repository { $dotfiles_dir:
    source => "${boxen::config::login}/dotfiles"
  }

  file { "${$home}/.gitconfig":
    ensure => "link",
    target => "${$dotfiles_dir}/dotfiles/gitconfig",
    require => Repository[$dotfiles_dir]
  }

  file { "${$home}/.gitignore":
    ensure => "link",
    target => "${$dotfiles_dir}/dotfiles/gitignore",
    require => Repository[$dotfiles_dir]
  }

  file { "${$home}/.bash_profile":
    ensure => "link",
    target => "${$dotfiles_dir}/dotfiles/bash_profile",
    require => Repository[$dotfiles_dir]
  }

  file { "${$home}/.inputrc":
    ensure => "link",
    target => "${$dotfiles_dir}/dotfiles/inputrc",
    require => Repository[$dotfiles_dir]
  }

  file { "${$home}/.irbrc":
    ensure => "link",
    target => "${$dotfiles_dir}/dotfiles/irbrc",
    require => Repository[$dotfiles_dir]
  }

  file { "${$home}/.pryrc":
    ensure => "link",
    target => "${$dotfiles_dir}/dotfiles/pryrc",
    require => Repository[$dotfiles_dir]
  }

  exec { "add boxen to bash_profile":
    cwd      => $dotfiles_dir,
    command  => "echo '[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh' >> ${$dotfiles_dir}/dotfiles/bash_profile",
    provider => shell,
    require  => Repository[$dotfiles_dir]
  }
}
