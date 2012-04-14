if Rails.env.production?
  DelayedJobWeb.use Rack::Auth::Basic do |username, password|
    username == 'dj'
    password == 'odessa'
  end
end
