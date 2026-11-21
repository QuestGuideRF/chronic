defmodule Chronic.RelativeTest do
  use ExUnit.Case, async: true
  use Chronic.TestHelpers

  test "завтра в 10 утра" do
    {:ok, time, offset} = Chronic.parse("завтра в 10 утра", currently: frozen_time())
    assert time == %NaiveDateTime{year: 2015, month: 5, day: 10, hour: 10, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "вчера в 10 утра" do
    {:ok, time, offset} = Chronic.parse("вчера в 10 утра", currently: frozen_time())
    assert time == %NaiveDateTime{year: 2015, month: 5, day: 8, hour: 10, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "сегодня 10 утра" do
    {:ok, time, offset} = Chronic.parse("сегодня 10 утра", currently: frozen_time())
    assert time == %NaiveDateTime{year: 2015, month: 5, day: 9, hour: 10, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "сегодня в 10 утра" do
    {:ok, time, offset} = Chronic.parse("сегодня в 10 утра", currently: frozen_time())
    assert time == %NaiveDateTime{year: 2015, month: 5, day: 9, hour: 10, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "tuesday" do
    {:ok, time, offset} = Chronic.parse("tuesday", currently: frozen_time())
    assert time == %NaiveDateTime{year: 2015, month: 5, day: 12, hour: 12, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "Tuesday" do
    {:ok, time, offset} = Chronic.parse("Tuesday", currently: frozen_time())
    assert time == %NaiveDateTime{year: 2015, month: 5, day: 12, hour: 12, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "tue" do
    {:ok, time, offset} = Chronic.parse("tue", currently: frozen_time())
    assert time == %NaiveDateTime{year: 2015, month: 5, day: 12, hour: 12, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "Вторник, 9 утра" do
    {:ok, time, offset} = Chronic.parse("Вторник, 9 утра", currently: frozen_time())
    assert time == %NaiveDateTime{year: 2015, month: 5, day: 12, hour: 9, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "Вторник с 16:00 до 9:00 того же дня" do
    {:ok, time, offset} = Chronic.parse("Вторник, 16:00", currently: {{2018, 9, 25}, {9, 0, 0}})
    assert time == %NaiveDateTime{year: 2018, month: 9, day: 25, hour: 16, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "Вторник с 16:00 до 16:00 того же дня" do
    {:ok, time, offset} = Chronic.parse("Вторник, 16:00", currently: {{2018, 9, 25}, {16, 0, 0}})
    assert time == %NaiveDateTime{year: 2018, month: 10, day: 2, hour: 16, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "вторник в 9 утра" do
    {:ok, time, offset} = Chronic.parse("вторник в 9 утра", currently: frozen_time())
    assert time == %NaiveDateTime{year: 2015, month: 5, day: 12, hour: 9, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "Воскресенье, 12:00" do
    {:ok, time, offset} = Chronic.parse("Воскресенье, 12:00", currently: {{2018, 9, 28}, {8, 0, 0}})
    assert time == %NaiveDateTime{year: 2018, month: 9, day: 30, hour: 12, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "понедельник 12:00" do
    {:ok, time, offset} = Chronic.parse("понедельник 12:00", currently: {{2018, 9, 28}, {8, 0, 0}})
    assert time == %NaiveDateTime{year: 2018, month: 10, day: 1, hour: 12, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "Вторник, 12:00" do
    {:ok, time, offset} = Chronic.parse("Вторник, 12:00", currently: {{2018, 9, 28}, {8, 0, 0}})
    assert time == %NaiveDateTime{year: 2018, month: 10, day: 2, hour: 12, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "Среда, 12:00" do
    {:ok, time, offset} = Chronic.parse("Среда, 12:00", currently: {{2018, 9, 28}, {8, 0, 0}})
    assert time == %NaiveDateTime{year: 2018, month: 10, day: 03, hour: 12, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "Четверг, 12:00" do
    {:ok, time, offset} = Chronic.parse("Четверг, 12:00", currently: {{2018, 9, 28}, {8, 0, 0}})
    assert time == %NaiveDateTime{year: 2018, month: 10, day: 4, hour: 12, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "Пятница, 12:00" do
    {:ok, time, offset} = Chronic.parse("Пятница, 12:00", currently: {{2018, 9, 28}, {8, 0, 0}})
    assert time == %NaiveDateTime{year: 2018, month: 9, day: 28, hour: 12, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "Суббота, 12:00" do
    {:ok, time, offset} = Chronic.parse("Суббота, 12:00", currently: {{2018, 9, 28}, {8, 0, 0}})
    assert time == %NaiveDateTime{year: 2018, month: 9, day: 29, hour: 12, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "6 утра" do
    {:ok, time, offset} = Chronic.parse("6 утра", currently: frozen_time())
    assert time == %NaiveDateTime{year: 2015, month: 5, day: 9, hour: 6, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "6 вечера" do
    {:ok, time, offset} = Chronic.parse("6 вечера", currently: frozen_time())
    assert time == %NaiveDateTime{year: 2015, month: 5, day: 9, hour: 18, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end

  test "суббота в 7 вечера" do
    {:ok, time, offset} = Chronic.parse("суббота в 7 вечера", currently: frozen_time())
    assert time == %NaiveDateTime{year: 2015, month: 5, day: 16, hour: 19, minute: 0, second: 0, microsecond: {0, 6}}
    assert offset == 0
  end
end
