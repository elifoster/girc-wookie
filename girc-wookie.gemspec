Gem::Specification.new do |s|
  s.name = 'girc-wookie'
  s.version = '1.0.1'
  s.authors = ['Eli Foster']
  s.description = 'A simple command line utility that adds an IRC web ' \
                  'hook to a GitHub repository configured with a YAML file.'
  s.email = 'elifosterwy@gmail.com'
  s.files = [
    'bin/wookie',
    'lib/girc/wookie.rb',
    'CHANGELOG.md',
    'example.yaml'
  ]
  s.executables = 'wookie'
  s.homepage = 'https://github.com/elifoster/girc-wookie'
  s.summary = 'GitHub-IRC Wookie command line application'
  s.add_runtime_dependency('octokit', '>= 4.0.1')
end
