# encoding: utf-8

class BandApi < Grape::API
  resource :bands do

    desc 'Get all bands'
    get do
      present Band.all, with: Entities::Band
    end

    desc 'Get a band'
    params do
      requires :id, type: String, desc: 'The band id'
    end
    get ':id' do
      present Band.find(params[:id]), with: Entities::Band
    end

    desc 'Create a new band'
    params do
      group :band do
        requires :name, type: String, desc: 'Name of the band'
      end
    end
    post do
      band = Band.create parameters.require(:band).permit(:name)
      present band, with: Entities::Band
    end

    desc 'Update an existing band'
    params do
      requires :id,   type: String, desc: 'The band id'
      group :band do
        optional :name, type: String, desc: 'Name of the band'
      end
    end
    put ':id' do
      band = Band.find params[:id]
      band.update_attributes parameters.require(:band).permit(:name)
      present band, with: Entities::Band
    end

    desc 'Destroy a band'
    params do
      requires :id, type: String, desc: 'The band id'
    end
    delete ':id' do
      band = Band.find(params[:id])
      band.destroy
      present band, with: Entities::Band
    end
  end
end
