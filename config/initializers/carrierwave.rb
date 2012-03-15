CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJRLEHFD4D24JAJ3Q',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'homeworkio'                     # required
  config.fog_host       = ''            # optional, defaults to nil
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
