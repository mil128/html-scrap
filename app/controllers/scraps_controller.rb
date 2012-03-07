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
      if params[:start_date]=="" || params[:end_date]==""
        flash.now[:error]="Input Error"
      else
        begin
          @start_date = Date.parse(params[:start_date])
          @end_date = Date.parse(params[:end_date])
          @scraps=Scrap.where(:order_date => @start_date..@end_date)
        rescue StandardError => ex
          flash.now[:error]="Invalid Dates"
        end
      end
    end
  end
  
end
