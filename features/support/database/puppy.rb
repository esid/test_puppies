require 'active_record'

class Puppy < ActiveRecord::Base
   has_many :adoptions

end