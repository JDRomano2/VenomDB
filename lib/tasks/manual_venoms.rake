task :manual_venoms do
  require 'csv'

  csv_text = File.read('manual_venoms.txt')
  csv = CSV.parse(csv_text, :headers => true, :col_sep => "\t")
  csv.each do |row|
    ManualVenoms.create!(row.to_hash)
  end
end
