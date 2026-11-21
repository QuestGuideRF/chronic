defmodule Chronic.MonthAndDayTest do
  use ExUnit.Case, async: true
  use Chronic.TestHelpers

  test "месяц и день" do
    {:ok, time, offset} = Chronic.parse("3 августа")

    assert time == %NaiveDateTime{year: current_year(), month: 8, day: 3, hour: 0, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "месяц и день с заглавной буквы" do
    {:ok, time, offset} = Chronic.parse("3 августа")

    assert time == %NaiveDateTime{year: current_year(), month: 8, day: 3, hour: 0, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "месяц и порядковый день" do
    {:ok, time, offset} = Chronic.parse("3 августа")

    assert time == %NaiveDateTime{year: current_year(), month: 8, day: 3, hour: 0, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "month with dot and date (aug. 3)" do
    {:ok, time, offset} = Chronic.parse("август 3")
    assert time == %NaiveDateTime{year: current_year(), month: 8, day: 3, hour: 0, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "месяц и день с тире" do
    {:ok, time, offset} = Chronic.parse("aug-20")
    assert time == %NaiveDateTime{year: current_year(), month: 8, day: 20, hour: 0, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "месяц с днем ​​и временем PM" do
    {:ok, time, offset} = Chronic.parse("3 авг., 17:26")
    assert time == %NaiveDateTime{year: current_year(), day: 3, hour: 17, minute: 26, month: 8, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "месяц с днем ​​и AM-время" do
    {:ok, time, offset} = Chronic.parse("3 августа, 9:26")
    assert time == %NaiveDateTime{year: current_year(), month: 8, day: 3, hour: 9, minute: 26, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "месяц с днем ​​и время после полудня с форматированием пространства." do
    {:ok, time, offset} = Chronic.parse("3 авг., 17:26")
    assert time == %NaiveDateTime{year: current_year(), day: 3, hour: 17, minute: 26, month: 8, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "месяц с днем ​​и время AM с форматированием пространства" do
    {:ok, time, offset} = Chronic.parse("3 августа 9:26")
    assert time == %NaiveDateTime{year: current_year(), month: 8, day: 3, hour: 9, minute: 26, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "месяц с днем, со временем «в»" do
    {:ok, time, offset} = Chronic.parse("3 авг. в 9:26")
    assert time == %NaiveDateTime{year: current_year(), month: 8, day: 3, hour: 9, minute: 26, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "месяц с днем, с «в» AM временем с секундами" do
    {:ok, time, offset} = Chronic.parse("3 авг. в 9:26:15")
    assert time == %NaiveDateTime{year: current_year(), day: 3, hour: 9, minute: 26, month: 8, second: 15, microsecond: {0, 6}}
    assert offset == 0
  end

  test "месяц с днем, с временем AM с секундами и микросекундами" do
    {:ok, time, offset} = Chronic.parse("may 28 at 5:32:19.764")
    assert time == %NaiveDateTime{year: current_year(), month: 5, day: 28, hour: 5, minute: 32, second: 19, microsecond: {764, 6}}
    assert offset == 0
  end

  test "анализ с годом, когда все числа меньше или равны 31" do
    {:ok, time, offset} = Chronic.parse("20-aug-16")
    assert time == %NaiveDateTime{year: 2016, month: 8, day: 20, hour: 0, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0

    {:ok, time, offset} = Chronic.parse("16-aug-20")
    assert time == %NaiveDateTime{year: 2020, month: 8, day: 16, hour: 0, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "анализ с годом, когда одно число больше 31" do
    {:ok, time, offset} = Chronic.parse("2016-aug-20")
    assert time == %NaiveDateTime{year: 2016, month: 8, day: 20, hour: 0, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0

    {:ok, time, offset} = Chronic.parse("16-aug-2020")
    assert time == %NaiveDateTime{year: 2020, month: 8, day: 16, hour: 0, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

end
