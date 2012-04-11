require 'dropbox_sdk'

ACCESS_TYPE = :app_folder

class DbSession < ActiveRecord::Base
    validates :user_id, :uniqueness => true
	belongs_to :user

	attr_accessible :session, :user

    def db_auth
        dbsession = DropboxSession.deserialize(session)
        client = DropboxClient.new(dbsession, ACCESS_TYPE) #raise an exception if session not authorized
        #info = client.account_info # look up account information
    end

    def upload(filename, file)
        client = db_auth        
        #uploading the file
        resp = client.put_file(filename, file)
    end

    def create_folder(path)
        client = db_auth

        begin
            resp = client.metadata(path)
        rescue DropboxError
            resp = client.file_create_folder(path)
        end     
    end

    private :db_auth
end
