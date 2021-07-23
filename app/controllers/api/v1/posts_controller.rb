module Api
  module V1
    class PostsController < Api::V1::BaseController
      acts_as_token_authentication_handler_for User, except: %i[index show]
      before_action :set_post, only: %i[show update destroy]
      #  has_scope :by_title, only: :index
      #  has_scope :by_category, only: :index

      def index
        @posts = policy_scope(Post)
        @posts = Post.where(nil)
        @posts = @posts.filter_by_title(params[:title]) if params[:title].present?
         @posts = @posts.filter_by_category(params[:category]) if params[:category].present?
      end

      def show
      end

      def update
        if @post.update(post_params)
          render :show
        else
          render_error
        end
      end

      def create
        @post = Post.new(post_params)
        @post.user = current_user
        authorize @post
        if @post.save
          render :show, status: :created
        else
          render_error
        end
      end

      def destroy
        @post.destroy
        authorize @post
        head :no_content
      end

      private

      def set_post
        @post = Post.find(params[:id])
        authorize @post  # For Pundit
      end


      def post_params
        params.require(:post).permit(:title, :content, :image, :creation_date, :category)
      end

      def render_error
        render json: { errors: @post.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  end
end
