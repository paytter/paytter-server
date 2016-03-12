class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :purchase

  has_many :bank_accounts
  has_many :shoppings

  def self.save_with_bank_accounts(params)
    user = self.new(params.except(:my_accounts))
    begin
      self.transaction do
        # TODO: 変更する
        user.password = 'password'
        params.slice(:my_accounts).map do |attrs|
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
