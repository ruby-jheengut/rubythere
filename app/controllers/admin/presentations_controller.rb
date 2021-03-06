class Admin::PresentationsController < AdminAreaController
  inherit_resources
  
  cache_sweeper :presentations_sweeper
  
  def create
    if params[:presentation][:speaker_attributes]
      unless params[:presentation]["speaker_id"].blank?
        params[:presentation].delete("speaker_attributes")
      end
    end
    
    if params[:presentation][:talk_attributes]
      unless params[:presentation]["talk_id"].blank?
        params[:presentation].delete("talk_attributes")
      end
    end
    
    @presentation = Presentation.new(params[:presentation])
    if @presentation.save
      flash[:notice] = "Presentation successfully added"
      redirect_to admin_presentations_path
    else
      render :action => :new
    end
  end
  
end
