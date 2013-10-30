# encoding: utf-8

class MemberApi < Grape::API
  resource :members do

    desc 'Get all members'
    get do
      present Member.all, with: Entities::Member
    end

    desc 'Get a member'
    params do
      requires :id, type: String, desc: 'The member id'
    end
    get ':id' do
      present Member.find(params[:id]), with: Entities::Member
    end

    desc 'Create a new member'
    params do
      group :member do
        requires :name,     type: String,   desc: 'Name of the member'
        optional :band_id,  type: Integer,  desc: 'The band id'
      end
    end
    post do
      member = Member.create parameters.require(:member).permit(:name, :band_id)
      present member, with: Entities::Member
    end

    desc 'Update an existing member'
    params do
      requires :id,       type: String, desc: 'The member id'
      group :member do
        optional :name,     type: String, desc: 'Name of the member'
        optional :band_id,  type: Integer,  desc: 'The band id'
      end
    end
    put ':id' do
      member = Member.find params[:id]
      member.update_attributes parameters.require(:member).permit(:name, :band_id)
      present member, with: Entities::Member
    end

    desc 'Destroy a member'
    params do
      requires :id, type: String, desc: 'The member id'
    end
    delete ':id' do
      member = Member.find(params[:id])
      member.destroy
      present member, with: Entities::Member
    end
  end
end
