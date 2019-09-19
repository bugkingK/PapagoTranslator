Pod::Spec.new do |s|

  s.name         = "PapagoTranslator"
  s.version      = "1.0.0"
  s.summary      = "This is a translation REST API applied to Naver Papago."
  s.description  = <<-DESC
This is a translation REST API applied to Naver Papago. It is a REST API that outputs input text as translated text in other languages ​​(English, Chinese).
                   DESC

  s.homepage     = "https://github.com/bugkingK/PapagoTranslator"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "bugkingK" => "myway0710@naver.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/bugkingK/PapagoTranslator.git", :tag => "#{s.version}" }
  s.source_files = "Classes", "PapagoTranslator/Sources/**/*.{swift}"

  s.dependency 'SwiftyJSON'

  s.swift_version = '5.0'	

end