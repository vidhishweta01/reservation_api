require "rails_helper"

RSpec.describe WorkSchedulesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/work_schedules").to route_to("work_schedules#index")
    end

    it "routes to #show" do
      expect(get: "/work_schedules/1").to route_to("work_schedules#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/work_schedules").to route_to("work_schedules#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/work_schedules/1").to route_to("work_schedules#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/work_schedules/1").to route_to("work_schedules#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/work_schedules/1").to route_to("work_schedules#destroy", id: "1")
    end
  end
end
