class ApplicationController < ActionController::Base
  include SessionsHelper
  include CartsHelper
  include Pundit

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
  def session_required
    redirect_to sign_in_users_path, notice: '請先登入會員' unless user_signed_in?
  end

  def record_not_found
    render file: 'public/404.html',
           layout: false,
           status: :not_found
  end
end
