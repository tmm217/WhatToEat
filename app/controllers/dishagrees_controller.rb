class DishagreesController < ApplicationController
  def index
    @dishagrees = Dishagree.all.order({ :created_at => :desc })

    render({ :template => "dishagrees/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @dishagree = Dishagree.where({:id => the_id }).at(0)

    render({ :template => "dishagrees/show.html.erb" })
  end

  def create
    @dishagree = Dishagree.new
    @dishagree.da_id = params.fetch("query_da_id")
    @dishagree.dfood_id = params.fetch("query_dfood_id")

    if @dishagree.valid?
      @dishagree.save
      redirect_to("/dishagrees", { :notice => "Dishagree created successfully." })
    else
      redirect_to("/dishagrees", { :notice => "Dishagree failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @dishagree = Dishagree.where({ :id => the_id }).at(0)

    @dishagree.da_id = params.fetch("query_da_id")
    @dishagree.dfood_id = params.fetch("query_dfood_id")

    if @dishagree.valid?
      @dishagree.save
      redirect_to("/dishagrees/#{@dishagree.id}", { :notice => "Dishagree updated successfully."} )
    else
      redirect_to("/dishagrees/#{@dishagree.id}", { :alert => "Dishagree failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @dishagree = Dishagree.where({ :id => the_id }).at(0)

    @dishagree.destroy

    redirect_to("/dishagrees", { :notice => "Dishagree deleted successfully."} )
  end
end
