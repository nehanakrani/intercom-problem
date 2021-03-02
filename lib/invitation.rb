
require 'json'
require 'pry'
require_relative 'distance_calculator'

class Invitation
  include DistanceCalculator
  attr_reader :office_latitude, :office_longitude, :distance, :unit

  def initialize(file_path, office_latitude, office_longitude, distance, unit)
    @file_path = file_path
    @office_latitude = office_latitude
    @office_longitude = office_longitude
    @distance = distance
    @unit = unit
    @office_coordinates = [office_latitude, office_longitude]
  end

  def call
    find_customer_list
  end

  private

  def find_customer_list
    customers_list = {}
    customers = text_file_parse(@file_path)
    customers.each do |customer|
      cus_distance = DistanceCalculator.calculate_distance(get_customer_coordinates(customer), @office_coordinates)
      customers_list[customer['user_id']] = customer['name'] if cus_distance <= distance
    end
    puts 'No customers are within the given maximum distance.' if customers_list.empty?
    customers_list.sort.each{|id, name|  puts "User Id: #{id}, name: #{name}\n"}
  end

  def get_customer_coordinates(customer)
    [customer['latitude'], customer['longitude']]
  end

  def text_file_parse(file_path)
    rows = []
    file = File.open(file_path, 'r')
    file.each_line.map do |row|
      customer = JSON.parse(row)
      customer['latitude'] = customer['latitude'].to_f
      customer['longitude'] = customer['longitude'].to_f
      rows << customer
    end
    file.close
    rows
  end
end


