class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  #validates 門番みたいなもの 無効なデータでないことを検証する
  #presence 空のデータを登録できないようにする
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  
end
