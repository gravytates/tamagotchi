class Tamagotchi
  @@all_tamagotchies = []

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @start_time = Time.new()
    @active = true
    @id = @@all_tamagotchies.length().+(1)
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

  define_method(:id) do
    @id
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

  define_method(:is_dead) do
    (@food_level < 1) || (@sleep_level < 1) || (@activity_level < 1)
  end

  define_method(:feed) do
    @food_level += 2
  end

  define_method(:sleep) do
    @sleep_level += 10
  end

  define_method(:play) do
    @activity_level += 6
  end

  define_method(:set_food_level) do |food|
    @food_level = food
  end

  define_method(:set_sleep_level) do |sleep|
    @sleep_level = sleep
  end

  define_method(:set_activity_level) do |activity|
    @activity_level = activity
  end

  define_method(:time_lapsed) do |seconds|
    while (@active == true) do
      if self.is_dead() == true
        @active = false
      elsif (Time.now().-(@start_time)).%(seconds).==(0)
        @food_level -= 1
        @sleep_level -= 1
        @activity_level -= 1
      end
    end
    @active
  end
end

# define_method(:active) do
#
# end
