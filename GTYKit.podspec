Pod::Spec.new do |s|
  name                = "GTYKit"
  url                 = "https://github.com/gittyapp/#{name}"
  git_url             = "#{url}.git"
  version             = "0.0.1"
  source_files        = "#{name}/**/*.{h,m}"

  s.name              = name
  s.version           = version
  s.platform          = :ios, '8.0'
  s.summary           = 'A collection of classes to the development of Gitty.'
  s.homepage          = url
  s.authors           = { 'Matthew Strickland' => 'matthew@idlefusion.com' }
  s.source            = { :git => git_url, :tag => version }
  s.requires_arc      = true
  s.license           = { :type => 'MIT',
                          :file => 'LICENSE' }
  s.source_files      = source_files

  s.dependency          'Base64', '~> 1.0'
  s.dependency          'MPSCategories', '~> 0.1'
  s.dependency          'SAMCategories', '~> 0.4'
end
