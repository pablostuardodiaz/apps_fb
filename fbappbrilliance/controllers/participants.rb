#encoding: utf-8
Fbappbrilliance.controllers :participants do
  before :new do
    session[:facebook_id] = params[:participant][:facebook_id]
    if @participant = Participant.find_by_facebook_id(params[:participant][:facebook_id])
      redirect url(:participants, :edit, :id => @participant.id)
    end
  end

  get :new, :map => "participants/new" do
    @regiones = regiones_de_chile
    render "participants/new"
  end

  post :create do
    begin 
      @participant = Participant.new
      @participant.facebook_email = params[:facebook_email]
      @participant.facebook_first_name = params[:facebook_first_name]
      @participant.facebook_id = session[:facebook_id]
      @participant.rut = params[:rut]
      @participant.phone = params[:phone]

      if @participant.save then
        @participation = Participation.new
        @participation.application_id = "9" 
        @participation.participant_id = @participant.id
        @participation.answer = "#{params[:region]},#{params[:commune]}"
        @participation.accepts_to_receive_information = params[:conditions]
        @participation.save(:validate => false)
        redirect url(:base, :share)
      else
        render 'participants/new'
      end
    rescue
      redirect url(:base, :share)
    end
  end

  get :edit, :with => :id do
    if @participant = Participant.find(params[:id])
      render 'participants/edit'
    else
      redirect url(:base, :share)
    end
  end  

  put :update, :with => :id do
    @participant = Participant.find(params[:id])
    @participant.facebook_email = params[:facebook_email]
    @participant.facebook_first_name = params[:facebook_first_name]
    @participant.facebook_id = session[:facebook_id]
    @participant.rut = params[:rut]
    @participant.phone = params[:phone]
    
    @participation = Participation.new
    @participation.application_id = "9" 
    @participation.participant_id = @participant.id
    @participation.answer = "#{params[:region]},#{params[:commune]}"
    @participation.accepts_to_receive_information = params[:conditions]
    
    if @participant.save && @participation.save
      redirect url(:base, :share)
    else
      #redirect url(:participants, :edit, :id => @participant.id)
      redirect url(:base, :share)
    end
  end
end
