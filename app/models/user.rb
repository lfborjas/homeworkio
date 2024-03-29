class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :lists
  has_one :db_session

  after_create do |user|
    user.lists.create name: "#{user.alias}'s students", is_default: true
  end

  def uses_dropbox?
    db_session.present?
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
    lists.default.empty?
  end

  def no_homeworks?
    lists.default.homeworks.empty?
  end
end
