# encoding: utf-8

module Entities
  class Band < Grape::Entity
    expose :id
    expose :name
    expose :members
  end
end
