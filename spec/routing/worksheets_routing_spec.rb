require "spec_helper"

describe WorksheetsController do
  describe "routing" do

    it "routes to #index" do
      get("/worksheets").should route_to("worksheets#index")
    end

    it "routes to #new" do
      get("/worksheets/new").should route_to("worksheets#new")
    end

    it "routes to #show" do
      get("/worksheets/1").should route_to("worksheets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/worksheets/1/edit").should route_to("worksheets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/worksheets").should route_to("worksheets#create")
    end

    it "routes to #update" do
      put("/worksheets/1").should route_to("worksheets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/worksheets/1").should route_to("worksheets#destroy", :id => "1")
    end

  end
end
