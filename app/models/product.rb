class Product < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  has_many :comments

    validates :name, presence: true

    validate :date_time

    def date_time
        if date.present? && date > Date.today
          errors.add(:the_date, "can't be in the future")
        end
      end
end
