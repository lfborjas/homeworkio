class List < ActiveRecord::Base
  scope :non_default, where(is_default: false)
  
  def self.default
    where(is_default: true).first
  end

  belongs_to :user
  has_many :students
  accepts_nested_attributes_for :students, :reject_if => :all_blank, :allow_destroy => true

  def empty?
    students.empty?
  end

end
