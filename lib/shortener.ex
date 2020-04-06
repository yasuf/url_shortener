
defmodule Shortener do
  def characters() do
    [
      "a", "b", "c", "d", "e","f","g","h","i","j",
      "k","l","m","n","o","p","q","r","s","t","u","v","w",
      "x","y","z","A","B","C","D","E","F","G","H","I","J",
      "K","L","M","N","O","P","Q","R","S","T","U","V","W",
      "Y","Z", "0","1","2","3","4","5","6","7","8","9"
    ]  
  end

  def generate_code(length) do
    code = []
    generate_code(code, length)
  end

  def generate_code(code, length) when length > 0 do
    new_letter = Enum.random(characters())
    new_code = code ++ [new_letter]
    generate_code(new_code, length-1)
  end

  def generate_code(code, _length) do
    Enum.reduce(code, "", fn letter, acc -> acc <> letter end)
  end  
end