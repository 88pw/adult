class Post < ApplicationRecord
    
    def self.generate_post
        cpz = CrowlCpzServise.new
        page_list = cpz.get_articles
        i = 0
        articles = page_list.map do |p|
            puts "#{i}件目"
            i += 1
            cpz.get_article(p)
            
        end
        
        articles.each do |a|
			hash = {
			        title: a[:dmm_info][:title],
			        description: a[:dmm_info][:description],
			        thumbnail_url: a[:dmm_info][:img_url],
			        review_score: a[:dmm_info][:review_score],
			        service_url: a[:url],
			        service_id: a[:service_id]
			      }
		    Post.create(hash)
        end
        
    end
    
end
