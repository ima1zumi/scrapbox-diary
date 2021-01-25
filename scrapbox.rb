require 'uri'
require 'date'

class ScrapBox
  def s(date, str)
    date.strftime(str)
  end

  def body
    "#日記 ##{s(date, '%Y-%m-%d')} ##{s(date, '%Y年%m月%d日')} ##{s(date, '%Y年%m月')} ##{s(date, '%Y年')} ##{s(date, '%m月')} ##{s(date, '%m月%d日')} ##{s(date, '%A')}"
  end

  def url(date, project)
    param = URI.encode_www_form_component(body)
    title = URI.encode_www_form_component(s(date, '%Y-%m-%d_%a'))
    "https://scrapbox.io/#{project}/#{title}?body=#{body}"
  end

  def open(date, project)
    system(%Q(open "#{url(date, project)}"))
  end
end

