require 'open-uri'
require 'mechanize'
require 'nokogiri'
class Destination < ApplicationRecord
  has_many :trips
  has_many :users, through: :trips
  accepts_nested_attributes_for :trips

  #get a single destination value for external lookup
  def getDestinationValue
    if self.city
      return self.city
    elsif self.state
      return self.state
    elsif self.country
      return self.country
    else
      return null
    end
  end

  ##get a combined destination lookup value (e.g., city+state)

  def getCombinedDestinationValue
    if self.city
      lookup_city = self.city.split(" ").join("+")
      return "#{lookup_city} #{(self.country)}"
    elsif self.state
      lookup_state = self.state.split(" ").join("+")
      return "#{lookup_state} #{self.country}"
    elsif self.country
      return self.country
    end
  end

  #helper to format name for scrape
  def formatName(inputName)
    outputName = inputName.split(" ").join("_")
    outputName
  end

  #scrape annual temp averages from https://www.holiday-weather.com/
  def fetchAnnualTemps
    destination = self.getDestinationValue
    lookup_destination = formatName(destination)
    if lookup_destination
      mechanize = Mechanize.new
      page = mechanize.get("https://www.holiday-weather.com/#{lookup_destination}/averages/")
      table = page.at('div.averages_table-wrap')
      temp_data = {}
      i = 0

      while i < 3
        table.search('tr').each do |tr|
        temp_data[i] = tr.text.strip
        i+=1
        end
      end

      final_data = temp_data.map{|key,value|value.gsub(/\n/,",")}
      final_data[2]
    else
      return null
    end
  end

  # scrape top hotels from Hotels.com
  def fetchHotelData
    destination = self.getDestinationValue
    mechanize = Mechanize.new
    page = mechanize.get("https://www.hotels.com/")
    form = page.form

    form['q-destination'] = destination
    form['q-localised-check-in'] = '09-15-2019'
    form['q-localised-check-out'] = '09-22-2019'
    form['q-room-0-adults'] = 1

    page2 = form.submit

    newurl = page2.uri.to_s + "&f-star-rating=5,4&f-guest-rating-min=7&sort-order=STAR_RATING_HIGHEST_FIRST"

    page3 = mechanize.get(newurl)

    hotel_list = page3.at('.listings')

    hotel_name_arr = {}

    hotel_list.search('li').each do |hotel|
      if hotel.at('a.property-name-link')
        hotel_details =  hotel.at('a.property-name-link').inner_text
        hotel_link = 'www.hotels.com' + hotel.at('a.property-name-link').attr('href')
        hotel_name_arr[hotel_details] = [hotel_link]
      end
      if hotel.at('aside')
        if hotel.at('div.price')
          hotel_price =  hotel.at('a.price-link').inner_text
          hotel_name_arr[hotel_details].push(hotel_price)
        end
      end
    end
    hotel_name_arr
  end

  #takes in argument and returns  top search links from google (page 1)
  def fetchTopGoogleSearchResults(userId)
    user_activities = User.find(userId).preferred_activities

    if user_activities.length < 1
      lookup_activities = ['Restaurants','Tourist Sites', 'Bars', 'Golf Courses', 'Hikes']
    else
      lookup_activities = user_activities
    end

    destination = self.getDestinationValue
    topLinks = {}

    mechanize = Mechanize.new
    page = mechanize.get("https://www.google.com/")
    form = page.form

    lookup_activities.each do |activity|
      topLinks[activity] = []
      page = mechanize.get("https://www.google.com/")
      form = page.form
      form['q'] = "best #{activity} in #{destination}"
      page2 = form.submit

      i = 0

      page2.links.each do |url|
        if i < 5
          begin
            if (url.href.include?('/url') && !url.href.include?('webcache') && !url.href.include?("accounts.google.com"))
              cleanURL = url.href.split('&sa')[0][7..-1]
              testPageClick = mechanize.get(cleanURL)
              testPageTitle = testPageClick.title
              obj = {}
              obj[testPageTitle] = cleanURL
              topLinks[activity].push(obj)
              i+=1
            end
          rescue Mechanize::ResponseCodeError => e
            test = e.response_code
          end
        end
      end
    end
    topLinks
  end

end
