require "spec_helper"

describe PatchesController do
  describe "routing" do

    it "routes to #index" do
      get("/patches").should route_to("patches#index")
    end

    it "routes to #new" do
      get("/patches/new").should route_to("patches#new")
    end

    it "routes to #show" do
      get("/patches/1").should route_to("patches#show", :id => "1")
    end

    it "routes to #edit" do
      get("/patches/1/edit").should route_to("patches#edit", :id => "1")
    end

    it "routes to #create" do
      post("/patches").should route_to("patches#create")
    end

    it "routes to #update" do
      put("/patches/1").should route_to("patches#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/patches/1").should route_to("patches#destroy", :id => "1")
    end

  end
end
