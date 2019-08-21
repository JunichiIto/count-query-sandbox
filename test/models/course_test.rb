require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "the truth" do
    assert_equal({'イタリアン' => 6, '和食' => 3}, Reservation.count_by_category)
    assert_equal({'イタリアン' => 6, '和食' => 3}, Reservation.count_by_category2)
    assert_equal({'イタリアン' => 6, '和食' => 3}, Reservation.count_by_category3)
    assert_equal({'イタリアン' => 6, '和食' => 3}, Reservation.count_by_category4)
    assert_equal({'イタリアン' => 6, '和食' => 3}, Reservation.count_by_category5)
    assert_equal({'イタリアン' => 6, '和食' => 3}, Reservation.count_by_category6)
  end
end
