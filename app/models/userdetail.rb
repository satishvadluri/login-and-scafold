
class Userdetail < ActiveRecord::Base

	include ActiveRecord::Validations
    attr_accessible :enabled, :firstname, :lastname, :password, :userid

     validates_uniqueness_of :userid
     validates :userid, :presence => true, :length => { :minimum => 5 } 
  
     validates :firstname, :presence => true, :length => { :minimum => 5 } 

      validates :lastname, :presence => true, :length => { :minimum => 3 } 

       validates :password, :presence => true, :length => { :minimum => 3 } 

        #validates :lastname, :presence => true, :length => { :minimum => 3 } 
end
