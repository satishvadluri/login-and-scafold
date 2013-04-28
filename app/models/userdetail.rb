class Userdetail < ActiveRecord::Base
  attr_accessible :enabled, :firstname, :lastname, :password, :userid
end
