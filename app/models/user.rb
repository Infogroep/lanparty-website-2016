require 'structured_message'

class User < ActiveRecord::Base
  include Authist::Authism

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :user_groups

  def has_access? type
    super type or user_group.has_access? type
  end

  def all_badges
    badges = []

    user_groups.each do |user_group|
      badge_url = user_group.badge_url(:badge)
      badges.push(image_url: badge_url, title: user_group.description) if badge_url
    end

    teams.each do |team|
      compo = team.compo
      has_won = compo.has_won?(team)
      badge_url = has_won && compo.winning_badge_url(:badge) || compo.participation_badge_url(:badge)
      badge_title = has_won && "#{compo.game.name} compo winner" || "#{compo.game.name} compo participant"
      badges.push(image_url: badge_url, title: badge_title) if badge_url
    end

    badges
  end

  def structured_message
    StructuredMessage.dump(id)
  end

  def self.find_by_structure_message(msg)
    find(StructuredMessage.load(msg))
  end

  def sound_or_default_name
    if pending_order_sound && self.class.all_sounds.map{|sound| sound[:name]}.include?(pending_order_sound)
      pending_order_sound
    else
      "Bloom"
    end
  end

  def self.build_sound_info(sound_name)
    { name: sound_name,
      files: [{ ext: "mp3", type: "audio/mpeg" },
              { ext: "wav", type: "audio/wav"}].map do |type_info|
                { file: sound_name + "." + type_info[:ext],
                  type: type_info[:type] }
              end }
  end

  def sound_or_default
    self.class.build_sound_info sound_or_default_name
  end

  def self.all_sounds
    %w(Bloom Concern Connected Full Gentle\ Roll High\ Boom Hollow Hope Jump\ Down Jump\ Up Looking\ Down Looking\ Up
       Nudge Picked Puff Realization Second\ Glance Stumble Suspended Turn Unsure Metal\ Gear\ Solid\ -\ Alert).map { |sound| build_sound_info(sound) }
  end
end
