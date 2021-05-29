require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to :release_bike }
    it { is_expected.to respond_to(:dock).with(1).argument }
    it { is_expected.to respond_to(:bikes) }

    describe '#initialize' do
    it 'creates an instance of object with a specified capacity' do
      docking_station = DockingStation.new(40)
      40.times { docking_station.dock(Bike.new) }
      expect(docking_station.bikes.length).to eq (40)
    end

    it 'defaults to 20 if no argument is given' do
    expect(subject.capacity).to eq(20)
    end
end

    describe '#release_bike' do
        it 'releases a bike' do
            bike = Bike.new
            subject.dock(bike)
            expect(subject.release_bike).to eq bike
        end

        it 'raises an error when there are no bikes available' do
            expect { subject.release_bike }.to raise_error('No bikes available')
          end

          it 'dosent release broken bike to users' do
            bike = Bike.new
            bike.report_broken
            subject.dock(bike)
            expect { subject.release_bike }.to raise_error('Bike is broken')
          end
        end

    describe '#dock' do
        it 'docks something' do
          bike = Bike.new
        # We want to return the bike we dock
          expect(subject.dock(bike)).to eq [bike]
      end

      it 'raises error when full' do
        DockingStation::DEFAULT_CAPACITY.times do
          subject.dock Bike.new
        end
        expect { subject.dock Bike.new }.to raise_error "Docking station full"
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
