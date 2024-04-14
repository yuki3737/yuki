class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :new_nihon_paths, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_nihons, through: :likes, source: :nihon
  has_many :comments, dependent: :destroy
  has_many :nihons, dependent: :destroy 
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 
  def already_liked?(nihon)
    self.likes.exists?(nihon_id: nihon.id)
  end

end
