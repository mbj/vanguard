#encoding: utf-8

Gem::Specification.new do |s|
  s.name        = 'vanguard'
  s.version     = '0.0.4'
  s.authors     = ['Markus Schirp']
  s.email       = ['mbj@schirp-dso.com']
  s.homepage    = 'https://github.com/mbj/vanguard'
  s.summary     = %q{Library for performing validations on Ruby objects.}
  s.description = %q{Library for validating Ruby objects with rich metadata support.}

  # git ls-files
  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = []
  s.require_paths = ['lib']

  s.add_dependency('anima',               '~> 0.1.1')
  s.add_dependency('adamantium',          '~> 0.1.0')
  s.add_dependency('equalizer',           '~> 0.0.7')
  s.add_dependency('abstract_type',       '~> 0.0.6')
  s.add_dependency('descendants_tracker', '~> 0.0.1')
end
