class Tamagotchi
  @@all_tamagotchies = []

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
  end

  define_singleton_method(:all) do
    @@all_tamagotchies
  end

  define_singleton_method(:clear) do
    @@all_tamagotchies = []
  end

  define_method(:save) do
    @@all_tamagotchies.push(self)
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:sleep_level) do
    @sleep_level
  end

  define_method(:activity_level) do
    @activity_level
  end

end
