class Product < ApplicationRecord
    belongs_to :shop
    validates :name, presence: true
    
    validates :date_time

    def date_time
        if date.present? && date > Date.today
          errors.add(:the_date, "can't be in the future")
        end
      end
end
