require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/tamagotchi.rb')

get('/') do
  @tamagotchies = Tamagotchi.all()
  erb(:index)
end

post('/add') do
  name = params.fetch('name')
  @tamagotchi = Tamagotchi.new(name)
  @tamagotchi.save()
  erb(:results)
end

post('/dinner') do
  Tamagotchi.clear
  redirect('/')
  erb(:index)
end
