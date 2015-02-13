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
    propertie_site = propertie.at_css('div.propertyInfo>a:nth-child(3)').attr('href')
    # MERCADO
    puts "1. Mercado: #{propertie.at_css('.offer').text.strip}"
    # TIPO
    puts "2. Tipo: #{propertie.at_css('.propertyInfo>a:nth-child(3) h2 span').text.strip}"
    # CONDICION
    puts "3. !!!FALTA - Condición: "


    # FECHA
    puts "4. !!!FALTA - Fecha: "


    # ESTRATO
    puts "5. Estrato: #{propertie_site.split('estrato-')[1][0]}"

    # DEPARTAMENTO
    puts "6. !!!FALTA - Departamento: "

    #CIUDAD
    city = propertie_site.split('en-')[1].split('-')[0].to_s
    puts "7. Ciudad: #{city.capitalize}"

    #BARRIO
    barrio = propertie.at_css('.propertyInfo>a:nth-child(3) h2 span:nth-child(3)').text.strip
    puts "8. Barrio: #{barrio.split(',')[1].strip}"

    # AREA CONSTRUIDA
    area = propertie_site.split('-area-')[1].split('-')[0].to_i
    puts "9. Area Construida: #{area} mts2"

    # VALOR PROPIEDAD
    value = propertie.at_css('.propertyInfo>a:nth-child(3) dd i').text.strip.tr('$,.','').to_i
    puts "10. Valor Propiedad: #{value} Pesos"

    # VALOR METRO CUADRADO
    if area === 0
      puts "11. Valor metro cuadrado: No disponible"
    else
      value_mt2 = value/area
      puts "12. Valor metro cuadrado: #{value_mt2} Pesos"
    end    

    # NUMERO DE HABITACIONES
    habitaciones = propertie_site.split('-habitaciones')[0].slice(-1).to_i
    puts "13. Numero de Habitaciones: #{habitaciones} habitaciones"

    # CODIGO DE PROPIEDAD
    id_web = propertie_site.split('-id-')[1]
    puts "14. Codigo de propiedad: #{id_web}"

    # DIAS DE ROTACION
    puts "15. !!!FALTA - Dias de rotación: "

    # SITIO WEB DE PROPIEDAD
    puts "16. Sitio Web de la propiedad: #{propertie_site}"
    puts ""
  end




  # puts "Estrato: #{info.at_css("ul li:nth-child(4)").text.strip}"
  # puts "Departamento"
  # puts "Barrio: #{info.at_css("ul li:first-child strong").text.strip}"
  # puts "Area Construida: #{info.at_css("ul li:nth-child(5)").text.strip}"
  # puts "Valor M2"
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