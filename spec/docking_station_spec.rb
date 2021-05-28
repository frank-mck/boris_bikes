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

    describe '#dock' do
        it 'docks something' do
          bike = Bike.new
        # We want to return the bike we dock
          expect(subject.dock(bike)).to eq [bike]
      end

      it 'raises an error when full' do
        docking_station = DockingStation.new
        20.times { docking_station.dock Bike.new }
         expect { docking_station.dock(Bike.new) }.to raise_error "Docking station full"
      end
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
    end
