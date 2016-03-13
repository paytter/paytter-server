class Clients::BaseController < Devise::RegistrationsController

  skip_before_action :authorized_access_token!
  before_action :authenticate_client!

  def index
  end
end
