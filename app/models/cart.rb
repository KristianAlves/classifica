class Cart < ActiveRecord::Base
  belongs_to :ad
  belongs_to :buyer, class_name: "Member"

  def self.total
    self.sum(:amount)
  end
end
