require_relative './scrapbox.rb'

date = ARGV.empty? ? Date.today : Date.parse(ARGV[0])

scrap = Scrapbox.new('ima1zumi')

title = Scrapbox.date_title(date)

title = ARGV.include?("monthly") ? Scrapbox.monthly_title(date) : Scrapbox.date_title(date)
body = ARGV.include?("monthly") ? Scrapbox.monthly(date) : Scrapbox.body(date)

scrap.open(title, body)
