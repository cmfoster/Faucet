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
    templates = []
    emails = Email.group('function')
    emails.each do |mail|
      a = mail.function.split('.')
      templates << [a[0].split(/([[:upper:]][[:lower:]]*)/).delete_if(&:empty?).join('_') + '/' + a[1].  split(/([[:upper:]][[:lower:]]*)/).delete_if(&:empty?).join('_'), [a[0].size + a[1].size + rand(1024)]]
    end
    return templates
  end
end
