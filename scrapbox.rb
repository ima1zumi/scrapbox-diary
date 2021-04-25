require 'uri'
require 'date'

class Scrapbox
  DIARY_PREFIX= '🖋'

  def initialize(project)
    @project = project
  end

  def self.body(date)
    <<~STR
    やったこと

    気持ち

    前の日：[#{date_title(date.dup - 1)}]
    次の日：[#{date_title(date.dup + 1)}]

    ##{s(date, '%Y-%m-%d')} ##{s(date, '%Y年%m月')} ##{s(date, '%Y年')} ##{s(date, '%m月')} ##{s(date, '%m月%d日')} ##{s(date, '%A')} #日記
    STR
  end

  def open(title, body)
    system(%Q(open "#{build_url(title, body)}"))
  end

#  def open_with_date_title(date, body)
#    open(date_title(date), body)
#  end

  def self.date_title(date)
    s(date, "#{DIARY_PREFIX}%Y-%m-%d_%a")
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
