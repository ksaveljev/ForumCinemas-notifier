require 'nokogiri'
require 'open-uri'

class ForumCinemas
  def initialize(forumcinemas_id)
    @forumcinemas_id = forumcinemas_id
  end

  def valid?
    not document.nil?
  end

  def reload
    @document = nil
    document
  end

  def poster
    document.search("div[@class='frame'] img").first['src']
  end

  def title
    document.xpath("//span[@class='movieName']").inner_html.strip
  end

  private

  def document
    @document ||= Nokogiri::HTML(open("http://www.forumcinemas.ee/Event/#{@forumcinemas_id}")) rescue nil
  end
end
