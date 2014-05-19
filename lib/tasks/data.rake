require 'active_record'

@config = YAML::load(File.open(File.join(Rails.root.to_s, 'config', 'database.yml')))[Rails.env.to_s.downcase]


namespace :data do

  desc "initial data"
  task :load => :environment do |task, args|

      (0..42).each do |i|
        puts "Created: #{Temperature.create(value: 23.34)}"
        sleep 1
      end

  end

end