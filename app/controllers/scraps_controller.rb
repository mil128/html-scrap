class ScrapsController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  require 'rack'
  
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
    html_doc = Nokogiri::HTML(open(params[:url_text]))
    env = Rack::MockRequest.env_for(params[:url_text])
    req = Rack::Request.new(env)


    fail=0
    count=0
    total=0
    #skipped=0

    html_doc.xpath("//html/body/table/tr").each do |node|

      arr = Array.new

      node.css("td").each do |row|
        arr << row.inner_text.strip
      end

      if(arr[0]=="Order ID")
        next
        #        temp_scr = Scrap.find_by_order_id_and_order_date(arr[0],DateTime.parse(arr[1]))
        #        if temp_scr != null
      end


      scr = Scrap.new
      scr.order_id = arr[0]
      scr.order_date = DateTime.parse(arr[1])
      scr.order_amt = arr[2].to_f
      scr.order_status = arr[3]
      scr.payment_mode = arr[4]
      scr.mil_tx_id = arr[5]
      scr.order_desc = arr[6]
      scr.borrower_id = arr[7].to_i
      scr.borrower_name = arr[8]
      scr.cust_name = arr[9]
      scr.cust_email = arr[10]
      scr.cust_phone = arr[11]
      scr.cust_addr = arr[12]
      scr.from_date = DateTime.parse(req["fromdate"])
      scr.to_date = DateTime.parse(req["todate"])

      if scr.save
        count = count+1
      else
        fail = fail+1
      end
        
    end
    redirect_to scraps_url,:notice => "Records Saved:: #{count}, Records failed:: #{fail}"
      
  end



    

end
