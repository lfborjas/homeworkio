require 'dropbox_sdk'

# This is an example of a Rails 3 controller that authorizes an application
# and then uploads a file to the user's Dropbox.

# You must set these
APP_KEY = "qelxnquqo2l6nnt"
APP_SECRET = "6qjaqnjv1j2r07b"
ACCESS_TYPE = :app_folder #The two valid values here are :app_folder and :dropbox
                          #The default is :app_folder, but your application might be
                          #set to have full :dropbox access.  Check your app at
                          #https://www.dropbox.com/developers/apps


# Examples routes for config/routes.rb  (Rails 3)
#match 'db/authorize', :controller => 'db', :action => 'authorize'
#match 'db/upload', :controller => 'db', :action => 'upload'

class DropboxController < ApplicationController
    before_filter :authenticate_user!

    def authorize
        if not params[:oauth_token] then
            dbsession = DropboxSession.new(APP_KEY, APP_SECRET)

            session[:dropbox_session] = dbsession.serialize #serialize and save this DropboxSession

            #pass to get_authorize_url a callback url that will return the user here
            redirect_to dbsession.get_authorize_url url_for(:action => 'authorize')
        else
            # the user has returned from Dropbox
            user = current_user
            dbsession = DropboxSession.deserialize(session[:dropbox_session])
            dbsession.get_access_token  #we've been authorized, so now request an access_token
            unless user.db_session
                db_session = DbSession.new({:user => user, 
                    :session => dbsession.serialize.to_s})
                puts db_session.session
                db_session.save
            else
                user.db_session.session = dbsession.serialize
                user.db_session.save
            end            

            redirect_to root_path, notice: "Dropbox synced successfully. All homeworks from now on will be uploaded to the Apps/homeworkio folder"
        end
    end

    
end
