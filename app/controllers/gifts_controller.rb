class GiftsController < ApplicationController
  def index
    @gifts = Gift.find(:all)
  end

  def search_gifter
    @codename = params[:gift][:gifter]
    @gifts = Gift.find_all_by_gifter(@codename)
  end
  
  def bags
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])
    @gift.update_attributes(params[:gift])
    respond_to do |format|
      if @gift.update_attributes(params[:gift])
        flash[:notice] = 'Gift was successfully bagsed.'
        format.html { redirect_to(:action => "index") }
        format.xml  { head :ok }
        flash[:notice] = 'Gift was successfully bagsed.'
      else
        format.html { render :action => "bags" }
        format.xml  { render :xml => @gift.errors, :status => :unprocessable_entity }
      end
    end
  end

  def unbags
    @gift = Gift.find(params[:id])
    @gifter = @gift.gifter
    @gift.update_attribute(:gifter, nil)
    flash[:notice] = 'The gift has been removed from your list, and will now be available to others.'

    respond_to do |format|
      format.html { redirect_to :action => "search_gifter", 
        :gift => {:gifter => @gifter} }
      format.xml  { head :ok}
    end
  end
end
