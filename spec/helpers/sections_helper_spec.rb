require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the SectionsHelper. For example:
#
# describe SectionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe SectionsHelper do
  context "Time Taken" do
    context "timerange" do
      it "equals 125 when time is 2:05:00 AM" do
        expect(timerange("2:05:00 AM")).to eq(125)
      end

      it "equals 720 when time is 12:00:00 PM" do
        expect(timerange("12:00:00 PM")).to eq(7200)
      end

      it "equals 0 when time is 12:00:00 AM" do
        expect(timerange("12:00:00 AM")).to eq(0)
      end
    end

    context "conflict time" do

    end
  end
end
