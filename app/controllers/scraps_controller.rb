class ScrapsController < ApplicationController
  def index
    @scraps = Scrap.all
    #    if @scraps == []
    #      flash.now[:notice]= "No Data to display"
    #    end
  end

  def show
    @scrap = Scrap.find(params[:id])
  end

  def new
    @scrap = Scrap.new
  end

  def create
    @scrap = Scrap.new(params[:scrap])
    if scrap.save
      redirect_to @scrap,:notice => "Scrap Creation Successfull"
    else
      render :action => "new"
    end
  end

  def edit
    @scrap = Scrap.find(params[:id])
  end

  def update
    @scrap = Scrap.find(params[:id])
    if @scrap.update_attribute(params[:scrap])
      redirect_to @scrap,:notice=>"Scrap updated Successfully"
    else
      render :action => "edit"
    end
  end

  def destroy
  end

  def upload
  end
  def process_url
    
    redirect_to scraps_path
  end
end
