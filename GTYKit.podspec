Pod::Spec.new do |s|
  s.name              = 'GTYKit'
  s.version           = '0.0.1'
  s.platform          = :ios, '8.0'
  s.summary           = 'A collection of classes to the development of Gitty.'
  s.homepage          = 'https://github.com/vertigo/VRTKit'
  s.authors           = { 'Matthew Strickland' => 'matthews@vertigo.com' }
  s.source            = { :git => 'git@github.com:gittyapp/GTYKit.git', :tag => s.version.to_s }
  s.requires_arc      = true
  s.license           = { :type => 'MIT',
                          :file => 'LICENSE' }

  s.subspec 'Core' do |c|
    c.source_files    = 'GTYKit/**/*.{h,m}'
    c.frameworks      = 'Foundation'
    c.dependency        'Base64', '~> 1.0'
    c.dependency        'MPSCategories', :head
    c.dependency        'SAMCategories', '~> 0.4'
  end
end
