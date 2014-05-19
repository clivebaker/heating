require 'active_record'

@config = YAML::load(File.open(File.join(Rails.root.to_s, 'config', 'database.yml')))[Rails.env.to_s.downcase]


namespace :temperature do

  desc "get latest data point"
  task :test => :environment do |task, args|

      while true do 
        puts "Created: #{Temperature.create(value: rand(210..250)/10.to_f)}"
        sleep Setting.where("key=?","check_frequency").first.value.to_i
      end

  end


  desc "get latest data point"
  task :sensor => :environment do |task, args|

  	filename = "/home/pi/sensor/w1_slave"

  	while true do 
  		f = File.read(filename)
  		temp =  f[f.index("t=")+2,7].to_f/1000
  		t = Temperature.create(value: temp)
      puts "Created: #{t.inspect}"
      sleep Setting.where("key=?","check_frequency").first.value.to_i
    end



  end






end