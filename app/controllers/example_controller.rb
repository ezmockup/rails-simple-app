require "excon"

class ExampleController < ApplicationController
  skip_before_action :verify_authenticity_token

  def test
    @remote_ip = request.remote_ip
  end

  def updateOrderBillease
    p params
    p params[:trx_id]
    p "xxxxxxxxxxxxxxxxxxxxxxxxx"
  end
end
