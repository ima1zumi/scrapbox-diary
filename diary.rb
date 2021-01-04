require 'uri'
require 'date'

class ScrapBox
  def initialize
    @date = ARGV.empty? ? Date.today : Date.parse(ARGV[0])
  end

  def s(str)
    @date.strftime(str)
  end

  def body
    "#日記 ##{s('%Y-%m-%d')} ##{s('%Y年%m月%d日')} ##{s('%Y年%m月')} ##{s('%Y年')} ##{s('%m月')} ##{s('%m月%d日')} ##{s('%A')}"
  end

  def open(project = 'ima1zumi')
    body = URI.encode(body)
    system(%Q(open "https://scrapbox.io/#{project}/#{Time.now.strftime('%Y-%m-%d %a:')}?body=#{body}"))
  end
end

puts ScrapBox.new.body
# ScrapBox.new.open
