module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
    end


    def self.all
      sls = []
      CSV.read('/Users/madeleinejohnson/Ada/project-forks/FarMar/support/sales.csv','r'). each do |line|
        sls << FarMar::Sale.new(line[0], line[1], line[2], line[3], line[4])
      end
      return sls
    end

    def self.find(id)
      FarMar::Sale.all.each do |line|
        if id == line.id.to_i
          return line
        end
      end
    end

    def vendor
      winner = nil
      FarMar::Vendor.all.each do |line|
        if @vendor_id == line.id
          winner = line
          break
        end
      end
      return winner
    end

    def product
      category = nil
      FarMar::Product.all.each do |line|
        if @product_id == line.id
          category = line
          break
        end
      end
      return category
    end

    def self.between(beginning_time, end_time)
      array_o_sales = []
      FarMar::Sale.all.each do |line|
        beg = DateTime.strptime(beginning_time, '%Y-%m-%d %H:%M:%S %z')
        ends = DateTime.strptime(end_time, '%Y-%m-%d %H:%M:%S %z')
        a = DateTime.strptime(line.purchase_time, '%Y-%m-%d %H:%M:%S %z')
        if beg <= a && ends >= a
          array_o_sales.push(line)
        end
      end
      return array_o_sales
    end

  end
end

# 2013-11-11 02:43:04 -0800,10,23
