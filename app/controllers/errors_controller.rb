class ErrorsController < ActionController::Base
  def not_found
    render "errors/not_found",
           status: :not_found,
           layout: "application"
  end

  def internal_server_error
    render "errors/internal_server_error",
           status: :internal_server_error,
           layout: "application"
  end
end