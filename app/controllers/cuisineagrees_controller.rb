class CuisineagreesController < ApplicationController
  def index
    @cuisineagrees = Cuisineagree.all.order({ :created_at => :desc })

    render({ :template => "cuisineagrees/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @cuisineagree = Cuisineagree.where({:id => the_id }).at(0)

    render({ :template => "cuisineagrees/show.html.erb" })
  end

  def create
    @cuisineagree = Cuisineagree.new
    @cuisineagree.ca_id = params.fetch("query_ca_id")
    @cuisineagree.cfood_id = params.fetch("query_cfood_id")

    if @cuisineagree.valid?
      @cuisineagree.save
      redirect_to("/cuisineagrees", { :notice => "Cuisineagree created successfully." })
    else
      redirect_to("/cuisineagrees", { :notice => "Cuisineagree failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @cuisineagree = Cuisineagree.where({ :id => the_id }).at(0)

    @cuisineagree.ca_id = params.fetch("query_ca_id")
    @cuisineagree.cfood_id = params.fetch("query_cfood_id")

    if @cuisineagree.valid?
      @cuisineagree.save
      redirect_to("/cuisineagrees/#{@cuisineagree.id}", { :notice => "Cuisineagree updated successfully."} )
    else
      redirect_to("/cuisineagrees/#{@cuisineagree.id}", { :alert => "Cuisineagree failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @cuisineagree = Cuisineagree.where({ :id => the_id }).at(0)

    @cuisineagree.destroy

    redirect_to("/cuisineagrees", { :notice => "Cuisineagree deleted successfully."} )
  end
end
