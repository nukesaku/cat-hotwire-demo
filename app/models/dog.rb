class Dog < ApplicationRecord
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }

  after_create_commit -> { broadcast_prepend_to("dogs") }
  after_update_commit -> { broadcast_replace_to("dogs") }
  after_destroy_commit -> { broadcast_remove_to("dogs") }

  def self.ransackable_attributes(auth_object = nil)
    ["age", "created_at", "id", "name", "updated_at"]
  end
end
