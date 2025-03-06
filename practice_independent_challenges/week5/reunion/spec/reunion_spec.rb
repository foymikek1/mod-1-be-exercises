require '../lib/activity'
require '../lib/reunion'

describe 'Activity' do
  describe '#initialize' do
    it 'is an Activity' do
      activity = Activity.new("Brunch")
      expect(activity).to be_a Activity
    end

    it 'has a name' do
      activity = Activity.new("Brunch")
      expect(activity.name).to eq "Brunch"
    end

    it 'has participants' do
      activity = Activity.new("Brunch")
      expect(activity.participants).to eq Hash.new
    end

    it 'can add participants' do
      activity = Activity.new("Brunch")
      expected = {"Maria" => 20}
      expect(activity.add_participant("Maria", 20)).to eq expected
    end

    it 'has a total cost' do
      activity = Activity.new("Brunch")

      activity.add_participant("Maria", 20)
      expect(activity.total_cost).to eq 20
      activity.add_participant("Luther", 40)
      expect(activity.total_cost).to eq 60
    end

    it 'can split total cost' do
      activity = Activity.new("Brunch")

      activity.add_participant("Maria", 20)
      activity.add_participant("Luther", 40)
      expect(activity.split).to eq 30
    end

    it 'can split total cost' do
      activity = Activity.new("Brunch")

      activity.add_participant("Maria", 20)
      activity.add_participant("Luther", 40)
      expected = {"Maria" => 10, "Luther" => -10}
      expect(activity.owed).to eq expected
    end
  end
end

describe 'Reunion' do
  describe '#initialize' do
    it 'is a Reunion' do
      reunion = Reunion.new("1406 BE")
      expect(reunion).to be_a Reunion
    end

    it 'has a name' do
      reunion = Reunion.new("1406 BE")
      expect(reunion.name).to eq "1406 BE"
    end

    it 'has activities' do
      reunion = Reunion.new("1406 BE")
      expect(reunion.activities).to eq []
    end

    it 'can add activities' do
      reunion = Reunion.new("1406 BE")
      activity_1 = Activity.new("Brunch")
      reunion.add_activity(activity_1)
      expect(reunion.activities).to eq [activity_1]
    end

    it 'can return total cost of an event' do
      reunion = Reunion.new("1406 BE")
      activity_1 = Activity.new("Brunch")
      activity_2 = Activity.new("BBQ")
      activity_1.add_participant("Maria", 20)
      activity_1.add_participant("Mark", 30)
      activity_2.add_participant("Jarred", 40)
      activity_2.add_participant("Joseline", 10)
      activity_2.add_participant("Mark", 20)
      reunion.add_activity(activity_1)
      reunion.add_activity(activity_2)

      expect(reunion.event_total_cost(activity_1)).to eq 50
      expect(reunion.event_total_cost(activity_2)).to eq 70
    end

    it 'can list participants reunion balance' do
      reunion = Reunion.new("1406 BE")
      activity_1 = Activity.new("Brunch")
      activity_2 = Activity.new("BBQ")
      activity_1.add_participant("Maria", 20)
      activity_1.add_participant("Mark", 30)
      activity_2.add_participant("Jarred", 40)
      activity_2.add_participant("Joseline", 10)
      activity_2.add_participant("Mark", 20)
      reunion.add_activity(activity_1)
      reunion.add_activity(activity_2)

      expected = {"Jarred"=>-17, "Joseline"=>13, "Maria"=>5, "Mark"=>-2}
      expect(reunion.balance).to eq expected
    end

    it "can print a summary of each participant's name and what they owe" do
      reunion = Reunion.new("1406 BE")
      activity_1 = Activity.new("Brunch")
      activity_2 = Activity.new("BBQ")
      activity_1.add_participant("Maria", 20)
      activity_1.add_participant("Mark", 30)
      activity_2.add_participant("Jarred", 40)
      activity_2.add_participant("Joseline", 10)
      activity_2.add_participant("Mark", 20)
      reunion.add_activity(activity_1)
      reunion.add_activity(activity_2)

      expected = "Maria owes 5\nMark is owed 2\nJarred is owed 17\nJoseline owes 13\n"
      expect(reunion.invoice).to eq expected
    end
  end
end