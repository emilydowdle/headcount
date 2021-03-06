require 'csv'
require 'pry'

class Parse

  def initialize(district_name, filename, data_hash={})
    @district_name = district_name
    @filename = filename
    @data_hash = data_hash
  end

  def parse_runner
    rows = create_row_table
    hash = return_hash_from_row_table(rows)
  end

  def create_row_table
    fullpath = File.join(path, @filename)
    CSV.read(fullpath, headers: true, header_converters: :symbol)
  end

  def path
    DistrictRepository.path
  end

  def return_hash_from_row_table(rows)
    final_rows = rows.map {|array| array.to_h}
    final_rows.select{|row| row.fetch(:location).upcase == @district_name.upcase}
  end

end
