gem 'minitest', '>= 5.0.0'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '12days'

class TwelveDaysTest < Minitest::Test
  def test_day_one_gift
    l = "a partridge in a pear tree"
    g = Xmas.gifts(0).first
    assert_equal l, g
  end

  def test_day_two_gift
    l1 = "two turtle doves"
    l2 = "and a partridge in a pear tree"
    g1, g2 = Xmas.gifts(1)

    assert_equal l1, g1
    assert_equal l2, g2
  end

  def test_day_five_yelling_gift
    yell = Xmas.gifts(4).first
    assert_equal "FIVE GOLDEN RINGS", yell
  end

  def test_first_verse
    v1, v2 = Xmas.verse(0).split("\n")
    assert_equal "On the first day of Christmas my true love gave to me", v1
    assert_equal "a partridge in a pear tree", v2
  end

  def test_second_verse
    v1, v2, v3 = Xmas.verse(1).split("\n")

    assert_equal "On the second day of Christmas my true love gave to me", v1
    assert_equal "two turtle doves", v2
    assert_equal "and a partridge in a pear tree", v3
  end

  def test_last_verse
    last_verse = <<-SONG
On the twelfth day of Christmas my true love gave to me
twelve drummers drumming
eleven pipers piping
ten lords-a-leaping
nine ladies dancing
eight maids-a-milking
seven swans-a-swimming
six geese-a-laying
FIVE GOLDEN RINGS
four calling birds
three french hens
two turtle doves
and a partridge in a pear tree
SONG

    assert_equal last_verse.strip, Xmas.verse(11)
  end

  def test_sing_whole_song
    whole_song = File.read(File.dirname(__FILE__) + '/12days.txt')
    assert_equal whole_song.strip, Xmas.sing
  end
end

class Xmas

  attr_accessor :gifts, :verse

  def self.gifts(day)
    day12 = "twelve drummers drumming"
    day11 = "eleven pipers piping"
    day10 = "ten lords-a-leaping"
    day09 = "nine ladies dancing"
    day08 = "eight maids-a-milking"
    day07 = "seven swans-a-swimming"
    day06 = "six geese-a-laying"
    day05 = "FIVE GOLDEN RINGS"
    day04 = "four calling birds"
    day03 = "three french hens"
    day02 = "two turtle doves"
    day01 = "and a partridge in a pear tree"
    day00 = "a partridge in a pear tree"

    case day
    when 0
      [day00]
    when 1
      [day02, day01]
    when 2
      [day03, day02, day01]
    when 3
      [day04, day03, day02, day01]
    when 4
      [day05, day04, day03, day02, day01]
    when 5
      [day06, day05, day04, day03, day02, day01]
    when 6
      [day07, day06, day05, day04, day03, day02, day01]
    when 7
      [day08, day07, day06, day05, day04, day03, day02, day01]
    when 8
      [day09, day08, day07, day06, day05, day04, day03, day02, day01]
    when 9
      [day10, day09, day08, day07, day06, day05, day04, day03, day02, day01]
    when 10
      [day11, day10, day09, day08, day07, day06, day05, day04, day03, day02, day01]
    when 11
      [day12, day11, day10, day09, day08, day07, day06, day05, day04, day03, day02, day01]
    end
  end

  def self.verse(verse_input)
    lines_to_sing = ""
    
    self.gifts(verse_input).each do |line|
      lines_to_sing += "\n#{line}"
    end

    day_word_array = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

    "On the #{day_word_array[verse_input]} day of Christmas my true love gave to me#{lines_to_sing}"

  end

  def self.sing
    song = "#{verse(0)}"
    counter = 1
    11.times do
      song += "\n\n#{verse(counter)}"
      counter += 1
    end

    song

  end

end

# puts Xmas.sing
