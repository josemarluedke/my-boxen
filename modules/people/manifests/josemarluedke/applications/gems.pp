class people::josemarluedke::applications::gems {

  ruby::gem {
    "bundler for 1.9.3":
      gem     => 'bundler',
      ruby    => '1.9.3',
      version => '~> 1.3.5';

    "pry for 1.9.3":
      gem     => 'pry',
      ruby    => '1.9.3',
      version => '~> 0.9.12';

    "bundler for 2.0.0":
      gem     => 'bundler',
      ruby    => '2.0.0',
      version => '~> 1.3.5';

    "pry for 2.0.0":
      gem     => 'pry',
      ruby    => '2.0.0',
      version => '~> 0.9.12';
  }
}
