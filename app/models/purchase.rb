class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :store

  has_many :shoppings
  has_many :purchase_informations

  def self.save_with_purchase_informations(params)
    purchase = self.new(params.except(:purchase_informations))
    begin
      self.transaction do
        params[:purchase_informations].each do |attrs|
          purchase.purchase_informations.build(attrs)
        end
        purchase.save!
      end
    rescue ActiveRecord::RecordInvalid => invalid
    end
    purchase
  end
end
