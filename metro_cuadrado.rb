require 'nokogiri'
require 'open-uri'

# repeat = true;
  
  # puts "Digite una ciudad o departamento para realizar la busqueda"
  # city = gets.strip
  # puts "#{city}"
  site = "http://www.metrocuadrado.com/web/buscar/medellin"
  # url = site+"#{city}"

  data = Nokogiri::HTML(open(site))

  # find the 16 properties in the page
  properties = data.css('dl.hlisting')

  properties.each_with_index do |propertie, index|
    puts "--------------Propiedad #: #{index+1}-----------------"
    # MERCADO
    puts "Mercado: #{propertie.at_css('.offer').text.strip}"
    # TIPO
    puts "Tipo: #{propertie.at_css('.propertyInfo>a:nth-child(3) h2 span').text.strip}"
    # puts "Tipo: #{propertie.css('.itemOffered').text.strip}"

    # SITIO WEB DE PROPIEDAD
    propertie_site = propertie.at_css('div.propertyInfo>a:nth-child(3)').attr('href')
    puts "Sitio Web de la propiedad: #{propertie_site}"
    # propertie_site = propertie.at_css('div.propertyInfo.item a').attr('href')
    # puts "#{propertie}"
    puts ""
  end





  # Getting the Meta
  # puts doc.at('meta[@name="keywords"]')[:content]
  # puts ""

  # 
  # puts "Condición"
  # puts "Fecha"
  # puts "Estrato: #{info.at_css("ul li:nth-child(4)").text.strip}"
  # puts "Departamento"
  # puts "Ciudad"
  # puts "Barrio: #{info.at_css("ul li:first-child strong").text.strip}"
  # puts "Area Construida: #{info.at_css("ul li:nth-child(5)").text.strip}"
  # puts "Valor Propiedad: #{info.at_css("ul li:nth-child(3) strong").text.strip}"
  # # puts "Valor M2"
  # puts "Numero de habitaciones: #{info.at_css("ul li:nth-child(6)").text.strip}"
  # puts "Código de la propiedad: #{data.at_css("#idInmuebleH1")['value']}"
  # # puts "Dias de rotacion"
  # puts "Recurso WEB: Metro - Cuadrado"
  # puts ""



  # puts "Ingrese la ciudad donde desea buscar propiedades en una ciudad: "
  # city = [gets.strip]
  # site = "http://www.metrocuadrado.com/"

  # city.each do |property|
  #   puts "-----------#{property.upcase}------------------"
  #   response = open("#{site}/web/buscar/medellin")

  #   #Sacamos los links de la pagina
  #   links = document.css("")

  #   info = data.css(".det_infoGeneral")

    

  # end # end_city
# end


# 1. Mercado (Venta o Alquiler)
# 2. Tipo de propiedad (apartamento, oficina, bodega, local, casa, finca, consultorio, lote, edificio de oficinas, apartahoteles, edificios de apartamentos)
# 3. Condición (nuevo o usado)
# 4. Fecha
# 5. Estrato
# 6. Departamento
# 7. Ciudad
# 8. Barrio
# 9. Área Construida (numero de M2´s)
# 10. Valor Propiedad (arriendo o venta)
# 11. Valor M2 (de venta o de arriendo)
# 12. Numero de habitaciones (solo aplica para apartamentos y casas)
# 13. Código de la propiedad en la pagina web  
# 14. Días de rotación
# 15. Pagina web de donde se saca la información. (metrocuadrado, lamudi, etc).