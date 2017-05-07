Pod::Spec.new do |s|
  s.name             = "AKGPushAnimator"
  s.version          = '1.0.3'
  s.summary          = "Easy to use, Interactive Push Animator like Instagram app"
  s.description      = <<-DESC
                       Easily Push and Pop ViewController like Instagram App with Interaction written in pure Swift 3
                       DESC
  s.homepage         = "https://github.com/ahmetkgunay/AKGPushAnimator"
  s.license          = 'MIT'
  s.author           = { "Ahmet Kazım Günay" => "ahmetkgunay@gmail.com" }
  s.source           = { :git => "https://github.com/ahmetkgunay/AKGPushAnimator.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ahmtgny'
  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Source/*.swift'
end
