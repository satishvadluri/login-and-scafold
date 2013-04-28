class HomeController < ApplicationController

	def gotoHome

		#render :text => "Welcome to dynamic content"
		@userdetail = Userdetail.new
		render :action => :login
		
	end

	def doLogin
		@userdetail =Userdetail.new(params[:userdetail])
		@userdetail_db = Userdetail.find(:all, :conditions => ["userid = :userid",{ :userid => @userdetail.userid}] )

		if @userdetail_db[0]
			    if @userdetail_db[0].userid == @userdetail.userid and @userdetail_db[0].password == @userdetail.password
						#render :text => "#{@userdetail_db[0].userid}"
						redirect_to users_path(@user), :flash => { :loginid => "#{@userdetail_db[0].userid}" }
				else
					    # render :text => "Invalid credentials ..."
					   # flash[:message] = "OOps Something went wrong"
					   # redirect_to :action => 'gotoHome'
					   redirect_to signin_path(@user), :flash => { :message => "Invalid Credentails , pls try again" }
				end


		else
			 redirect_to signin_path(@user), :flash => { :message => "Invalid Credentails ,pls try again" }
		end

	end


	def index
			@userdetail = Userdetail.new
	end
end
