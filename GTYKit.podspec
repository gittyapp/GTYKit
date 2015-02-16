Pod::Spec.new do |s|
  url                 = 'https://github.com/gittyapp/GTYKit'
  git_url             = 'https://github.com/gittyapp/GTYKit.git'
  version             = '0.0.3'

  s.name              = 'GTYKit'
  s.version           = version
  s.platform          = :ios, '8.0'
  s.summary           = 'A collection of classes to aid in the development of Gitty.'
  s.homepage          = url
  s.authors           = { 'Matthew Strickland' => 'matthew@idlefusion.com' }
  s.source            = { :git => git_url, :tag => version }
  s.requires_arc      = true
  s.license           = { :type => 'MIT',
                          :file => 'LICENSE' }

  s.subspec 'Core' do |core|
    core.source_files     = 'GTYKit/Core/**/*.{h,m}'
    core.frameworks       = 'Foundation', 'CoreGraphics'
    core.dependency         'MPSCategories', '~> 0.1'
  end

  s.subspec 'Routing' do |routing|
    routing.source_files  = 'GTYKit/Routing/**/*.{h,m}'
    routing.dependency      'Routable', '0.0.7'
    routing.dependency      'GTYKit/Core'
  end

  s.subspec 'Models' do |models|
    models.source_files   = 'GTYKit/Models/**/*.{h,m}'
    models.dependency       'Base64', '~> 1.0'
    models.dependency       'SAMCategories', '~> 0.4'
    models.dependency       'GTYKit/Core'
    models.dependency       'GTYKit/Routing'
  end
end
