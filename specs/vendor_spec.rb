require_relative 'spec_helper'
require 'csv'

describe FarMar::Vendor do

  describe "#initialize" do

    before(:all) do
      @vendor = FarMar::Vendor.new("7","Bechtelar Inc","4","2")
    end

    it "can initialize a new instance of Vendor" do
      @vendor.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "self.all" do
    it "returns a collection of instances, representing CSV" do
      FarMar::Vendor.all.length.must_equal(2690)
    end
  end

  describe "self.find(id)" do
    it "should return an instance where the id matches the CSV field" do
      FarMar::Vendor.all
      FarMar::Vendor.find(464).name.must_equal("Gutkowski Group")
    end
  end

  describe "#market" do
    it "should return the FarMar::Market instance associated with vendor" do
      ven = FarMar::Vendor.new("10","Kertzmann LLC","11","3")
      ven.market.name.must_equal("Dolgeville Farmer's Market")
    end
  end

  describe "#products" do
    it "should return a collection of FarMar::Product instances associated by vendor_id" do
      ven = FarMar::Vendor.new("10","Kertzmann LLC","11","3")
      vnames = []
      ven.products.each do |item|
        vnames.push(item.name)
      end
      vnames.must_equal(["Calm Carrots", "Fierce Beef", "Helpless Bread", "Yummy Bread", "Broken Beets"])
    end
  end

  describe "#sales" do
    it "should return a collection of FarMar::Sale instances associated by vendor_id" do
      ven = FarMar::Vendor.new("10","Kertzmann LLC","11","3")
      vsales = []
      ven.sales.each do |item|
        vsales.push(item.id)
      end
      vsales.must_equal(["53", "54", "55", "56", "57", "58", "59", "60"])
    end
  end

  describe "#revenue" do
    it "should return the num of all the vendor sales (in cents)" do
      ven = FarMar::Vendor.new("10","Kertzmann LLC","11","3")
      ven.revenue.must_equal(32628)
    end
  end

  describe "#self.by_market(market_id)" do
    it "should return all vendors with given market_id" do
      FarMar::Vendor.by_market(104).length.must_equal(3)
    end
  end

  #OPTIONAL REQUIREMENTS: PART 1

  # describe "self.most_revenue(n)" do
  #   it "should return the top n vendor instances by total number of items sold" do
  #     FarMar::Vendor.most_revenue(n).length.must_equal(6)
  #   end
  # end

end
