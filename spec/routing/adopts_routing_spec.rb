require "rails_helper"

RSpec.describe AdoptsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/adopts").to route_to("adopts#index")
    end

    it "routes to #new" do
      expect(get: "/adopts/new").to route_to("adopts#new")
    end

    it "routes to #show" do
      expect(get: "/adopts/1").to route_to("adopts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/adopts/1/edit").to route_to("adopts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/adopts").to route_to("adopts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/adopts/1").to route_to("adopts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/adopts/1").to route_to("adopts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/adopts/1").to route_to("adopts#destroy", id: "1")
    end
  end
end
