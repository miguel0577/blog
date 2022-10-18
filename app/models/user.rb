class User < ApplicationRecord
  has_many :followers, foreign_key: "followed_id", class_name: "Follow"
  has_many :following, foreign_key: "follower_id", class_name: "Follow"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

end
