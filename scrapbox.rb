require 'uri'
require 'date'

class ScrapBox
  def initialize(project)
    @project = project
  end

  def body(date)
    "#日記 ##{s(date, '%Y-%m-%d')} ##{s(date, '%Y年%m月%d日')} ##{s(date, '%Y年%m月')} ##{s(date, '%Y年')} ##{s(date, '%m月')} ##{s(date, '%m月%d日')} ##{s(date, '%A')}"
  end

  def open(title, body)
    system(%Q(open "#{build_url(title, body)}"))
  end

#  def open_with_date_title(date, body)
#    open(date_title(date), body)
#  end

  def self.date_title(date)
    prefix = '🖋'
    s(date, "#{prefix}%Y-%m-%d_%a")
  end

  def self.s(date, str)
    date.strftime(str)
  end

  private

  def project_url
    "https://scrapbox.io/#{@project}"
  end

  def build_url(title, body)
    encoded_title = URI.encode_www_form_component(title)
    encoded_body = URI.encode_www_form_component(body)
    "#{project_url}/#{encoded_title}?body=#{encoded_body}"
  end
end

scrap = ScrapBox.new('ima1zumi')
title = ScrapBox.date_title(Date.today) + 'ベーコンエッグ'
scrap.open(title, 'バターチキンカレー, チョレギサラダ')
