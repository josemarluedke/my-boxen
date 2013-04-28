class people::josemarluedke {
  # Pugins
  heroku::plugin { 'accounts':
    source => 'ddollar/heroku-accounts'
  }

  # Packages
  include people::josemarluedke::packages::the_silver_searcher

  # Aplications
  include people::josemarluedke::applications::dotfiles
  include people::josemarluedke::applications::vim
  include people::josemarluedke::applications::gems
}
