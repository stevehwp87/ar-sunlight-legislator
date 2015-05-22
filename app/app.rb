require_relative 'models/congressman.rb'
require_relative 'models/state.rb'



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


        puts "#{x[0]}: Senators: #{sen_par.count}, Representative(s): #{rep_par.count}"
      end

      # array

  end