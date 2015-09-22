require 'csv'
# Pseudocode
  # Notes:
    # Actually rethinking the giant hash. I think Torie's version of having each "instance" of a district create it's own hashes might be better.

  class DistrictRepository
    def self.from_csv(path)
      # opens one csv in folder
      filename = "Students qualifying for free or reduced price lunch.csv"
      fullpath = File.join(path, filename)
      district_repo = {}
      # pushes it into parser
      rows = CSV.read(fullpath, headers: true, header_converters: :symbol).each do |row|
        # only push unique names into our hash and have them point to its instance of District
        if !district_repo.include?(row[:location])
          district_repo[row[:location]] = District.new(row[:location])
        end
      end
      # returns hash containing just district names
      district_repo
    end

    def find_by_name
      # searches returned hash above for district name - returns instance of district
    end

  end


  class District
    # calls instances of "enrollment" and "statewide_testing" with argument of district name
    def initialize(name)
      puts nil
    end
  end


  class EconomicProfile
    def initialize(district_name)
      # takes disctrict name
      # opens all csvs related to statewide testing (we will manually list these?)***
      # returns hash containing all statewide testing data for individual school
    end

    def free_or_reduced_lunch_in_year
      # looks in our created hash for key "proficient by grade"
      # does calculations
    end

  # etc...

end

path       = File.expand_path("../data", __dir__)
repository = DistrictRepository.from_csv(path)
puts repository.inspect
