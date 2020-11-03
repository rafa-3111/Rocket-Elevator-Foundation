class FactContact < Second::Base

  def self.get_facts
  return Second::Base.connection.execute("SELECT to_char(creation_date, 'Month') as month, Count(*) as Number_Of_contact 
  FROM fact_contacts 
  GROUP BY month").to_a
  end
  
end
