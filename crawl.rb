

require 'anemone'
require 'json'
require 'csv'

domains = JSON.parse(File.read('./domains.json'));

results = []

domains.each do |domain|

	Anemone.crawl(domain) do |anemone|

	  anemone.on_every_page do |page|
	  	# puts "############################"
	      # puts page.response_time.to_s+'|'+page.code.to_s+'|'+page.url.to_s
	      lipsum = !!(page.body =~ /Lorem|ipsum|dolor|amet/)

	      puts page.url.to_s

	      row = [page.response_time, page.code, page.url.to_s, lipsum]

	      results << row 
	      
	  end

	end

end

CSV.open("./output.csv", "wb") do |csv|
	results.each do |r|
		csv << r
	end
end