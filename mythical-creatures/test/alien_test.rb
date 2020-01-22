gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/alien'

class AlienTest < Minitest::Test

  def test_it_has_a_name
    alien = Alien.new('Jonathan')
    assert_equal 'Jonathan', alien.name
  end

  def test_it_comes_from_mars_and_is_green_by_default
    alien = Alien.new("Jonathan")
    assert_equal "Mars", alien.home
    assert_equal "Green", alien.color
  end

  def test_it_doesnt_have_to_be_green_or_from_mars
    alien = Alien.new("Jonathan", "Balron", "Purple")
    assert_equal "Balron", alien.home
    assert_equal "Purple", alien.color
  end

  def test_it_doesnt_have_spaceship_by_default
    alien = Alien.new("Jonathan")
    refute alien.has_spaceship?
  end

  def test_it_can_give_a_speech
    alien = Alien.new("Jonathan")
    assert_equal "Jibba jabba jibba jabba", alien.speech
  end

  def test_after_it_gives_a_speech_it_has_enough_rapples_to_buy_a_spaceship
    alien = Alien.new("Jonathan")
    alien.speech
    assert_equal 1000, alien.rapple_acct
  end

  def test_it_can_buy_a_spaceship_if_it_has_enough_rapples
    alien = Alien.new("Jonathan")
    assert_equal "Insufficient Rapples", alien.buy_spaceship
    alien.speech
    alien.buy_spaceship
    assert alien.spaceship
  end

  def test_spaceships_cost_1000_rapples
    alien = Alien.new("Jonathan")
    alien.speech
    alien.buy_spaceship
    assert_equal 0, alien.rapple_acct
  end

class Planet
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

  def test_spaceship_cannot_travel_without_a_plumbus
    alien = Alien.new("Jonathan")
    planet = Planet.new("Earth")
    alien.speech
    alien.buy_spaceship
    refute alien.ship_ready?
    alien.pack_plumbus
    assert alien.ship_ready?
  end

  def test_after_buying_a_spaceship_and_packing_a_plumbus_can_visit_planets
    alien = Alien.new("Jonathan")
    planet = Planet.new("Earth")
    assert_equal "I don't have a spaceship", alien.visit(planet)
    alien.speech
    alien.buy_spaceship
    assert_equal "I forgot to bring a plumbus", alien.visit(planet)
    alien.pack_plumbus
    assert alien.ship_ready?
    assert_equal "Earth here I come!", alien.visit(planet)
  end


end
