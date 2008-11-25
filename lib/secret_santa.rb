class SecretSanta
  CharacterMap = {
    "3" => ["3"],
    "4" => ["4"],
    "6" => ["6"],
    "7" => ["7"],
    "8" => ["8"],
    "9" => ["9"],
    "A" => ["A","a"],
    "B" => ["B","b"],
    "C" => ["C","c"],
    "D" => ["D","d"],
    "E" => ["E","e"],
    "F" => ["F","f"],
    "G" => ["G","g"],
    "H" => ["H","h"],
    "J" => ["J","j"],
    "K" => ["K","k"],
    "L" => ["L","l","1","I","i"],
    "M" => ["M","m"],
    "N" => ["N","n"],
    "O" => ["O","o","0"],
    "P" => ["P","p"],
    "Q" => ["Q","q"],
    "R" => ["R","r"],
    "S" => ["S","s","5"],
    "T" => ["T","t"],
    "U" => ["U","u"],
    "V" => ["V","v"],
    "W" => ["W","w"],
    "X" => ["X","x"],
    "Y" => ["Y","y"],
    "Z" => ["Z","z","2"]
  }
  
  StoreableCharacterMap = CharacterMap.keys
  InputtableCharacterMap = CharacterMap.values.flatten
  
  def self.create_code(size=8)
    (0...size).map { StoreableCharacterMap[Kernel.rand(StoreableCharacterMap.size)] }.join
  end
  
  def self.normalize(str)
    str = strip(str)
    CharacterMap.each do |tight, loose|
      str = str.gsub(/[#{loose.join}]/, tight)
    end
    str
  end
  
  def self.strip(str)
    str.gsub(/[^#{InputtableCharacterMap.join}]/, "")
  end
end

module SecretSantaActiveRecord
  def set_gift_code_for(field,size=8)
    code = SecretSanta.create_code(size)
    generate_code_for(field,size) and return if self.class.find(:first, :conditions => ["? = ?", field, code])
    self.send("#{field}=", code)
  end
end