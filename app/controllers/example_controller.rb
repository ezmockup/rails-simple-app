require "excon"

class ExampleController < ApplicationController
  def test
    @remote_ip = request.remote_ip
  end

  def updateOrderBillease
    p params
    p params[:trx_id]
    p "xxxxxxxxxxxxxxxxxxxxxxxxx"
  end
end
