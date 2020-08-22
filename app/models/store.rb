class Store < ApplicationRecord
  has_many :books
  has_many :open_times
  has_many :transcations

  def self.search_open(datetime, day, time)
    result = []
    if datetime.present?
      day_of_week = datetime.to_datetime.strftime('%a')
      day_of_time = datetime.to_datetime.strftime('%H:%M')

      Store.all.each do |store|
        target = store.open_times.where(day: day_of_week).where("start_time > ? AND end_time < ?", day_of_time, day_of_time)
        result << store if target.present?
      end

    elsif day.present? && time.present?
      Store.all.each do |store|
        target = store.open_times.where(day: day).where("start_time > ? AND end_time < ?", time, time)
        result << store if target.present?
      end
    end
    result
  end
end