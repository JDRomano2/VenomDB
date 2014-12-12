class ConvertUnderscoresToSpaces < ActiveRecord::Migration
  def change
    ManualVenom.find_each do |ven|
      ven.venom.gsub!(/_/, ' ')
      ven.effect.gsub!(/_/, ' ')
    end
  end
end
