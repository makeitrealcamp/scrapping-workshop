require 'nokogiri'
require 'open-uri'

response = open('http://www.mercadolibre.com.co')
document = Nokogiri::HTML(response)

links = document.css('.ch-g4-5 li a')

links.each do |link|
  puts link.text
  puts link.attr('href')
  puts '--'
  #Category.create(name: '', link: '')

  doc_details = Nokogiri::HTML(open(link.attr('href'))
  # continuar scrappeando la pagina de detalle
  # doc_details.css('selector').each do
  # end
end

# Alternativa basandonos en el formulario de busqueda
['casas', 'carros', 'celular'].each do |keyword|
  url = "http://listado.mercadolibre.com.co/#{keyword}"
  doc = Nokogiri::HTML(open(url))
  # scrapear los productos
  doc.css(".article") do |product|
    # obtener información
    # Product.create(name: '', price: '', category: '')
  end
end
