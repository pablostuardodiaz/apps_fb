# Helper methods defined here can be accessed in any controller or view in the application

Fbappbrilliance.helpers do
  def base64_url_decode str
    encoded_str = str.to_s.gsub('-','+').gsub('_','/')
    encoded_str += '=' while !(encoded_str.size % 4).zero?
    Base64.decode64(encoded_str)
  end

  def decode_data str
    encoded_sig, payload = str.to_s.split('.')
    data = base64_url_decode(payload) 
  end
end
