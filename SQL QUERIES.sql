-- The number of unique requests (ContactId) grouped by Month (Creation Date)
SELECT to_char(creation_date, 'Month') as month, Count(*) as Number_Of_contact 
FROM fact_contacts 
GROUP BY month

-- The number of unique requests (QuoteId) grouped by Month (Creation Date)
SELECT to_char(quote_created_at, 'Month') as month, Count(*) as Number_Of_Quotes 
FROM fact_quotes 
GROUP BY month

-- The number of elevators (ElevatorId) contained in the buildings belonging to each customer
SELECT COUNT(id) as "Elevator Count", building_id as "Building ID"
FROM fact_elevators
GROUP BY building_id
ORDER BY COUNT(id) DESC;
