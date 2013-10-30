# encoding: utf-8

class Band < ActiveRecord::Base
  has_many :members
end
