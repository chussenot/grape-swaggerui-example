# encoding: utf-8

module Entities
  class Member < Grape::Entity
    expose :id
    expose :name
    expose :band
  end
end
