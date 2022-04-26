require_relative "room"

class Hotel
  attr_reader :rooms

  def initialize(name, room_hash)
    @name = name
    @rooms = {}
    room_hash.each do |k, v|
      @rooms[k] = Room.new(v)
    end
  end

  def name
    split = @name.split
    new_name = []
    split.each do |word|
      new_name << word.capitalize
    end

    new_name.join(" ")
  end

  def room_exists?(room_name)
    return true if rooms.has_key?(room_name)
    false
  end

  def check_in(person, room_name)
    if room_exists?(room_name)
      if @rooms[room_name].add_occupant(person)
        p "check in successful"
      else
        p "sorry, room is full"
      end
    else
      p "sorry, room does not exist"
    end
  end

  def has_vacancy?
    vacancy = false
    @rooms.each do |k, v|
      if v.available_space != 0
        vacancy = true
      end
    end
    vacancy
  end

  def list_rooms
    @rooms.each do |k, v|
      puts "#{k} #{v.available_space}"
    end
  end

end
