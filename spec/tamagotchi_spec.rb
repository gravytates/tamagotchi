require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  before() do
    Tamagotchi.clear()
  end

  describe(".all") do
    it('is empty at first') do
      expect(Tamagotchi.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it('empties out all saved tamagotchies') do
      Tamagotchi.new("Test").save()
      Tamagotchi.clear()
      expect(Tamagotchi.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('adds a tamagotchi to the array of saved tamagotchies') do
      test_tamagotchi = Tamagotchi.new("Test")
      test_tamagotchi.save()
      expect(Tamagotchi.all()).to(eq([test_tamagotchi]))
    end
  end

  describe("#name") do
    it('lets you give tamagotchi a name') do
      test_tamagotchi = Tamagotchi.new("Test")
      expect(test_tamagotchi.name()).to(include("Test"))
    end
  end

  describe('#food_level') do
    it('displays the food level of your tamagotchi') do
      test_tamagotchi = Tamagotchi.new("Test")
      expect(test_tamagotchi.food_level()).to(eq(10))
    end
  end

  describe('#sleep_level') do
    it('displays the sleep level of your tamagotchi') do
      test_tamagotchi = Tamagotchi.new("Test")
      expect(test_tamagotchi.sleep_level()).to(eq(10))
    end
  end

  describe('#activity_level') do
    it('displays the activity level of your tamagotchi') do
      test_tamagotchi = Tamagotchi.new("Test")
      expect(test_tamagotchi.activity_level()).to(eq(10))
    end
  end

  describe("#is_dead") do
    it("is alive if the food, sleep, and activity levels are above 0") do
      test_tamagotchi = Tamagotchi.new("Test")
      expect(test_tamagotchi.is_dead()).to(eq(false))
    end

    it("is dead if the food level is 0") do
      test_tamagotchi = Tamagotchi.new("Test")
      test_tamagotchi.set_food_level(0)
      expect(test_tamagotchi.is_dead()).to(eq(true))
    end

    it("is dead if the sleep level is 0") do
      test_tamagotchi = Tamagotchi.new("Test")
      test_tamagotchi.set_sleep_level(0)
      expect(test_tamagotchi.is_dead()).to(eq(true))
    end

    it("is dead if the activity level is 0") do
      test_tamagotchi = Tamagotchi.new("Test")
      test_tamagotchi.set_activity_level(0)
      expect(test_tamagotchi.is_dead()).to(eq(true))
    end


    it("will decrease food, sleep, and active by 1 every second") do
      test_tamagotchi = Tamagotchi.new("Test")
      # @food_level = 3
      expect(test_tamagotchi.time_lapsed(1)).to(eq(false))
    end
  end

  describe("#feed") do
    it("updates the food level by 2") do
      test_tamagotchi = Tamagotchi.new("Test")
      test_tamagotchi.feed()
      expect(test_tamagotchi.food_level).to(eq(12))
    end
  end

  describe("#sleep") do
    it("updates the sleep level by 10") do
      test_tamagotchi = Tamagotchi.new("Test")
      test_tamagotchi.sleep()
      expect(test_tamagotchi.sleep_level).to(eq(20))
    end
  end

  describe("#play") do
    it("updates the activity level by 10") do
      test_tamagotchi = Tamagotchi.new("Test")
      test_tamagotchi.play()
      expect(test_tamagotchi.activity_level).to(eq(16))
    end
  end

  describe("#id") do
    it("returns the id of the tamagotchi") do
      test_tamagotchi = Tamagotchi.new("Test")
      test_tamagotchi.save()
      expect(test_tamagotchi.id()).to(eq(1))
    end
  end
end
