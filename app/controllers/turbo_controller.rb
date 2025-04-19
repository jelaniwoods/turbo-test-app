class TurboController < ApplicationController
  skip_before_action :verify_authenticity_token

  def redirecting_after_a_form_submission
    if params.key?(:required) && params[:required].blank?
      @unprocessable_entity = true
      render :redirecting_after_a_form_submission, status: :unprocessable_entity
    elsif params.key?(:required_500) && params[:required_500].blank?
      @internal_server_error = true
      render :redirecting_after_a_form_submission, status: :internal_server_error
    elsif params.key?(:frame_request) && turbo_frame_request?
      @frame_request = true
      render :redirecting_after_a_form_submission, status: :internal_server_error
    elsif params.key?(:ok)
      @ok = true
      render :redirecting_after_a_form_submission, status: :ok
    end
  end
end
