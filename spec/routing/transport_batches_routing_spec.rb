require "spec_helper"

describe TransportBatchesController do
  describe "routing" do

    it "routes to #index" do
      get("/transport_batches").should route_to("transport_batches#index")
    end

    it "routes to #new" do
      get("/transport_batches/new").should route_to("transport_batches#new")
    end

    it "routes to #show" do
      get("/transport_batches/1").should route_to("transport_batches#show", :id => "1")
    end

    it "routes to #edit" do
      get("/transport_batches/1/edit").should route_to("transport_batches#edit", :id => "1")
    end

    it "routes to #create" do
      post("/transport_batches").should route_to("transport_batches#create")
    end

    it "routes to #update" do
      put("/transport_batches/1").should route_to("transport_batches#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/transport_batches/1").should route_to("transport_batches#destroy", :id => "1")
    end

  end
end
