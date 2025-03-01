require '../lib/dock'
require '../lib/renter'
require '../lib/boat'

describe 'Boat' do
  describe '#initialize' do
    it 'is a Boat' do
      kayak_1 = Boat.new(:kayak, 20)

      expect(kayak_1).to be_a Boat
    end

    it 'has a type' do
      kayak = Boat.new(:kayak, 20) 
      
      expect(kayak.type).to eq :kayak
    end

    it 'has a price per hour' do
      kayak = Boat.new(:kayak, 20) 
      
      expect(kayak.price_per_hour).to eq 20
    end

    it 'can return hours rented' do
      kayak = Boat.new(:kayak, 20) 
      
      expect(kayak.hours_rented).to eq 0
    end

    it 'can add rent hours' do
      kayak = Boat.new(:kayak, 20) 

      3.times { kayak.add_hour }
      expect(kayak.hours_rented).to eq 3
    end
  end
end

describe 'Renter' do
  describe '#initialize' do
    it 'is a Renter' do
      renter = Renter.new("Patrick Star", "4242424242424242") 

      expect(renter).to be_a Renter
    end

    it 'has a name' do
      renter = Renter.new("Patrick Star", "4242424242424242") 
      
      expect(renter.name).to eq "Patrick Star"
    end

    it 'has a credit card number' do
      renter = Renter.new("Patrick Star", "4242424242424242")  
      
      expect(renter.credit_card_number).to eq "4242424242424242"
    end
  end
end

describe 'Dock' do
  describe '#initialize' do
    it 'is a Dock' do
      dock = Dock.new("The Rowing Dock", 3)

      expect(dock).to be_a Dock
    end

    it 'has a name' do
      dock = Dock.new("The Rowing Dock", 3)
      
      expect(dock.name).to eq "The Rowing Dock"
    end

    it 'has a max rental time' do
      dock = Dock.new("The Rowing Dock", 3)
      
      expect(dock.max_rental_time).to eq 3
    end

    it 'can log rented boats' do
      dock = Dock.new("The Rowing Dock", 3) 
      kayak_1 = Boat.new(:kayak, 20)
      kayak_2 = Boat.new(:kayak, 20)
      sup_1 = Boat.new(:standup_paddle_board, 15)
      patrick = Renter.new("Patrick Star", "4242424242424242") 
      eugene = Renter.new("Eugene Crabs", "1313131313131313")

      dock.rent(kayak_1, patrick)
      dock.rent(kayak_2, patrick)
      dock.rent(sup_1, eugene) 

      log = {kayak_1 => patrick,
             kayak_2 => patrick,
             sup_1 => eugene}

      expect(dock.rental_log).to eq log
    end

    it 'can charge renters' do
      dock = Dock.new("The Rowing Dock", 3) 
      kayak_1 = Boat.new(:kayak, 20)
      kayak_2 = Boat.new(:kayak, 20)
      sup_1 = Boat.new(:standup_paddle_board, 15)
      patrick = Renter.new("Patrick Star", "4242424242424242") 
      eugene = Renter.new("Eugene Crabs", "1313131313131313")

      3.times { kayak_1.add_hour }
      4.times { kayak_2.add_hour }
      2.times { sup_1.add_hour }

      dock.rent(kayak_1, patrick)
      dock.rent(kayak_2, patrick)
      dock.rent(sup_1, eugene) 

      charge_1 = {
        "amount" => 60,
        "card_number" => "4242424242424242"
      }
      expect(dock.charge(kayak_1)).to eq charge_1

      charge_2 = {
        "amount" => 60,
        "card_number" => "4242424242424242"
      }
      expect(dock.charge(kayak_2)).to eq charge_2

      charge_3 = {
        "amount" => 30,
        "card_number" => "1313131313131313"
      }
      expect(dock.charge(sup_1)).to eq charge_3
    end

    it 'can return a boat' do
      dock = Dock.new("The Rowing Dock", 3) 
      kayak_1 = Boat.new(:kayak, 20)
      patrick = Renter.new("Patrick Star", "4242424242424242") 

      3.times { kayak_1.add_hour }

      dock.rent(kayak_1, patrick)
      dock.return(kayak_1)

      expect(kayak_1.hours_rented).to eq 0
    end

    it 'can log an hour to rented boats' do
      dock = Dock.new("The Rowing Dock", 3) 
      kayak_1 = Boat.new(:kayak, 20)
      kayak_2 = Boat.new(:kayak, 20)
      sup_1 = Boat.new(:standup_paddle_board, 15)
      sup_2 = Boat.new(:standup_paddle_board, 15)
      patrick = Renter.new("Patrick Star", "4242424242424242") 
      eugene = Renter.new("Eugene Crabs", "1313131313131313")

      3.times { kayak_1.add_hour }
      4.times { kayak_2.add_hour }
      2.times { sup_1.add_hour }

      dock.rent(kayak_1, patrick)
      dock.rent(kayak_2, patrick)
      dock.rent(sup_1, eugene) 

      dock.log_hour
      expect(kayak_1.hours_rented).to eq 4
      expect(kayak_2.hours_rented).to eq 5
      expect(sup_1.hours_rented).to eq 3
      expect(sup_2.hours_rented).to eq 0
    end

    it 'can generate total revenue' do
      dock = Dock.new("The Rowing Dock", 3) 
      kayak_1 = Boat.new(:kayak, 20)
      kayak_2 = Boat.new(:kayak, 20)
      sup_1 = Boat.new(:standup_paddle_board, 15)
      patrick = Renter.new("Patrick Star", "4242424242424242") 
      eugene = Renter.new("Eugene Crabs", "1313131313131313")
      john = Renter.new("John Beach", "1234567890123345")

      3.times { kayak_1.add_hour }
      4.times { kayak_2.add_hour }
      2.times { sup_1.add_hour }

      dock.rent(kayak_1, patrick)
      dock.rent(kayak_2, patrick)
      dock.rent(sup_1, eugene) 

      dock.return(kayak_2)
      2.times { kayak_2.add_hour}
      dock.rent(kayak_2, john)

      expect(dock.revenue).to eq 190
    end
  end
end