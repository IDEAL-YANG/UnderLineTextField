Pod::Spec.new do |s|
s.name = "UnderLineTextField"
s.platform = :ios
s.ios.deployment_target	= "8.0"
s.requires_arc = true
s.module_name = "UnderLineTextField"
s.version = "3.0.3"
s.summary = "Custom Simple UITextfield Subclass with state, fix set same text animate again."
s.description = "Custom Simple UITextField subclass with state and floating placeholder"
s.homepage = "https://github.com/IDEAL-YANG/UnderLineTextField"
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.author = "IDEAL-YANG"
s.source = { :git => 'https://github.com/IDEAL-YANG/UnderLineTextField.git',
:tag => "#{s.version}" }
s.source_files = 'Source/UnderLineTextField/**/*.{swift,h}'
s.resource = 'Source/UnderLineTextField/Supporting Files/Extera.xcassets'
s.swift_versions = '4.2'
end
