class Reunion
  attr_reader :name
  attr_accessor :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def event_total_cost(event)
    selected = @activities.find { |activity| activity == event }  
    selected.total_cost
  end

  def balance
    combined = {}
    list = @activities.map do|activity|
      activity.owed
    end
    list.each do |activity_owed|
      combined = combined.merge(activity_owed) {|key, val1, val2| val1 + val2}
    end
    combined
  end

  def invoice
    output = []
    balance.each do |name, balance|
      if balance.positive?
        output << "#{name} owes #{balance}\n"
      else
        output << "#{name} is owed #{balance.abs}\n"
      end
    end
    output.join
  end
end