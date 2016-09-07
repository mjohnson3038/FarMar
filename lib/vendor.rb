module FarMar
  class Vendor
    attr_accessor :id, :name, :num_employees, :market_id

    def initialize(id, name, num_employees, market_id)
      @id = id
      @name = name
      @num_employees = num_employees
      @market_id = market_id
    end

    def self.all
      vndrs = []
      CSV.read('/Users/madeleinejohnson/Ada/project-forks/FarMar/support/vendors.csv','r'). each do |line|
        vndrs << FarMar::Vendor.new(line[0], line[1], line[2], line[3])
      end
      return vndrs
    end

    def self.find(id)
      FarMar::Vendor.all.each do |line|
        if id == line.id.to_i
          return line
        end
      end
    end

    def market
      the_one = nil
      FarMar::Market.all.each do |line|
        if @market_id == line.id
          the_one = line
          break
        end
      end
      return the_one
    end

    def products

    end





    # prdts = []
    # FarMar::Product.all.each do |line|
    #   if "10" = line.vendor_id
    #     prdts.push(line.name)
    #   end
    # end



  end
end
