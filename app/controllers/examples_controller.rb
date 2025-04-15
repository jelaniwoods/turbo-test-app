class ExamplesController < ApplicationController
  def one
  end

  def two
    if request.method == "POST"
      # redirect to get path which has turbo frame
      redirect_to examples_two_path
    else
      render :two
    end
  end

  def three
    if params.key?(:required) && params[:required].blank?
      @unprocessable_entity = true
      render :one, status: :unprocessable_entity 
    elsif params.key?(:required_500) && params[:required_500].blank?
      @internal_server_error = true
      render :one, status: :internal_server_error 
    elsif params.key?(:ok)
      @ok = true
      p params
      p request.method
      render :one, status: :ok 
    end
  end

  def four
  end

  def five
  end
end
