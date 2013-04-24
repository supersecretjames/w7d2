class FeedsController < ApplicationController
  respond_to :html, :only => [:index]
  respond_to :json

  def index
    @feeds = Feed.all

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @feeds }
    end
  end

  def show
    @feed = Feed.find(params[:id])

    render :json => @feed
  end

  def create
    @feed = Feed.make_feed(params[:feed][:source])
    if @feed.save
      @feed.add_entries
      render :json => @feed
    else
      render :json => @feed.errors, :status => 422
    end
  end
end
