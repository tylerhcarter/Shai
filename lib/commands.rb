class Commands

  @@commands = Thesaurus.new
  def self.setup
    @@commands.add_word "finish", "skip", "done", "turn", "complete", "s"
    @@commands.add_word "building_info", "binfo", "b"
    @@commands.add_word "info", "stats", "me"
    @@commands.add_word "house"
  end

  def self.translate word
    translation = @@commands.get_base_word word
    return word if translation == false
    return translation
  end

end
