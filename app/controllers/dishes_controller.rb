class DishesController < ApplicationController
  def index
    @dishes = Dish.all.order({ :created_at => :desc })

    render({ :template => "dishes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @dish = Dish.where({:id => the_id }).at(0)

    render({ :template => "dishes/show.html.erb" })
  end

  def create
    @dish = Dish.new
    @dish.name = params.fetch("query_name")
    @dish.description = params.fetch("query_description")
    @dish.cuisine_id = params.fetch("query_cuisine_id")

    if @dish.valid?
      @dish.save
      redirect_to("/dishes", { :notice => "Dish created successfully." })
    else
      redirect_to("/dishes", { :notice => "Dish failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @dish = Dish.where({ :id => the_id }).at(0)

    @dish.name = params.fetch("query_name")
    @dish.description = params.fetch("query_description")
    @dish.cuisine_id = params.fetch("query_cuisine_id")

    if @dish.valid?
      @dish.save
      redirect_to("/dishes/#{@dish.id}", { :notice => "Dish updated successfully."} )
    else
      redirect_to("/dishes/#{@dish.id}", { :alert => "Dish failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @dish = Dish.where({ :id => the_id }).at(0)

    @dish.destroy

    redirect_to("/dishes", { :notice => "Dish deleted successfully."} )
  end
end
