require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to :release_bike }
    it { is_expected.to respond_to(:dock).with(1).argument }
    it { is_expected.to respond_to(:bikes) }

    describe '#release_bike' do
        it 'releases a bike' do
            bike = Bike.new
            subject.dock(bike)
            expect(subject.release_bike).to eq bike
        end

        it 'raises an error when there are no bikes available' do
            expect { subject.release_bike }.to raise_error('No bikes available')
          end
        end

    it 'docks something' do
        bike = Bike.new
        # We want to return the bike we dock
        expect(subject.dock(bike)).to eq [bike]
      end

      it 'returns docked bikes' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.bikes).to eq [bike]
    end

      it 'releases working bikes' do
        subject.dock(Bike.new)
        bike = subject.release_bike
        expect(bike).to be_working
      end


    #   it 'raises an error when full' do
    #      subject.dock(Bike.new)
    #      expect { subject.dock(Bike.new) }.to raise_error "This station already contains a bike"
    #   end
    end
