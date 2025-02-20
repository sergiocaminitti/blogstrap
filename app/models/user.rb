class User < ApplicationRecord
  rolify
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :confirmable,
          :database_authenticatable,
          :recoverable,
          :registerable,
          :rememberable,
          :trackable,
          :validatable
end
