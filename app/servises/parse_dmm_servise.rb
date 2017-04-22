require 'mechanize'
require 'nokogiri'
require 'json'

class ParseDmmServise
    
	# 与えられたクエリでDMMを検索し、実行結果をハッシュ形式で返す(最大5件)
	def search_dmm(str,agent)
		url = "http://www.dmm.co.jp/search/=/searchstr=#{str}/n1=FgRCTw9VBA4GAVhfWkIHWw__/sort=rankprofile/"
		page = agent.get(url)
		nokogiri = Nokogiri::HTML(page.body)
	
		# 検索結果の有無を真偽値で取得
		is_success = !nokogiri.xpath('//a').map(&:text).include?("検索のヒント")
	
		unless is_success
			{
				is_success: is_success,
				results: nil
			}
		else
			results_source = nokogiri.xpath('//*[@id="list"]/li')
			# 5件分の情報をパースし、ハッシュの配列を取得
			results = (0..4).map do |i|
				{
					title: results_source.xpath('//p[@class="tmb"]//img/@alt')[i].to_s,
					link: results_source.xpath('//p[@class="tmb"]/a/@href')[i].to_s
				}
			end
	
			{
				is_success: is_success,
				results: results.select{|r| !r[:title].empty?} # 配列からTitleが空白のものを取り除く
			}
	
		end
		rescue
			{
				is_success: false,
				results: nil
			}
	end


	# DMMのURLからページを取得し、パースした情報をHash形式で返します
	def parse_dmm(url,agent)
		page = agent.get(url)
		nokogiri = Nokogiri::HTML(page.body)
	
		top = nokogiri.xpath('//td[@valign="top"]')
		actresses = top.xpath('table/tr[5]/td[2]//a').map do |actress|
				hash = {
					name: actress.text,
					identifier: actress.to_s.match(/id=(.*?)\//)[1],
				}
		end
		{
			title: page.title.split(" - ").slice(0..-3).join(""),
			img_url: nokogiri.xpath('//*[@id="sample-video"]//img/@src').to_s,
			description: top.xpath('div[4]/text()')[0].to_s.gsub(/\n/, ""),
			series: top.xpath('table/tr[7]/td[2]/a').text(),
			label: top.xpath('table/tr[9]/td[2]/a').text(),
			genre: top.xpath('table/tr[10]/td[2]/a').map{|g| g.text},
			identifier: top.xpath('table/tr[11]/td[2]').text,
			review_score: review_helper(top.xpath('table/tr[12]/td[2]/img/@src').text()),
			actresses: actresses,
		}
		rescue
			nil
	end


	# 文字列(URL)から数字に関する情報を抽出し、フロート型で返します
	def review_helper(str)
		return nil unless md = str.match(/review\/(.*).gif/)
		md[1].size == 3 ? md[1].gsub(/_/, ".").to_f : md[1].to_f
		rescue
			nil 
	end
   
    
end