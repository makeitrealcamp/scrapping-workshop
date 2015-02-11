require 'nokogiri'
require 'open-uri'

repeat = true;

while repeat do
  puts "Enter a word for which you want to find jobs (ej: rails): "
  langs = [gets.strip]

  site = "http://www.computrabajo.com.co"

  langs.each do |job|
    puts "-------------------#{job.upcase}---------------------"
    response = open("#{site}/ofertas-de-trabajo/?q=#{job}")
    document = Nokogiri::HTML(response)

    links = document.css("#p_ofertas li article .parrilla")

    links.each do |link|
      puts "#{link.css(".info_parrilla h1 a").text} - #{link.css(".box_p_icon ul li:first").text}"
      job_page = site+"#{link.css(".info_parrilla h1 a").attr('href')}".strip
      job_response = open(job_page)
      job_document = Nokogiri::HTML(job_response)
      puts "Salario: #{job_document.css(".container article .detalle_oferta .box_i ul li:first").text}"
      puts "Url: #{job_page}"
      puts " "
    end

  end #end langs

  puts "--------------------------------------------------------"

  loop do
    puts "Do you want to search for another word? Y/N"
    input = gets.strip

    if input.empty?
      puts "No word"
    elsif input.eql?("N")
      repeat = false
      break
    elsif input.eql?("Y")
      break
    else
      puts "Not valid character"
    end

  end

end
