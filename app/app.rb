require_relative 'models/congressman.rb'
require_relative 'models/state.rb'
require 'twitter'
require 'nokogiri'



  def rep_state(state)
    rep = Congressman.where(title: "Rep", state: state)
    rep.order(:lastname)

    rep.each do |rep|
      puts "#{rep.title} #{rep.name} #{rep.state} (#{rep.party})"
    end
    # rep do |r|
      # puts "Representative of house of state name is #{r.name}"
    # end
  end

  def sen_state(state)
    sen = Congressman.where(title: "Sen", state: state)
    sen.order(:lastname)

   sen.each do |sen|
      puts "#{sen.title} #{sen.name} #{sen.state} (#{sen.party})"
    end



  end

  def sen_party(party)
    sen_par = Congressman.where(title: "Sen", party: party)

  sen_par.each do |sen_par|
      puts "#{sen_par.title} #{sen_par.name} #{sen_par.party} "
    end
  end


  def rep_party(party)
    rep_par = Congressman.where(title: "Rep", party: party)

    rep_par.each do |rep_par|
      puts "#{rep_par.title} #{rep_par.name} #{rep_par.party}"
    end
  end


  def in_office(firstname, lastname)
    inoffice = Congressman.where(firstname: firstname, lastname: lastname)

    inoffice.each do |inoffice|
      puts "#{inoffice.title} #{inoffice.name}, in office: #{inoffice.in_office}"
    end
  end

  def gender_percent(title, gender)
    fraction = Congressman.where(title: title, gender: gender, in_office: "1")
    total = Congressman.where(title: title, in_office: "1")

    percentage = fraction.count * 100 / total.count

    puts "#{gender} #{title}: #{percentage}%"

  end

  def active_rep_sen
      rep_par = Congressman.where(title: "Rep", in_office: "1")
      sen_par = Congressman.where(title: "Sen", in_office: "1")



      puts "Senators: #{sen_par.count} "
      puts "Representative(s): #{rep_par.count} "
     # rep_par.each do |rep_par|
     #  puts "#{rep_par.title} #{rep_par.name} #{rep_par.party}"
  end

  def total_rep_sen

      rep_par = Congressman.where(title: "Rep")

      sen_par = Congressman.where(title: "Sen")
      puts "Senators: #{sen_par.count} "
      puts "Representative(s): #{rep_par.count} "
  end

  def list_rep

      # list = Congressman.group("state").group('title').count
      list = Congressman.group("state").count

      array = []

      list.each do |x|
        rep_par = Congressman.where(state: x, title: "Rep", in_office: "1")
        sen_par = Congressman.where(state: x, title: "Sen", in_office: "1")

        # array  << [x[0], rep_par.count, sen_par.count]
          # NEED TO SORT BY THE MOST CONGRESSMAN!!!

          array  << [x[0], rep_par.count, sen_par.count]


        # puts "#{x[0]}: Senators: #{sen_par.count}, Representative(s): #{rep_par.count}"
      end

      # array.each do |y|

      k = array.sort_by{|a| [a[1],a[2]]}
      p = k.reverse
      p.each do |o|

        puts "#{o[0]}:  Representative(s): #{o[2]}, Senators: #{o[1]}"

      end
  end

  @client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "7jT3P3YScr5vv9aMUDdsq8uM2"
  config.consumer_secret     = 'H2TKJUzhLyni774wA9rOuhJPLIvUq5aA4ZjHxh6Z4dfjUDmTIb'
  config.access_token        = "3050321708-r1zdlnPVDzQttQqvu2BrWNKjmHTY7Wph1EWz51G"
  config.access_token_secret = '6ucwAKh0IGb2qI7RyqxEPl0mUCGOLQFGoLlyy1fQero6k'
end

def fetch_user

  @client.user_timeline("NajibRazak")

end

def get_tweet(twitter_id)

    @client.user_timeline(twitter_id).take(10).collect do |tweet|
        # tweet = Nokogiri.HTML(tweet.text).text
        tweet = tweet.text

        puts tweet
    end
end





# puts "Please enter a congress member id: "
# cm_id = gets.chomp
# member = CongressMember.find(cm_id.to_i)
# raise "Error: Unable to find user." if member.nil?
# raise "Error: This user has no twitter id." if member.twitter_id.nil?
# client.user_timeline(member.twitter_id).take(10).collect do |tweet|
#     begin
#         insert = member.tweets.create!(
#             :tweet_id => tweet.id,
#             :tweet_text => Nokogiri.HTML(tweet.text).text
#         )
#         puts "#{member.firstname}: #{insert.tweet_text}"
#     rescue
#         puts "Tweet id: #{tweet.id} already exists."
#     end