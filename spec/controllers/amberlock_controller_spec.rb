require 'spec_helper'

describe AmberlockController do

  describe "GET 'enable_user'" do
    it "returns http success" do
      get 'enable_user'
      response.should be_success
    end
  end

end
