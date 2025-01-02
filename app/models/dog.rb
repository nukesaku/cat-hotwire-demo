class Dog < ApplicationRecord
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }

  broadcasts_to -> (_dog) { "dogs" }, inserts_by: :prepend

  def self.ransackable_attributes(auth_object = nil)
    ["age", "created_at", "id", "name", "updated_at"]
  end
end
