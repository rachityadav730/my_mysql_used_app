# app/models/secondary_user.rb
class SecondaryUser < ApplicationRecord
    self.abstract_class = true
    connects_to database: { writing: :secondary, reading: :secondary }
  end
  