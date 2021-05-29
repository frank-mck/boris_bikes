require 'docking_station'

describe DockingStation do
    let(:bike) { double(:bike) }
    #it { is_expected.to respond_to(:bikes) }

    describe '#initialize' do
    it 'creates an instance of object with a specified capacity' do
      docking_station = DockingStation.new(40)
      40.times { docking_station.dock(bike) }
      expect(docking_station.bikes.length).to eq (40)
    end

    it 'defaults to 20 if no argument is given' do
    expect(subject.capacity).to eq(20)
    end
end

    describe '#release_bike' do
        it 'releases working bikes' do
            bike = double(:bike, broken?: false)
            subject.dock(bike)
            expect(subject.release_bike).to eq bike
        end

        it 'raises an error when there are no bikes available' do
            allow(bike).to receive(:release_bike)
            expect { subject.release_bike }.to raise_error('No bikes available')
          end

          it 'dosent release broken bike to users' do
            allow(bike).to receive(:report_broken)
            subject.dock double :bike, broken?: true, working?: false
            bike.report_broken
            expect { subject.release_bike }.to raise_error("Bike is broken")
          end
        end

    describe '#dock' do
        it 'docks something' do
          expect(subject.dock(bike)).to eq [bike]
      end

      it 'raises error when full' do
        subject.capacity.times { subject.dock(bike) }
        expect { subject.dock(bike) }.to raise_error "Docking station full"
      end
    end

      it 'returns docked bikes' do
        subject.dock(bike)
        expect(subject.bikes).to eq [bike]
    end

      it 'releases working bikes' do
        subject.dock double :bike, broken?: false, working?: true
        released_bike = subject.release_bike
        expect(released_bike).to be_working
      end
    end
