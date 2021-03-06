Gem::Specification.new do |s|
  s.name = 'girc-wookie'
  s.version = '1.1.2'
  s.authors = ['Eli Foster']
  s.description = 'A simple command line utility that adds an IRC web ' \
                  'hook to a GitHub repository configured with a YAML file.'
  s.email = 'elifosterwy@gmail.com'
  s.license = 'MIT'
  s.files = [
    'bin/wookie',
    'lib/girc/wookie.rb',
    'CHANGELOG.md',
    'example.yaml'
  ]
  s.required_ruby_version = '>= 2.3'
  s.executables = 'wookie'
  s.homepage = 'https://github.com/elifoster/girc-wookie'
  s.summary = 'GitHub-IRC Wookie command line application'
  s.add_runtime_dependency('octokit', '~> 4.3')
end
