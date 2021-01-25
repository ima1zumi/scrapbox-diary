require_relative './scrapbox.rb'

date = ARGV.empty? ? Date.today : Date.parse(ARGV[0])
ScrapBox.new.open(date, 'ima1zumi')
