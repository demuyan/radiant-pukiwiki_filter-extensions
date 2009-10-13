# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PukiwikiFilterExtension < Radiant::Extension
  version "0.1"
  description "Adds support to Pukiwiki"
  url "http://pukiwiki.rubyforge.org/"

  def activate
    PukiwikiFilter
  end

end
