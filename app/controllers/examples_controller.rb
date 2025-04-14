class ExamplesController < ApplicationController
  def one
  end

  def two
  end

  def three
    if params.key?(:required) && params[:required].blank?
      @unprocessable_entity = true
      render :one, status: :unprocessable_entity 
    elsif params.key?(:required_500) && params[:required_500].blank?
      @internal_server_error = true
      puts "hi"
      render :one, status: :internal_server_error 
    elsif params.key?(:ok)
      @ok = true
      render :one, status: :ok 
    end
  end

  def four
  end

  def five
  end
end
