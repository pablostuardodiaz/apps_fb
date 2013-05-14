Fbappbrilliance.controllers :base do
  post :index, :map => "/" do
    unless params[:signed_request].to_s.blank?
      @encoded_request = params[:signed_request]
      @json_request = decode_data(@encoded_request)
      @signed_request = Crack::JSON.parse(@json_request)
      session['signed_request'] = @encoded_request
      if @signed_request['page']['liked']
        render 'base/index'
      else
        render 'base/nofans'
      end
    else
      render 'base/redirect'
    end
  end

  post :canvas, :map => "/canvas" do
    render 'base/redirect'
  end

  get :share, :map => "/share" do
    render 'base/share'
  end
  
  get :communes, :map => '/communes' do
    @region = params[:type]
    @communes = communes_of @region
    @communes_of_region = "<option selected='selected' disabled='disabled' value=''>Elige tu comuna...</option>"
    @communes.each do |commune|
      @communes_of_region = "#{@communes_of_region} <option value='#{commune}'>#{commune}</option>"
    end
    return @communes_of_region
  end  
end


