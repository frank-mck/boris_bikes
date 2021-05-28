require 'bike'

describe Bike do
    it "check if a bike is working" do
        expect(subject).to respond_to :working?
    end
end