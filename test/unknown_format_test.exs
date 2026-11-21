defmodule Chronic.UnknownFormatTest do
  use ExUnit.Case, async: true

  test "возвращает ошибку, если формат неизвестен" do
    assert {:error, :unknown_format} = Chronic.parse("определенно не известный формат, нет сэра")
  end
end
