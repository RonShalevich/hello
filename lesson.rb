require 'sinatra'
require 'sinatra/reloader'
require 'faker'

get '/' do
  erb :index, layout: :layout
  # "<h1>welcome to my first web app!</h1><p>It was created at CodeCore</p>"
end

get '/hi' do
  # http://localhost.4567/hi?name=Kepler
  @name = params["another_name"]
  @age = params["age"]
  # "Hello, #{@name}"
  erb :hi, layout: :layout
  # "Hello World!"
end

get '/hi/:name'do |name|
  @name = params[:another_name]
  "Hi #{name} and #{@name}"

end

get '/contact' do
  erb :contact, layout: :layout

end
post '/contact' do
  puts params
  @first_name = params[:first_name]
  @last_name = params[:last_name]
  @phone = params[:phone]
  @email = params[:email]
  @address = params[:address]
  # "Hello #{@first_name} #{@last_name}"
  erb :contact, layout: :layout
end

get '/faker' do
  "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  "#{Faker::Phone.phone} #{Faker::Email.email} #{Faker::Address.address}"
end


get '/converter' do
  erb :converter, layout: :layout

end

post '/converter' do
  @temp_f = params[:temp_f]
  @temp_c = (@temp_f.to_f - 32)/1.8
  erb :converter, layout: :layout
end
