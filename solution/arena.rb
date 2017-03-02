class Arena
  def initialize(name, *gladiators)
    @name = name.capitalize
    @gladiators = check_gladiator_number(gladiators)
  end

  def check_gladiator_number(gladiators)
    if gladiators.count > 2 
      puts "Can only have two gladiators in the arena at a time. The other #{gladiators.count - 2} can wait their turn."
    end

    gladiators.take(2) 
  end

  def add_gladiator(gladiator)
    return "Arena already full" if @gladiators.count == 2
    @gladiators.push(gladiator)
  end

  def fight
    return if @gladiators.count == 1

    g_one = @gladiators[0]
    g_two = @gladiators[1]

    if g_one.weapon == g_two.weapon
      puts "both die, the arena has been cleared"
      @gladiators = []
    elsif g_one.weapon == "trident" && g_two.weapon == "spear" || g_one.weapon == "spear" && g_two.weapon == "club" || g_one.weapon == "club" && g_two.weapon == "trident"
      puts "#{g_one.name} wins"
      @gladiators = [g_one]
    else
      puts "#{g_two.name} wins"
      @gladiators = [g_two]
    end
  end

  # BONUSES

  def remove_by_name(name)
    # SELECT METHOD

    @gladiators = @gladiators.select { |gladiator| gladiator.name != name }

    # EACH METHOD

    # @gladiators.each do |el|
    #   @gladiators.delete(el) if el.name == name
    # end
  end
 
  def fight_with_maximus
    return if @gladiators.count == 1

    g_one = @gladiators[0]
    g_two = @gladiators[1]

    if g_one.name == "Maximus" 
      puts "#{g_two.name} dies, #{g_one} wins."
      @gladiators = [g_one]
    elsif g_two.name == "Maximus"
      puts "#{g_one.name} dies, #{g_two} wins."
      @gladiators = [g_two]
    elsif g_one.weapon == g_two.weapon
      puts "both die, the arena has been cleared."
      @gladiators = []
    elsif g_one.weapon == "trident" && g_two.weapon == "spear" || g_one.weapon == "spear" && g_two.weapon == "club" || g_one.weapon == "club" && g_two.weapon == "trident"
      puts "#{g_one.name} wins"
      @gladiators = [g_one]
    else
      puts "#{g_two.name} wins"
      @gladiators = [g_two]
    end
  end

  def entertained?
    @gladiators.each do |el|
      puts "They are entertained" if el.name == "Maximus"
    end
  end

end
