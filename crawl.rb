

require 'anemone'
require 'json'
require 'csv'

domains = JSON.parse(File.read('./domains.json'))

results = []

lipsum_words = JSON.parse(File.read('./lib/lipsum.json'))

domains.each do |domain|

	Anemone.crawl(domain) do |anemone|

	  anemone.on_every_page do |page|
	  	# puts "############################"
	      # puts page.response_time.to_s+'|'+page.code.to_s+'|'+page.url.to_s
	      lipsum = !!(page.body =~ Regexp.union(lipsum_words))

	      # puts lipsum

	      # lorem_collection.each { |word| page.body.include? word }

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