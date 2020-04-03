class CuisinesController < ApplicationController
  def index
    @cuisines = Cuisine.all.order({ :created_at => :desc })

    render({ :template => "cuisines/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @cuisine = Cuisine.where({:id => the_id }).at(0)

    render({ :template => "cuisines/show.html.erb" })
  end

  def create
    @cuisine = Cuisine.new
    @cuisine.title = params.fetch("query_title")
    @cuisine.image = params.fetch("query_image")

    if @cuisine.valid?
      @cuisine.save
      redirect_to("/cuisines", { :notice => "Cuisine created successfully." })
    else
      redirect_to("/cuisines", { :notice => "Cuisine failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @cuisine = Cuisine.where({ :id => the_id }).at(0)

    @cuisine.title = params.fetch("query_title")
    @cuisine.image = params.fetch("query_image")

    if @cuisine.valid?
      @cuisine.save
      redirect_to("/cuisines/#{@cuisine.id}", { :notice => "Cuisine updated successfully."} )
    else
      redirect_to("/cuisines/#{@cuisine.id}", { :alert => "Cuisine failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @cuisine = Cuisine.where({ :id => the_id }).at(0)

    @cuisine.destroy

    redirect_to("/cuisines", { :notice => "Cuisine deleted successfully."} )
  end
end
