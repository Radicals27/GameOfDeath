require "test/unit"
require_relative "./classes.rb"


class GameTest < Test::Unit::TestCase
    #This test passes as right arm is equal to 15 after taking 10 damage
    def test_take_damage
        test_person = Human.new("Test person", 100, 80, 1)
        test_person.take_damage("ra", 10)   #give them 10 damage to their right arm, should now be 15, not 25
        assert_equal(test_person.limbs["ra"][1], 15)
    end

    #This test fails, after 40 damage to his head, he is NOT able to fight
    def test_check_ability_to_fight
        test_person2 = Human.new("Test person", 100, 80, 1)
        test_person2.take_damage("h", 40)
        assert(test_person2.is_able_to_fight)
    end
end