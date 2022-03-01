class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items,dependent: :destroy
  has_many :orders,dependent: :destroy
  has_many :addresses,dependent: :destroy

  validates :last_name, :first_name, :last_name_kana, :first_name_kana,
    length:{ minimum: 1, maximum: 100 },presence: true
  validates :postal_code,
    length:{ is:7 },presence: true
  validates :address,
    length:{ maximum:200 },presence: true
  validates :telephone_number,
    length:{ in: 10..11 },presence: true
  validates :email,
    presence: true


  def full_name
    last_name + first_name
  end

  def full_name_kana
    last_name_kana + first_name_kana
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end



end
