require 'bike'

describe Bike do
    it "check if a bike is working" do
        expect(subject).to respond_to :working?
    end

    it 'report bike when broken' do
        subject.report_broken
        expect(subject).to be_broken
    end
end