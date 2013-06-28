class people::josemarluedke {
  # Pugins
  heroku::plugin { 'accounts':
    source => 'ddollar/heroku-accounts'
  }

  # Configurations
  class { 'nodejs::global': version => 'v0.10.0' }
  class { 'phantomjs::global': version => '1.9.0' }

  # Packages
  include people::josemarluedke::packages::the_silver_searcher

  # Aplications
  include people::josemarluedke::applications::dotfiles
  include people::josemarluedke::applications::vim
  include people::josemarluedke::applications::gems
}
