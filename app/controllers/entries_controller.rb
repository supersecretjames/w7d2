class EntriesController < ApplicationController
  respond_to :json

  def index
    @entries = Entry.all

    render :json => @entries
  end

  def create
    @entry = Entry.new(params[:entry])

    if @entry.save
      render :json => @entry
    else
      render :json => @entry.errors, :status => 422
    end
  end

  def show
    @entry = Entry.find(params[:id])

    render :json => @entry
  end

end
