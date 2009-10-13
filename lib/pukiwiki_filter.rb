# -*- coding: utf-8 -*-
require 'pukiwikiparser'

class PukiwikiFilter < TextFilter
  description_file File.dirname(__FILE__) + "/../pukiwiki.html"

  # このメソッドで入力値を変換します。
  def filter(text)
    pukiwiki = PukiWikiParser.new(Logger.new(STDOUT))
    return pukiwiki.to_html(text, "dummypagename")
  text
  end
end
