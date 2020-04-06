defmodule ShortenerTest do
  use ExUnit.Case
  doctest Shortener

  test "generates a code with the passed in length" do
    code = Shortener.generate_code(3)
    assert String.length(code) == 3
  end

  test "the generated code contains only hexadecimal characters" do
    code = Shortener.generate_code(10)
    assert String.match?(code, ~r/[^a-zA-Z0-9]/) == false
  end

  test "generates an empty string when passed a length of 0" do
    code = Shortener.generate_code(0)
    assert code == ""
  end
end