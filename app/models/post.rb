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
        
        articles.each do |article|
            post = self.build_post(article)
            post.save!

            article[:dmm_info][:actresses].each do |actress_data|
                actress = Actress.find_or_initialize_by(dmm_id: actress_data[:identifier])
                if actress.new_record?
                    actress[:name] = actress_data[:name]
                    actress.save!
                end
            end
        end
    end

    def self.build_post(article)        
        hash = {
                title: article[:dmm_info][:title],
                description: article[:dmm_info][:description],
                thumbnail_url: article[:dmm_info][:img_url],
                review_score: article[:dmm_info][:review_score],
                service_url: article[:url],
                service_id: article[:service_id],
              }
        Post.new(hash)
    end
    
end
