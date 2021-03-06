require 'spec_helper'

describe "LayoutLinks" do

	it "should have a home page at '/'" do
		get '/'
		response.should have_content("Home")
	end


it "should have a home page at '/'" do
		get '/contact'
		response.should have_content("Contact")
	end

it "should have a home page at '/'" do
		get '/about'
		response.should have_content("About")
	end


  describe "GET /layout_links" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get layout_links_index_path
      response.status.should be(200)
    end
  end
end
