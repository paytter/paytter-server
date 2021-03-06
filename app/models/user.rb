class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :purchase

  has_many :bank_accounts
  has_many :shoppings
  has_many :visits
  has_many :stores, through: :visits

  mount_uploader :image, ImageUploader

  mount_uploader :image, ImageUploader

  def self.save_with_bank_accounts(params)
    user = self.new(params.except(:my_accounts))
    begin
      self.transaction do
        user.password = 'password'
        params[:my_accounts].each do |attrs|
          user.bank_accounts.build(attrs)
        end

        user.access_token = SecureRandom.urlsafe_base64(24).tr('lIO0', 'sxyz')

        user.save!
      end
    rescue ActiveRecord::RecordInvalid => invalid
    end
    user
  end
end
