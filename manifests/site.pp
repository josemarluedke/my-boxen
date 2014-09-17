require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  include nodejs::v0_10

  # default ruby versions
  ruby::version { '2.1.2': }

  # custom modules
  include ctags
  include heroku
  include memcached
  include redis
  include postgresapp
  include phantomjs
  include imagemagick
  include iterm2::dev
  include tmux
  include gitx
  include xquartz
  include wget
  include sublime_text_2
  include macvim
  include hipchat
  include mou
  include github_for_mac
  include caffeine
  include googledrive
  include virtualbox
  include vagrant
  include vlc
  include textual
  include alfred
  include appcleaner
  include seil
  include transmit
  include skype
  include chrome
  include onepassword
  include firefox
  include spotify
  include java
  include toggl
  include licecap
  include wunderlist

  phantomjs::global { '1.9.0': }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar',
      'imagesnap'
    ]:
  }

  file { "${boxen::config::srcdir}/my-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}

