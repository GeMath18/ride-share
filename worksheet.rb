########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.

# # driver_id
# # ride_done
# #date
# # cost
# # rider_id
# # rating

# Which layers are nested in each other?
# 1. driver_id= { driver_id: ride_done_by_date}
# #2. ride_done_by_date= [{ date, cost, rider_id, rating}]
# Which layers of data "have" within it a different layer?
# 3.rider= [ { date, cost, rider_id, rating}]

# Which layers are "next" to each other?
# {driverid : ride_done_by_date}, [{ date, cost, rider_id, rating}]
########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have
#1. Hash - driver_id= { driver_id: ride_done_by_date}
# 2. Array - ride_done_by_date= [{ date, cost, rider_id, rating}]
# 3. Hash - { date: date, cost: $, rider_id: R#####, rating: #}
########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

driver_id = {
    DR0001: [
        {
            date: "3rd Feb 2016",
            cost: 10,
            rider_id: "RD0003",
            rating: 3

        },
        {
            date: "3rd Feb 2016",
            cost: 30,
            rider_id: "RD0015",
            rating: 4

        },
        {
            date: "5th Feb 2016",
            cost: 45,
            rider_id: "RD0003",
            rating: 2

        }
    ],

    DR0002:[
        {
            date: "3rd Feb 2016",
            cost: 25,
            rider_id: "RD0073",
            rating: 5

        },
        {
            date:  "4th Feb 2016",
            cost:  15,
            rider_id: "RD0013",
            rating: 1

        },
        {
            date: "5th Feb 2016",
            cost:  35,
            rider_id: "RD0066",
            rating: 3

        }
    ],

    DR0003: [
        {
            date: "4th Feb 2016",
            cost: 5,
            rider_id: "RD0066",
            rating: 5,
        },
        {
            date:  "5th Feb 2016",
            cost: 50,
            rider_id: "RD0003",
            rating: 2,
        }

    ],

    DR0004: [
        {
            date: "3rd Feb 2016",
            cost: 5,
            rider_id: "RD0022",
            rating: 5,
        },
        {
            date: "4th Feb 2016",
            cost: 10,
            rider_id: "RD0022",
            rating: 4,
        },
        {
            date: "5th Feb 2016",
            cost: 20,
            rider_id: "RD0073",
            rating: 5,
        }
    ]
}



########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:

# - the number of rides each driver has given
#
 number_of_rides = driver_id.map do |key, value|
  "Driver with ID: #{key} made #{value.length} rides. "
  end

puts number_of_rides
puts " "
#
# # - the total amount of money each driver has made
#
 driver_id.map do |key,value|
   sum = driver_id[key].sum do |i|
     i[:cost]
   end
   puts "Driver with ID: #{key} earned a total of $ #{sum}."

 end
puts " "
# - the average rating for each driver
  driver_id.map do |key, value|
  sum = driver_id[key].sum do |i|
    i[:rating]
  end
  count = driver_id[key].count do |i|
    i[:rating]
  end

  average = sum/count.to_f
  puts "Driver with ID: #{key} has an average rating of #{average.to_f}."

end
puts " "
# - Which driver made the most money?
earnings = driver_id.map do |key, trips|
  sum = trips.sum do |trip|
    trip[:cost]
  end
  { total_money: sum, driver_id: key}
end
most_money = earnings.max_by do |money|
  money[:total_money]
end
#puts earnings
#puts most_money

puts "Driver with ID : #{most_money[:driver_id]} made the most money with a total of $ #{most_money[:total_money]}."


# - Which driver has the highest average rating? end

highest_average = driver_id.map do |key, value|
  sum = driver_id[key].sum do |i|
    i[:rating]
  end
  count = driver_id[key].count do |i|
    i[:rating]
  end
  average = sum/count.to_f
  { high_rating: average, driver_id: key}
end
highest_rating = highest_average.max_by do |rate|
  rate[:high_rating]
end
#puts highest_average
#puts highest_rating
puts " "
puts "Driver with ID : #{highest_rating[:driver_id]} has the highest average rating of #{highest_rating[:high_rating]}."
