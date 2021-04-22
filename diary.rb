require_relative './scrapbox.rb'

date = ARGV.empty? ? Date.today : Date.parse(ARGV[0])

scrap = Scrapbox.new('ima1zumi')

title = Scrapbox.date_title(date)
body = Scrapbox.body(date)

scrap.open(title, body)
