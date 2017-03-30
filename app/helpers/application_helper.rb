module ApplicationHelper
  def google_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&zoom=12&size=400x400"
  end

  def static_map_for(location, options = {})
    params = {
      :center => [location.latitude, location.longitude].join(','),
      :zoom => 15,
      :size => '300x300',
      :markers => [location.latitude, location.longitude].join(','),
      :sensor => true
    }.merge(options)

    query_string = params.map { |k, v| "#{k}=#{v}" }.join('&')
    image_tag "http://maps.googleapis.com/maps/api/staticmap?#{query_string}",
              :alt => location.address
  end
end
