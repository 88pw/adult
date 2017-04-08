json.extract! post, :id, :title, :description, :actress_id, :thumbnail_url, :review_score, :service_url, :service_id, :ad_url, :series_id, :director_id, :label_id, :maker_id, :created_at, :updated_at
json.url post_url(post, format: :json)
