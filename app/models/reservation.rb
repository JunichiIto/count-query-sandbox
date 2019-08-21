class Reservation < ApplicationRecord
  belongs_to :restaurant

  def self.count_by_category
    subquery = Reservation.all
                 .joins(restaurant: { courses: :category })
                 .select(%(
                        distinct categories.name AS category_name,
                                 reservations.id AS reservation_id
                      ))

    reservations = Reservation.from("(#{subquery.to_sql}) AS reservations")
                     .group('reservations.category_name')
                     .select(%(
                            reservations.category_name AS category_name,
                            COUNT(reservations.reservation_id) AS reservation_count
                          ))

    reservations.to_h do |reservation|
      [reservation.category_name, reservation.reservation_count]
    end
  end

  def self.count_by_category2
    categories = Category
                   .joins(courses: { restaurant: :reservations })
                   .group('categories.name')
                   .select('categories.name, COUNT(DISTINCT reservations.id) AS reservation_count')
    categories.to_h do |category|
      [category.name, category.reservation_count]
    end
  end

  def self.count_by_category3
    reservations = Reservation
      .joins(restaurant: { courses: :category })
      .group('categories.name')
      .select('categories.name AS category_name, COUNT(DISTINCT reservations.id) AS reservation_count')
    reservations.to_h do |reservation|
      [reservation.category_name, reservation.reservation_count]
    end
  end

  def self.count_by_category4
    Category
      .joins(courses: { restaurant: :reservations })
      .group(:name)
      .count('DISTINCT reservations.id')
  end

  def self.count_by_category5
    Category
      .joins(courses: { restaurant: :reservations })
      .group(:name)
      .distinct
      .count('reservations.id')
  end

  def self.count_by_category6
    Reservation
      .joins(restaurant: { courses: :category })
      .group('categories.name')
      .distinct
      .count(:id)
  end
end
