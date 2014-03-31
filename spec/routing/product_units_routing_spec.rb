require "spec_helper"

describe ProductUnitsController do
  describe "routing" do

    it "routes to #index" do
      get("/product_units").should route_to("product_units#index")
    end

    it "routes to #new" do
      get("/product_units/new").should route_to("product_units#new")
    end

    it "routes to #show" do
      get("/product_units/1").should route_to("product_units#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_units/1/edit").should route_to("product_units#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_units").should route_to("product_units#create")
    end

    it "routes to #update" do
      put("/product_units/1").should route_to("product_units#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_units/1").should route_to("product_units#destroy", :id => "1")
    end

  end
end
