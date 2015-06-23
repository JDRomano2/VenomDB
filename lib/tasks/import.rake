require 'csv'

namespace :db do
  
  desc "Imports database entries from CSV file"
  task :import => [:environment] do

    puts "\nWARNING!!! This is a destructive operation!\n"
    puts "All records in 'jdr_autoparse_venoms' and 'smdb_search_venoms' will be deleted, "
    puts "and replaced with the contents of the CSV files in the 'db/data' directory\n."

    puts "Are you absolutely sure you want to proceed? [Y/n]"

    answer = STDIN.gets.chomp
    puts answer

    if answer.downcase == "y"

      ## Remove existing records
      JdrAutoparseVenom.delete_all
      SmdbSearchVenom.delete_all
      
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
    else
      puts "Aborting rake task"
      return false
    end

  end

end
