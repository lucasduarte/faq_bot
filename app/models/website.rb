require "pg_search"
include PgSearch

class Website < ActiveRecord::Base
  validates_presence_of :name, :url

  belongs_to :company

  pg_search_scope :search, :against => [:name, :url]
end