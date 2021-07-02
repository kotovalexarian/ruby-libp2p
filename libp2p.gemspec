# frozen_string_literal: true

require_relative 'lib/libp2p/version'

Gem::Specification.new do |spec|
  spec.name          = 'libp2p'
  spec.version       = Libp2p::VERSION
  spec.license       = 'MIT'
  spec.homepage      = 'https://github.com/kotovalexarian/ruby-libp2p'
  spec.platform      = Gem::Platform::RUBY
  spec.summary       = 'The Ruby Implementation of the libp2p networking stack'

  spec.required_ruby_version = '~> 3.0'

  spec.authors       = ['Alex Kotov']
  spec.email         = %w[kotovalexarian@gmail.com]

  spec.description = <<~DESCRIPTION.split("\n").map(&:strip).join ' '
    The Ruby Implementation of the libp2p networking stack.
  DESCRIPTION

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['bug_tracker_uri'] = "#{spec.homepage}/issues"

  spec.bindir        = 'exe'
  spec.require_paths = ['lib']

  spec.files = Dir.chdir File.expand_path __dir__ do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match %r{\A(?:test|spec|features)/}
    end
  end

  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename f }

  spec.add_development_dependency 'bundler', '~> 2.2'
end
