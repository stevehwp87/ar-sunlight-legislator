require_relative '../db/config'

class CongressMan < ActiveRecord::Migration

  def change
    create_table :congressman do |c|
      c.string :title
      c.string :first_name
      c.string :middle_name
      c.string :last_name
      c.string :name_suffix
      c.string :nickname
      c.string :party
      c.string :state
      c.string :district
      c.string :in_office
      c.string :gender
      c.string :phone
      c.string :fax
      c.string :website
      c.string :webform
      c.string :congress_office
      c.string :bioguide_id
      c.string :votesmart_id
      c.string :fec_id
      c.string :govtrack_id
      c.string :crp_id
      c.string :twitter_id
      c.string :congresspedia_url
      c.string :youtube_url
      c.string :facebook_id
      c.string :official_rss
      c.string :senate_class
      c.string :birthdate


  end

end



