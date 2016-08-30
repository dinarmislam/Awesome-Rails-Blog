class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		if params[:category].blank?
			@posts=Post.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
		else
			@category_id = Category.find_by(name: params[:category]).id
			@posts = Post.where(category_id: @category_id).order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
		end
	end

	
	def new
		@post=Post.new
	end

	def create
		@post= Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end

		 

	end

	def show
		@post= Post.find(params[:id])


		
	end

	def edit
		@post = Post.find(params[:id])
		

	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body, :image, :category_id))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :body, :image, :categories)
		end 
end
