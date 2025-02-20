class User < ApplicationRecord
  rolify
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise  :confirmable,
          :database_authenticatable,
          :recoverable,
          :registerable,
          :rememberable,
          :trackable,
          :validatable

  validate :password_complexity

    private

    def password_complexity
      return if password.nil?

      errors.add :password, :complexity unless CheckPasswordComplexityService.call(password)
    end
end
