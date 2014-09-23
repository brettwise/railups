class Workout < ActiveRecord::Base
  belongs_to :user

  enum status: [:open, :closed]
end
