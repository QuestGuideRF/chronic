defmodule Chronic.ISO8601Test do
  use ExUnit.Case, async: true
  use Chronic.TestHelpers

  test "время iso8601" do
    {:ok, time, offset} = Chronic.parse("2012-08-02T13:00:00")
    assert time == %NaiveDateTime{year: 2012, month: 8, day: 2, hour: 13, minute: 0, second: 0, microsecond: {0, 0}}
    assert offset == nil
  end

  test "время iso8601 со смещением" do
    {:ok, time, offset} = Chronic.parse("2012-08-02T13:00:00+01:00")
    assert time == %NaiveDateTime{year: 2012, month: 8, day: 2, hour: 13, minute: 0, second: 0, microsecond: {0, 0}}
    assert offset == 3600
  end

  test "время iso8601 со смещением и мс" do
    {:ok, time, offset} = Chronic.parse("2013-08-01T19:30:00.345-07:00")
    assert time == %NaiveDateTime{year: 2013, month: 8, day: 1, hour: 19, minute: 30, second: 0, microsecond: {345_000, 3}}
    assert offset == -25_200
  end

  test "iso8601 с зоной UTC" do
    {:ok, time, offset} = Chronic.parse("2012-08-02T12:00:00Z")
    assert time == %NaiveDateTime{year: 2012, month: 8, day: 2, hour: 12, minute: 0, second: 0, microsecond: {0, 0}}
    assert offset == 0
  end

  test "iso8601 с мс" do
    {:ok, time, offset} = Chronic.parse("2012-01-03 01:00:00.234567")
    assert time == %NaiveDateTime{year: 2012, month: 1, day: 3, hour: 1, minute: 0, second: 0, microsecond: {234_567, 6}}
    assert offset == nil
  end
end
