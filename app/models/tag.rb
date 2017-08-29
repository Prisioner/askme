class Tag < ApplicationRecord
  has_and_belongs_to_many :questions

  validates :name, presence: true, uniqueness: true, format: { with: TAG_REGEX }
  validates :alias, presence: true, uniqueness: true

  before_validation :downcase_name
  before_validation :generate_alias

  private

  def downcase_name
    name.downcase! if name.present?
  end

  def generate_alias
    self.alias = name.delete('#') if name.present?
  end
end