require File.expand_path("../../test_helper", __FILE__)

class Web3::HpbTest < Minitest::Test
  def test_that_it_has_a_version_number
     refute_nil ::Web3::Hpb::VERSION
  end

  def test_it_does_something_useful
    assert true
  end
end
