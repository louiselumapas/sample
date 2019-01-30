class MicropostsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	#checks that the current user actually has a micropost with the given id
	before_action :correct_user,   only: :destroy

	def create
		#build returns a new micropost object associated with user
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Post created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end 
	end

	def destroy
		@micropost.destroy
		flash[:success] = "Micropost deleted!"
		#request.referrer here redirects back to the page where you deleted the post
		redirect_to request.referrer || root_url 

	end

	private

	  def micropost_params
	   params.require(:micropost).permit(:content,:picture)
	  end

	  def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
      end
end