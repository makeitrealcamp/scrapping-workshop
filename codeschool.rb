require 'rubygems'
require 'mechanize'
require 'fileutils'
a = Mechanize.new
a.get('https://www.codeschool.com/') do |page|
  # Click the login link
  login_page = a.click(page.link_with(:text => /Sign in/))

  # Submit the login form
  my_page = login_page.form_with(:action => '/users/sign_in') do |f|
   username_field = f.field_with(:name => "user[login]")
   username_field.value = ENV["USER"]
   password_field = f.field_with(:name => "user[password]")
   password_field.value = ENV["PASSWORD"]
 end.submit

 a.get('https://www.codeschool.com/courses/') do |page|
  link=page.search('.course-badge a')
  link.each do |l|
   puts ''
   puts '=========================================='
   title = (l.attr('href')).split('/').last
   puts title.upcase
   puts ''

   #create folderof course
  FileUtils.mkdir(title)
   a.get("https://www.codeschool.com#{l.attr('href')}/videos") do |page_video|
     video= page_video.search('video source[data-quality="hd"]')
     video.each do |v|
     url= v.attr('src')
     #download videos
     system("wget -P #{title} '#{url}'")
     end
    end
 end
end
end
