puts 'What is the name and path of the file?'
filename = gets.chomp
text = String.new
File.open(filename) { |f| text = f.read } 
words = text.split(/[^a-zA-Z]/)
freqs = Hash.new(0)
words.each { |word| freqs[word] += 1 }
freqs = freqs.sort_by {|x,y| y }
freqs.reverse!
freqs.each {|word, freq| puts word+' '+freq.to_s}

require 'csv'
CSV.open("csv_results.csv", "w") do |csv|
  csv << [freqs.each {|word, freq| puts word+' '+freq.to_s}]
end

File.write('text_results.txt', freqs.each {|word, freq| puts word+' '+freq.to_s})