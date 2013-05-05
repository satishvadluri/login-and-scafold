
class Userdetail < ActiveRecord::Base

	include ActiveRecord::Validations
    attr_accessible :enabled, :firstname, :lastname, :password, :password_confirmation, :userid, :password_digest

    has_secure_password

    #before_save { |userdetail| userdetail.userid = userid.downcase  }

     validates :userid,  :uniqueness => true, :length => { :minimum => 5 } 
     #validates_uniqueness_of :userid
     validates_confirmation_of :password, presence: true, :length => { :minimum => 5 } 

     
  
     validates :firstname, :presence => true, :length => { :minimum => 5 } 

     validates :lastname, :presence => true, :length => { :minimum => 3 } 

     validates :password, :presence => true, :length => { :minimum => 3 } 

     validates :password_confirmation, presence: true

     

     #VALID_USERID_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	 #validates :userid, presence:   true, uniqueness: { case_sensitive: false }
                   # format:     { with: VALID_USERID_REGEX },
                    
        #validates :lastname, :presence => true, :length => { :minimum => 3 } 
end
