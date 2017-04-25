require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/tamagotchi.rb')
require('pry')

get('/') do
  @tamagotchies = Tamagotchi.all()
  erb(:index)
end

post('/add') do
  name = params.fetch('name')
  @tamagotchi = Tamagotchi.new(name)
  @tamagotchi.save()
  redirect('/')
  erb(:results)
end

get('/:id') do
  @tamagotchi = Tamagotchi.find(params.fetch('id').to_i())
  @tamagotchi.time_lapsed(1)
  erb(:results)
end

post('/:id/feed') do
  @tamagotchi = Tamagotchi.find(params.fetch('tamagotchi_id').to_i())
  @tamagotchi.break_loop()
  @tamagotchi.feed()
  @tamagotchi.time_lapsed(1)
  redirect("/#{@tamagotchi.id()}")
end

post('/:id/sleep') do
  @tamagotchi = Tamagotchi.find(params.fetch('tamagotchi_id').to_i())
  @tamagotchi.break_loop()
  @tamagotchi.sleep()
  @tamagotchi.time_lapsed(1)
  redirect("/#{@tamagotchi.id()}")
end

post('/:id/activity') do
  @tamagotchi = Tamagotchi.find(params.fetch('tamagotchi_id').to_i())
  @tamagotchi.break_loop()
  @tamagotchi.play()
  @tamagotchi.time_lapsed(1)
  redirect("/#{@tamagotchi.id()}")
end

post('/dinner') do
  Tamagotchi.clear
  redirect('/')
  erb(:index)
end
