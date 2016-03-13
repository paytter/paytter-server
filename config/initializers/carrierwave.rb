CarrierWave.configure do |config|
  if Rails.env == 'development'
    config.asset_host = 'http://localhost:3000'
  else
    config.asset_host = "http://#{ENV.fetch('deploy_host')}"
  end
end
