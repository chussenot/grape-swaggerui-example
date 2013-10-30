# encoding: utf-8
require 'grape-swagger'

class BaseApi < Grape::API
  format :json

  helpers do

    # Usefull to use strong parameters filtering.
    def parameters
      ActionController::Parameters.new params
    end

  end

  mount BandApi
  mount MemberApi
  add_swagger_documentation mount_path: 'doc.json'
end
