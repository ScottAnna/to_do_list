class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :user
  accepts_nested_attributes_for :tasks, reject_if: proc { |attributes| attributes['name'].blank?},
      allow_destroy: true

  def next_order_number
    self.tasks.count + 1
  end
  
end
