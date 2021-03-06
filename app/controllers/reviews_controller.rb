class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_camp
  before_action :set_review, only: [:edit, :update, :destroy]

  respond_to :html

  

  def new
    @review = Review.new
    respond_with(@review)
    @review.user_id = current_user.id
  end

  def edit
  end

  def create 
@review = Review.new(review_params) 
@review.user_id = current_user.id 
@review.camp_id = @camp.id

flash[:notice] = "Review was successfully created." if @review.save 
respond_with(@review, :location => root_path) 
end

  def update
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_camp
      @camp = Camp.find(params[:camp_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
