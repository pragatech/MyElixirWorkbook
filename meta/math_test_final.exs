defmodule MathTest do
    use Assertion

    test "Integers can be added and subtracted" do
        assert 2 + 3 == 5
        assert 5 - 5 == 10
    end

    test "Integers can be miltiplied and divided" do
        assert 5 * 5 == 25
        assert 10 / 2 == 5
    end
end