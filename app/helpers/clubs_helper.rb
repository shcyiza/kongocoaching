module ClubsHelper

  def static_map_for(club, options = {})
    params = {
      center: [club.latitude, club.longitude].join(","),
      zoom: 17,
      size: "300x300",
      markers: [club.latitude, club.longitude].join(","),
      sensor: true
      }.merge(options)

    query_string_img =  params.map{|k,v| "#{k}=#{v}"}.join("&")
    query_string_address = CGI::escape club.address
    link_to "https://www.google.com/maps/place/#{query_string_address}", target: "_blank" do
      image_tag "http://maps.googleapis.com/maps/api/staticmap?#{query_string_img}", :alt => club.name
    end
  end

  def link_to_gmaps(club)
    query_string = CGI::escape club.address
    link_to club.address, "https://www.google.com/maps/place/#{query_string}", target: "_blank"
  end

end
