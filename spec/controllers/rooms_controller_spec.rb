require 'spec_helper'

describe RoomsController do
	describe "POST create" do
    it "redirects to new if input is invalid" do
      post :create, room: {building: "", room_num: "", room_capacity: -3, desk_type: "", board_type: "", chair_type: ""}
      expect(response).to redirect_to(new_room_path)
    end

    it "redirects to index" do
      post :create, room: {building: "PKI", room_num: 123, room_capacity: 3, desk_type: "", board_type: "", chair_type: ""}
      expect(response).to redirect_to(rooms_path)
    end
	end

  describe "GET index" do
    it "assigns @rooms" do
      room = Room.create(building: 'PKI', room_num: 323)
      get :index
      expect(assigns[:rooms]).to eq([room])
    end
  end
end
