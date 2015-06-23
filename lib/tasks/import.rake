require 'csv'

desc "Imports database entries from CSV file"
task :import => [:environment] do

  file1 = "db/data/jdr_autoparse_venoms.csv"
  file2 = "db/data/smdb_search_venoms.csv"

  csv_text_1 = File.read(file1)
  csv_1 = CSV.parse(csv_text_1, :headers => true)
  csv_1.each do |row|
    JdrAutoparseVenom.create!(row.to_hash)
  end

  csv_text_2 = File.read(file2)
  csv_2 = CSV.parse(csv_text_2, :headers => true)
  csv_2.each do |row|
    SmdbSearchVenom.create!(row.to_hash)
  end

end
