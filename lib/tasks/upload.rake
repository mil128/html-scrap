desc "Data Upload"
task :upload => :environment do
  require 'open-uri'
  require 'nokogiri'
  require 'rack'

  fail=0
  count=0
  total=0

  url=""
  scrp = Scrap.find(:all)
  if(scrp==[])

    puts "Database empty. Enter URL"
    url = STDIN.gets
    html_doc = Nokogiri::HTML(open(url))
    env = Rack::MockRequest.env_for(url)
    req = Rack::Request.new(env)

    

    html_doc.xpath("//html/body/table/tr").each do |node|
      arr = []

      node.css("td").each do |row|
        arr << row.inner_text.strip
      end

      # ignore header
      next if(arr[0]=="Order ID")

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
    puts "Records Saved:: #{count}  Records Failed::#{fail}"

  else

    from_date = Scrap.maximum("to_date")+1
    to_date = Date.new((from_date >> 1).year,(from_date >>1).month,1)-1
    if Date.today <= to_date
      puts "Rake not possible"
    else
      url = "http://billbharo.com/milaap/checkorders.php?fromdate=#{from_date}&todate=#{to_date}&Submit=Search+Orders#"

      puts url

      rake_doc = Nokogiri::HTML(open(url))
      rake_doc.xpath("//html/body/table/tr").each do |node|
        arr_rake = []
        
        node.css("td").each do |row|
          arr_rake << row.inner_text.strip
        end

        if(arr_rake[0]=="Order ID")
          next
        end

        scr = Scrap.new
        scr.order_id = arr_rake[0]
        scr.order_date = DateTime.parse(arr_rake[1])
        scr.order_amt = arr_rake[2].to_f
        scr.order_status = arr_rake[3]
        scr.payment_mode = arr_rake[4]
        scr.mil_tx_id = arr_rake[5]
        scr.order_desc = arr_rake[6]
        scr.borrower_id = arr_rake[7].to_i
        scr.borrower_name = arr_rake[8]
        scr.cust_name = arr_rake[9]
        scr.cust_email = arr_rake[10]
        scr.cust_phone = arr_rake[11]
        scr.cust_addr = arr_rake[12]
        scr.from_date = from_date
        scr.to_date = to_date
        
        if scr.save
          count = count+1
        else
          fail = fail+1
        end

      end
      puts "Records Saved:: #{count}  Records Failed::#{fail}"
      
    end
  end


  
end
