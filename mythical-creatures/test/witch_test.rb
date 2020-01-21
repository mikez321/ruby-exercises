gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/witch'

class WitchTest < Minitest::Test
  def test_it_has_a_name
    witch = Witch.new("Sandy")
    assert_equal "Sandy", witch.name
  end

  def test_it_doest_have_to_live_in_the_woods
    witch = Witch.new("Sandy", "Paris")
    assert_equal "Paris", witch.home
  end

  def test_it_isnt_a_chef
    witch = Witch.new("Sandy", "Paris")
    refute witch.chef?
  end

  def test_if_it_takes_lessons_it_can_become_a_chef
    witch = Witch.new("Sandy", "Paris")
    refute witch.chef?
    witch.take_lessons
    refute witch.chef?
    4.times { witch.take_lessons }
    assert witch.chef?
  end

  class Food
    attr_accessor :type
    def initialize(type = "Rubbish")
      @type = type
    end
  end

  def test_chefs_make_tasty_food
    witch = Witch.new("Sandy", "Paris")
    food = Food.new
    witch.make_food(food)
    assert_equal "Rubbish", food.type
    5.times { witch.take_lessons }
    witch.make_food(food)
    assert_equal "Delicious", food.type
  end

  class Kid
    attr_reader :name
    attr_accessor :like_food
    def initialize(name)
      @name = name
      @like_food = false
    end

    def like_food?(food)
      @like_food = true if food.type == "Delicious"
    end

  end

  def test_kids_only_like_delicious_foods
    burned_food = Food.new
    food = Food.new("Delicious")
    hansel = Kid.new("Hansel")
    refute hansel.like_food?(burned_food)
    assert hansel.like_food?(food)
  end

  def test_witch_can_only_lure_kids_with_delicious_foods
    witch = Witch.new("Sandy")
    food = Food.new
    hansel = Kid.new("Hansel")
    witch.make_food(food)
    refute hansel.like_food?(food)
    5.times { witch.take_lessons }
    witch.make_food(food)
    assert hansel.like_food?(food)
  end

  def test_witch_can_kidnap_kids_only_if_they_like_her_food
    witch = Witch.new("Sandy")
    food = Food.new
    hansel = Kid.new("Hansel")

    witch.make_food(food)
    hansel.like_food?(food)
    witch.kidnap(hansel)
    assert_equal 0, witch.stolen_kids.count

    5.times {witch.take_lessons}
    witch.make_food(food)
    hansel.like_food?(food)
    witch.kidnap(hansel)
    assert_equal 1, witch.stolen_kids.count
    assert_equal "Hansel", witch.stolen_kids.first.name
  end

  def test_if_witch_can_only_eat_kidnapped_kids
    witch = Witch.new("Sandy")
    food = Food.new
    hansel = Kid.new("Hansel")
    gretel = Kid.new("Gretel")

    5.times {witch.take_lessons}
    witch.make_food(food)
    hansel.like_food?(food)
    witch.kidnap(hansel)

    assert_equal "Hansel was tasty!", witch.eat_kid!(hansel)
    assert_equal "I don't have that kid", witch.eat_kid!(gretel)

  end

  def test_after_witch_eats_kid_forgets_how_to_cook
    witch = Witch.new("Sandy")
    food = Food.new
    another_food = Food.new
    hansel = Kid.new("Hansel")

    witch.make_food(food)
    refute hansel.like_food?(food)

    5.times {witch.take_lessons}
    witch.make_food(food)
    hansel.like_food?(food)
    witch.kidnap(hansel)
    assert witch.stolen_kids.include?(hansel)

    witch.eat_kid!(hansel)
    assert_equal 0, witch.stolen_kids.count

    witch.make_food(another_food)
    assert_equal "Rubbish", another_food.type
  end


end
