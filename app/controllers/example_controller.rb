class ExampleController < ApplicationController
  def test
    @remote_ip = request.remote_ip
  end
end
