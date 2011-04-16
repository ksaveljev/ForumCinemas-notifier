require 'nokogiri'
require 'open-uri'

class ForumCinemas
  def initialize(forumcinemas_id)
    @forumcinemas_id = forumcinemas_id
  end

  def valid?
    document.nil?
  end

  def reload
    @document = nil
    document
  end

  private

  def document
    @document ||= Nokogori::HTML(open("http://www.forumcinemas.ee/Event/#{@forumcinemas_id}")) rescue nil
  end
end
