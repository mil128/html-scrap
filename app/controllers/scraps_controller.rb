class ScrapsController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  require 'rack'
  
  def index
    @scraps = Scrap.all
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

  def find
    
    @start_date=nil
    @end_date=nil
    @scraps=nil
    if params[:method]=="post"
      #      if params[:start_date]=="" || params[:end_date]==""
      #        flash.now[:error]="Input Error"
      #      else
      @date_pick = DatePick.new
      @date_pick.start_date = params[:start_date]
      @date_pick.end_date = params[:end_date]
      unless @date_pick.valid?
        flash.now[:error] = @date_pick.errors.full_messages.first
      else
        @start_date = Date.strptime(params[:start_date],"%Y/%m/%d")
        @end_date = Date.strptime(params[:end_date],"%Y/%m/%d")
        @scraps=Scrap.where(:order_date => @start_date..@end_date)
      end
    end
  end
  
end
