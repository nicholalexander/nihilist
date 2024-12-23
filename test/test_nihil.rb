# frozen_string_literal: true

require "test_helper"
require "minitest/autorun"

class TestNihil < Minitest::Test
  def test_that_it_has_a_version_number
    assert ::Nihil::VERSION == "0.1.1"
  end

  def test_that_any_method_returns_nil
    bean = Nihil.new
    assert_nil bean.bloop!
  end

  def test_that_it_responds_to_any_method
    bean = Nihil.new
    assert bean.respond_to?(:bloop)
  end

  def test_that_the_class_responds_to_any_method
    assert_nil Nihil.blonk!
  end

  def test_when_accepting_a_block_it_returns_nil
    bean = Nihil.new do
      puts "Hello, World!"
    end
    assert_nil bean.blurgh
  end

  def test_when_accepting_a_block_it_does_not_call_the_block
    block_was_called = false
    bean = Nihil.new

    bean.some_method_that_accepts_a_block do
      block_was_called = true
    end

    refute block_was_called
  end

  def test_keysmash_with_args_is_nil
    bean = Nihil.new
    assert_nil bean.asdfaskldfjlskjdfsdlkjf(234234)
  end

  def test_insane_mode
    assert_raises(NoMethodError) { Nihil.bloof.blonk }
    Nihil.insane_mode!
    assert_nil Nihil.bloof.blonk
    Nihil.simmer_down!
    assert_raises(NoMethodError) { Nihil.bloof.blonk }
  end

  def test_insane_mode_is_safe_to_call_multiple_times
    Nihil.insane_mode!
    Nihil.insane_mode!
    Nihil.simmer_down!
    assert_raises(NoMethodError) { Nihil.bloof.blonk }
  end

  def test_that_you_can_not_call_ist
    assert_raises(NameError) { Nihil::Ist.new }
  end
end
