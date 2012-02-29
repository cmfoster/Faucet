module Faucet
  class Email < ActiveRecord::Base
    validates_presence_of :email, :function, :time, :description
  end
  
  def self.today
      (Time.now.midnight)..Time.now.end_of_day
  end
  
  def self.yesterday
    (1.day.ago.midnight)..1.day.ago.end_of_day
  end
  
  def self.templates 
    dir_paths = []
    dirfiles = []
    files = []
    dir_list = Dir["app/views/*"]
    dir_list.each {|directory| directory.match("mailer") ? dir_paths << directory : 0}

    dir_paths.each do |path|
      p_path = path.match("^(.*/)([^/]*)$").to_a
      Dir.entries(path).each {|file| file.match("html.erb\$") ?  files << [p_path[p_path.size-1] + '/' + file, [file.size + rand(100)]] : 0}
    end
    return files
    

  end
end
