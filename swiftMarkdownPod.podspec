Pod::Spec.new do |s|
  s.name             = 'swiftMarkdownPod'
  s.version          = '1.0.1'
  s.summary          = 'A Swift package for parsing, building, editing, and analyzing Markdown documents.'
  s.description      = <<-DESC
Swift Markdown is a Swift package for parsing, building, editing, and analyzing Markdown documents.
The parser is powered by GitHub-flavored Markdown's cmark-gfm implementation, so it follows the spec closely.
The markup tree provided by this package is comprised of immutable/persistent, thread-safe, copy-on-write value types.
                       DESC

  s.homepage         = 'https://github.com/taojeff/swiftMarkdownPod'
  s.license          = { :type => 'Apache License, Version 2.0', :file => 'LICENSE.txt' }
  s.author           = { 'GIKICoder' => 'giki.biu@gmail.com' }
  s.source           = { :git => 'https://github.com/taojeff/swiftMarkdownPod.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'

  s.swift_version = '5.7'

  # Main Markdown module
  s.source_files = 'Sources/Markdown/**/*.swift'
  
  # CAtomic module
  s.dependency 'swiftMarkdownPod/CAtomic'
  s.subspec 'CAtomic' do |atomic|
    atomic.source_files = 'Sources/CAtomic/**/*.{c,h}'
    atomic.public_header_files = 'Sources/CAtomic/include/*.h'
    atomic.preserve_paths = 'Sources/CAtomic/include/module.modulemap'
    atomic.pod_target_xcconfig = {
      'SWIFT_INCLUDE_PATHS' => '$(PODS_TARGET_SRCROOT)/Sources/CAtomic/include'
    }
  end

  # Dependencies
  s.dependency 'swiftCmarkPod'
  
  # Module name (must be valid C99 identifier)
  s.module_name   = 'Markdown'
  

  # Framework configuration
  s.frameworks = 'Foundation'
  s.requires_arc = true

  # Module map for CAtomic
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'SWIFT_INCLUDE_PATHS' => '$(PODS_TARGET_SRCROOT)/Sources/CAtomic/include'
  }

end