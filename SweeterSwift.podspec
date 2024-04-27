Pod::Spec.new do |s|

  s.name         = "SweeterSwift"
  s.version      = "1.2.4"
  s.summary      = "Extensions and syntactic sugar to enrich the Swift standard library, iOS frameworks, and SwifterSwift."

  s.homepage     = "https://github.com/yonat/SweeterSwift"
  s.license      = { :type => "MIT", :file => "LICENSE.txt" }
  s.author             = { "Yonat Sharon" => "yonat@ootips.org" }

  s.swift_version = '4.2'
  s.swift_versions = ['4.2', '5.0']
  s.platform     = :ios, "9.0"
  s.requires_arc = true

  s.source       = { :git => "https://github.com/yonat/SweeterSwift.git", :tag => s.version }
  s.source_files  = "Source/*.swift"
  s.resource_bundles = { 'SweeterSwift' => '*.xcprivacy' }

end
