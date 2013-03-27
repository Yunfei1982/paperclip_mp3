# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperclip_mp3/version'

Gem::Specification.new do |spec|
  spec.name          = "paperclip_mp3"
  spec.version       = PaperclipMp3::VERSION
  spec.authors       = ["Yunfei"]
  spec.email         = ["yunfei.1982@gmail.com"]
  spec.description   = "Paperclip Mp3 is a Paperclip post-processor that convert to mp3 file of the audio attachment."
  spec.summary       = "Paperclip post-processor that generates a mp3 from audio files."
  spec.homepage      = "https://github.com/yunfei1982/paperclip_mp3"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "paperclip"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end