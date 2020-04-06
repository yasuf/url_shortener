defmodule Count do
  def countdown(from) when from > 0 do
    IO.inspect(from)
    countdown(from-1)
  end

  def countdown(_) do
    IO.puts("Blast off!")
  end
end