class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :lists

  after_create do |user|
    user.lists.create name: "#{user.alias}'s students", is_default: true
  end

  def alias
    email.gsub(/@.*/, "")
  end

  def first_login?
    sign_in_count <= 1
  end

  def only_default_list?
    lists.default.present? && lists.non_default.empty?
  end

  def default_list_empty?
    puts lists.default.inspect
    lists.default.empty?
  end
end
