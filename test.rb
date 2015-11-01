require 'test/unit'
require './nand'

class TestFoo < Test::Unit::TestCase
  class << self
    def startup
    end
  end

  test "not関数の仕様" do
    assert_equal 1, Nand.not(0)
    assert_equal 0, Nand.not(1)
  end

  test "and関数の仕様" do
    assert_equal 0, Nand.and(0,0)
    assert_equal 0, Nand.and(1,0)
    assert_equal 0, Nand.and(0,1)
    assert_equal 1, Nand.and(1,1)
  end

  test "or関数の仕様" do
    assert_equal 0, Nand.or(0,0)
    assert_equal 1, Nand.or(1,0)
    assert_equal 1, Nand.or(0,1)
    assert_equal 1, Nand.or(1,1)
  end

  test "nand関数の仕様" do
    assert_equal 1, Nand.nand(0,0)
    assert_equal 1, Nand.nand(1,0)
    assert_equal 1, Nand.nand(0,1)
    assert_equal 0, Nand.nand(1,1)
  end

  test "nor関数の仕様" do
    assert_equal 1, Nand.nor(0,0)
    assert_equal 0, Nand.nor(1,0)
    assert_equal 0, Nand.nor(0,1)
    assert_equal 0, Nand.nor(1,1)
  end

  test "xor関数の仕様" do
    assert_equal 0, Nand.xor(0,0)
    assert_equal 1, Nand.xor(1,0)
    assert_equal 1, Nand.xor(0,1)
    assert_equal 0, Nand.xor(1,1)
  end

  # ==============================

  test "notをnandで作る例" do
    def my_not(a)
      Nand.nand(a,a)
    end

    assert_equal 1, my_not(0)
    assert_equal 0, my_not(1)
  end

  test "andをorとnotで作る例" do
    def my_and(a,b)
      _ = Nand
      _.not(_.or(_.not(a), _.not(b)))
    end

    assert_equal 0, my_and(0,0)
    assert_equal 0, my_and(1,0)
    assert_equal 0, my_and(0,1)
    assert_equal 1, my_and(1,1)
  end

  test "orをandとnotで作る例" do
    def my_or(a,b)
      _ = Nand
      _.not(_.and(_.not(a), _.not(b)))
    end

    assert_equal 0, my_or(0,0)
    assert_equal 1, my_or(1,0)
    assert_equal 1, my_or(0,1)
    assert_equal 1, my_or(1,1)
  end
end
