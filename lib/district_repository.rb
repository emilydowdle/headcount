require_relative 'district'
require 'pry'

class DistrictRepository
  def self.from_csv(path)
    # opens one csv in folder
    filename = "Students qualifying for free or reduced price lunch.csv"
    fullpath = File.join(path, filename)
    @repository = {}
    # pushes it into parser
    rows = CSV.read(fullpath, headers: true, header_converters: :symbol).each do |row|
      # only push unique names into our hash and have them point to its instance of District
      if !@repository.include?(row[:location])
        @repository[row[:location]] = District.new(row[:location])
      end
    end
    # returns hash containing just district names as strings
    # binding.pry
    @repository
  end

  def self.find_by_name(name)
    # searches returned hash above for district name; receives string; - returns instance of district
    if @repository.keys.include? name
      return @repository[name]
    else
      nil
    end
  end

end

path = File.expand_path("../data", __dir__)
puts repository = DistrictRepository.from_csv(path)
