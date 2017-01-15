defmodule Words do
  def anagram?(word1, word2) do
    w1 = String.codepoints(word1)
    w2 = String.codepoints(word2)
    Enum.sort(w1) == Enum.sort(w2)
  end
end
