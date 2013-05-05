class HomeController < ApplicationController

	def gotoHome

		#render :text => "Welcome to dynamic content"
		@userdetail = Userdetail.new
		render :action => :login
		
	end

	def doLogin

		@userdetail =Userdetail.new(params[:userdetail])
		if @userdetail_db = Userdetail.first(:conditions => ["userid = :userid",{ :userid => @userdetail.userid}] )
        # Then compare the provided password against the hashed one in the db.
        	if BCrypt::Password.new(@userdetail_db.password_digest).is_password? @userdetail.password
         	 # If they match we return the user 
          		 redirect_to users_path(@user), :flash => { :loginmsg => "Hi #{@userdetail_db.firstname}, welcome to ruby on rails " }
        	
      end
  	  else
          		redirect_to signin_path(@user), :flash => { :message => "Invalid Credentails ,pls try again" }
      end

      	 
		# @userdetail =Userdetail.new(params[:userdetail])
		# @userdetail_db = Userdetail.find(:all, :conditions => ["userid = :userid",{ :userid => @userdetail.userid}] )

		# if @userdetail_db[0]
		# 	    if @userdetail_db[0].userid == @userdetail.userid and @userdetail_db[0].password == @userdetail.password
		# 				#render :text => "#{@userdetail_db[0].userid}"
		# 				redirect_to users_path(@user), :flash => { :loginid => "#{@userdetail_db[0].userid}" }
		# 		else
		# 			    # render :text => "Invalid credentials ..."
		# 			   # flash[:message] = "OOps Something went wrong"
		# 			   # redirect_to :action => 'gotoHome'
		# 			   redirect_to signin_path(@user), :flash => { :message => "Invalid Credentails , pls try again" }
		# 		end


		# else
		# 	 redirect_to signin_path(@user), :flash => { :message => "Invalid Credentails ,pls try again" }
		# end

	end


	def index
			@userdetail = Userdetail.new
	end

	def gotoSignup
		@userdetail = Userdetail.new
        render :action => :register
	end

	def doRegister
		#include ActiveRecord::Validations
  		#validates :userid, :length => { :minimum => 2 }	
  		@userdetail =Userdetail.new(params[:userdetail])
  		 if @userdetail.save
  		 	       # render :text => "user has been created successfully...."
  		 	       redirect_to registerstatus_path(@user), :flash => { :message => "User has been created successfully" }
  		 	else
  		 			#render :text => "user cretation failed"
  		 		   redirect_to registerstatus_path(@user), :flash => { :message => "User cretation failed !" }
  		 end
  	end
  	
  	def showRegisterstatus

		render :action => :registerstatuspage

	end

	def doSignout
		render :action => :signoutpage
	end

end
