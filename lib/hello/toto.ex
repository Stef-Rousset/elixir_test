defmodule Hello.Toto do
  def reduce_toto(toto_list) do
    toto_list
    |> Enum.reduce(0, fn elem, acc -> toto(elem, acc) end)
  end

  def toto(%{"ma_cle" => val}, acc) when is_integer(val) do
    acc + val * 2
  end

  def toto(%{"ma_cle" => _val}, acc) do
    acc
  end

  def toto(%{"ma_valeur" => val}, acc) do
    acc + val
  end

  def toto(_, acc) do
    acc
  end
end
