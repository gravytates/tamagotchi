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

end
