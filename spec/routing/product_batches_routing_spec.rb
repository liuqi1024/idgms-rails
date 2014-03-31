require "spec_helper"

describe ProductBatchesController do
  describe "routing" do

    it "routes to #index" do
      get("/product_batches").should route_to("product_batches#index")
    end

    it "routes to #new" do
      get("/product_batches/new").should route_to("product_batches#new")
    end

    it "routes to #show" do
      get("/product_batches/1").should route_to("product_batches#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_batches/1/edit").should route_to("product_batches#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_batches").should route_to("product_batches#create")
    end

    it "routes to #update" do
      put("/product_batches/1").should route_to("product_batches#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_batches/1").should route_to("product_batches#destroy", :id => "1")
    end

  end
end
