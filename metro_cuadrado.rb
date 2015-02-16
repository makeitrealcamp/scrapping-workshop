require 'nokogiri'
require 'open-uri'

  source = "Metro Cuadrado"
  # Define WEB address
  site = "http://www.metrocuadrado.com/web/buscar/medellin"

  # Open the WEB address with Nokogiri
  data = Nokogiri::HTML(open(site))

  # Find the 16 properties in the page
  properties = data.css('dl.hlisting')

  # Getting information for each propertie inside the list
  properties.each_with_index do |propertie, index|
    puts "--------------Propiedad #: #{index+1}-----------------"
    propertie_site = propertie.at_css('div.propertyInfo>a:nth-child(3)').attr('href')
    # MARKET
    puts "1. Mercado: #{propertie.at_css('.offer').text.strip}"
    # TYPE
    puts "2. Tipo: #{propertie.at_css('.propertyInfo>a:nth-child(3) h2 span').text.strip}"
    # DATE
    puts "3. Fecha: #{Time.now}"
    # STRATUM
    puts "4. Estrato: #{propertie_site.split('estrato-')[1][0]}"
    # CITY
    city = propertie_site.split('en-')[1].split('-')[0].to_s
    puts "5. Ciudad: #{city.capitalize}"
    # NEIGHBORHOOD
    barrio = propertie.at_css('.propertyInfo>a:nth-child(3) h2 span:nth-child(3)').text.strip
    puts "6. Barrio: #{barrio.split(',')[1].strip}"
    # BUILT AREA
    area = propertie_site.split('-area-')[1].split('-')[0].to_i
    puts "7. Area Construida: #{area} mts2"
    # PROPERTY VALUE
    value = propertie.at_css('.propertyInfo>a:nth-child(3) dd i').text.strip.tr('$,.','').to_i
    puts "8. Valor Propiedad: #{value} Pesos"
    # VALUE SQUARE METER
    if area === 0
      puts "9. Valor metro cuadrado: No disponible"
    else
      value_mt2 = value/area
      puts "10. Valor metro cuadrado: #{value_mt2} Pesos"
    end    
    # NUMBER OF ROOMS
    habitaciones = propertie_site.split('-habitaciones')[0].slice(-1).to_i
    puts "11. Numero de Habitaciones: #{habitaciones} habitaciones"
    # PROPERTY CODE
    id_web = propertie_site.split('-id-')[1]
    puts "12. Codigo de propiedad: #{id_web}"
    # DAYS OF ROTATION
    puts "13. Dias de rotación ---> NOTA: Dato que asignamos internamente dentro de la aplicación "
    # PROPERTY WEB SITE
    puts "14. Sitio Web de la propiedad: #{propertie_site}"
    # WEB RESOURCE
    puts "15. Recurso: #{source}"
    puts ""
  end