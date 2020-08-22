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

  def self.seach_openhours(hours, more_or_less = true, time_span='day')
    result = []

    Store.all.each do |store|
      if time_span == 'day'
        store.open_times.each do |time|
          diff = TimeDifference.between(time.start_time.to_datetime.strftime('%H:%M'), time.end_time.to_datetime.strftime('%H:%M')).in_hours
          if ActiveModel::Type::Boolean.new.cast(more_or_less) == true && diff >= hours.to_i
            result << store
            break
          end

          if ActiveModel::Type::Boolean.new.cast(more_or_less) == false && diff < hours.to_i
            result << store
            break
          end
        end
      elsif time_span == 'week'
        count = 0

        store.open_times.each do |time|
          diff = TimeDifference.between(time.start_time.to_datetime, time.end_time.to_datetime).in_hours
          count += diff
        end

        if ActiveModel::Type::Boolean.new.cast(more_or_less) == true && count >= hours.to_i
          result << store 
        end
        
        if ActiveModel::Type::Boolean.new.cast(more_or_less) == false && count < hours.to_i
          result << store  
        end
      end
    end
    result
  end

  def self.search_amounts(books_amount, more_or_less = true, price_min, price_max)
    result = []

    Store.all.each do |store|
      target_count = store.books.count

      if ActiveModel::Type::Boolean.new.cast(more_or_less) == true
        if price_min.present? && price_max.present?
          target_count = store.books.where("price >= ? AND price <= ?", price_min.to_i, price_max.to_i).count
          result << store if target_count >= books_amount.to_i
        else
          result << store if target_count >= books_amount.to_i
        end
      else
        if price_min.present? && price_max.present?
          target_count = store.books.where("price >= ? AND price <= ?", price_min.to_i, price_max.to_i).count
          result << store if target_count < books_amount.to_i
        else
          result << store if target_count < books_amount.to_i
        end
      end
    end
    result
  end
end