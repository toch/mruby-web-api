MRuby::Gem::Specification.new('mruby-api') do |spec|
  spec.license = 'MIT'
  spec.author  = 'Christophe Philemotte'
  spec.summary = 'Web API Client'
  spec.version = '0.0.1'
  spec.add_dependency 'mruby-mtest', mgem: 'mruby-mtest'
  spec.add_dependency 'mruby-string-ext', core: 'mruby-string-ext'
  # spec.add_dependency 'mruby-polarssl', :github => 'toch/mruby-polarssl'
  spec.add_dependency 'mruby-httprequest', :mgem => 'mruby-httprequest'
  spec.add_dependency 'mruby-base64', :mgem => 'mruby-base64'
  spec.add_dependency 'mruby-json', :github => 'mattn/mruby-json'
end
