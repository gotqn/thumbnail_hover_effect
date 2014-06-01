# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'thumbnail_hover_effect/version'

Gem::Specification.new do |spec|
  spec.name          = 'thumbnail_hover_effect'
  spec.version       = ThumbnailHoverEffect::VERSION
  spec.authors       = ['gotqn']
  spec.email         = ['george_27@abv.bg']
  spec.description   = 'Simple image hover css 3D effects for your application'
  spec.summary       = 'Introduces simple image thumbnail 3D image hover effects using CSS 3D transforms.
                        The idea is inspired by http://tympanus.net/codrops/2012/06/18/3d-thumbnail-hover-effects/.'
  spec.homepage      = 'https://github.com/gotqn/thumbnail_hover_effect'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
