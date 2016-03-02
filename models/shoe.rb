require("pg")

class Shoe

  attr_reader :first_name,  :last_name, :address, :style, :size, :quantity

  def initialize(params)

    @first_name=params["first_name"]
    @last_name=params["last_name"]
    @address=params["address"]
    @style=params["style"]
    @size=params["size"]
    @quantity=params["quantity"].to_i
    puts "QUANTITY: #{@quantity}"
  end

  def name_format
    return "#{first_name} #{last_name}"
  end

  def total()
    return @quantity * 100
  end

  def save()
    db = PG.connect({dbname: "shoo_shop", host: 'localhost'})
    sql = "INSERT INTO shoes (
      first_name,
      last_name,
      size,
      style,
      quantity) VALUES (
      '#{@first_name}',
      '#{@last_name}',
      '#{@size}',
      '#{@style}',
      '#{@quantity}'
      )"

    db.exec(sql)
    db.close
  end
    
  def self.all
    db = PG.connect({dbname: "shoo_shop", host: "localhost"})
    sql = "SELECT * FROM shoes"
    shoes = db.exec(sql)
    result = shoes.map{|shoe| Shoe.new(shoe)}
    db.close
    return result
  end
end
