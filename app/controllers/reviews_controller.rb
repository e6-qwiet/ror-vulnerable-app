class ReviewsController < ApplicationController
  before_action :authenticate_user_with_flash!, only: [:new, :create]
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @reviews = Review.order(created_at: :desc)
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to reviews_path, notice: "Review created successfully."
    else
      render :new, alert: "Failed to create review."
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy
    redirect_to reviews_path, notice: "Review deleted successfully."
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

  def authenticate_user_with_flash!
    unless user_signed_in?
      flash[:alert] = "You must log in to leave a review."
      redirect_to new_user_session_path
    end
  end

end
