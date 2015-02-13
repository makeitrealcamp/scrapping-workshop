require 'nokogiri'
require 'open-uri'

repeat = true

while repeat do
	# Introduzca la palabra clave que desea buscar
	puts ""
	puts "Escriba la palabra clave que desea buscar"
	keyword = gets.strip
	# Introduzca la ciudad donde desea buscar
	puts ""
	puts "Escriba la ciudad donde desea buscar"
	city = gets.strip

	site = "http://www.paginasamarillas.com.co"
	puts ""
	puts "---------------Busqueda para #{keyword}---------------"
	response = open("#{site}/busqueda/#{keyword}-#{city}")
	document = Nokogiri::HTML(response)
	links = document.css("#listing-content ul .company-stats")

	links.each do |link|
		puts ""
		puts "#{link.css(".fig-titbox h2 a").text.strip}"
		puts "#{link.css(".fig-cont01 .fig-right .fig-prof01 .fig-dates li:nth-child(2)").text.strip}"
	end

	puts "______________________________________________"

	loop do
		puts "Desea buscar otro telefono(Y/N)"
		input = gets.strip
		if input.empty?
			puts "No introdujó ningún caracter"
		elsif input.eql?("N")
			repeat = false
			break
		elsif input.eql?("Y")
			break
		else
			puts "Caracter no valido"
		end #end if				
	end #end loop to out of the application

end #end while