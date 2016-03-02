require ("minitest/autorun")
require_relative("../models/shoo.rb")

class TestPizza < MiniTest::Test

  def setup
    params={
      "first_name" => "Tony",
      "last_name" => "Goncalves",
      "address" => "address",
      "style" => "Kool",
      "size" => "8",
      "quantity" => "1"
    }

    @shoe= Shoe.new("Tony","Goncalves")
  end

  def test_first_name
    assert_equal("Tony",@shoe.first_name)
  end

  def test_name_format
    assert_equal("Tony Goncalves",@shoe.name_format)
  end
end