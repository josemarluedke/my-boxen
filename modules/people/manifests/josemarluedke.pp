class people::josemarluedke {
  # Configurations
  class { 'nodejs::global': version => 'v0.10.0' }

  # Packages
  include people::josemarluedke::packages::the_silver_searcher

  # Aplications
  include people::josemarluedke::applications::dotfiles
  include people::josemarluedke::applications::vim
}
