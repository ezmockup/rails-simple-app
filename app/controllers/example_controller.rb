require "excon"

class ExampleController < ApplicationController
  def test
    @remote_ip = request.remote_ip
  end

  def updateOrderBillease
    p params
  end
end
