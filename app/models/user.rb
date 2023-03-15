class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :inventories, foreign_key: 'user_id'
  has_many :recipes, foreign_key: 'user_id'

  ROLES = %i[admin default].freeze

  validates :name, presence: true

  #def is?(requested_role)
  #  role == requested_role.to_s
  #end

end
