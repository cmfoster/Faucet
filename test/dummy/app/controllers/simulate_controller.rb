class SimulateController < ApplicationController
  def schedule
    Faucet::Email.create!(:time  => Time.now, :function => "UserMailer.one_week", :description => "One week reminder email", :email => "curtismfoster@gmail.com")
  end
end
