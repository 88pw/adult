require 'mechanize'
require 'nokogiri'
require 'json'

class CrowlCpzServise < ParseDmmServise

    def initialize
        @agent = Mechanize.new        
    end


	def get_articles
		url = "http://cpz.to/main.html"
		Nokogiri::HTML(@agent.get(url).body).xpath('//*[@class="moviedate"]/h3/a/@href').map(&:to_s)
	end


	# Postモデルに必要な情報を個別ページから取得
	def get_article(url)
		page = @agent.get(url)
		nokogiri = Nokogiri::HTML(page.body)
		dmm_url = nokogiri.xpath('//*[@id="movie_pac"]/a[1]/@href').to_s
	
		if dmm_url.match(/ad.dmm.com/)
			dmm_url = dmm_url.match(/_lurl=(.*)\/%3ftag%3d1%26utm_campaign/)[1]
		end
	
		{
			url: url,
			service_id: 1,
			dmm_info: parse_dmm(dmm_url,@agent),
		}
	end

end