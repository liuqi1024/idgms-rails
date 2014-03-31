require "spec_helper"

describe GameGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/game_groups").should route_to("game_groups#index")
    end

    it "routes to #new" do
      get("/game_groups/new").should route_to("game_groups#new")
    end

    it "routes to #show" do
      get("/game_groups/1").should route_to("game_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/game_groups/1/edit").should route_to("game_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/game_groups").should route_to("game_groups#create")
    end

    it "routes to #update" do
      put("/game_groups/1").should route_to("game_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/game_groups/1").should route_to("game_groups#destroy", :id => "1")
    end

  end
end
