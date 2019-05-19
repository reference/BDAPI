Pod::Spec.new do |s|

  s.name         = "BDAPI"
  s.version      = "0.1.2"
  s.summary      = "BDAPI"
  s.homepage     = "https://github.com/reference/BDAPI"
  s.description  = <<-DESC
                Api for SNS
                * Easy to use.
                * Open codes!
                DESC
  s.license      = "MIT"
  s.author       = { "Scott Ban" => "imti_bandianhong@126.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git =>  "https://github.com/reference/BDAPI.git", :tag => s.version }
  s.requires_arc = true
  s.source_files = ["BDAPI/*.{h,m}","HTTP/**/*.{h,m}","Model/**/*.{h,m}"]

  s.dependency "BDToolKit"
  s.dependency "AFNetworking"
  s.dependency "ZXToolbox"
  s.dependency "YYModel"
end
