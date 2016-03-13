class Clients::BaseController < Devise::RegistrationsController

  skip_before_action :authorized_access_token!

  def index
  end
end
