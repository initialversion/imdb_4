class DirectorsController < ApplicationController
  def index
    @directors = Director.page(params[:page])

    render("directors/index.html.erb")
  end

  def show
    @movie = Movie.new
    @director = Director.find(params[:id])

    render("directors/show.html.erb")
  end

  def new
    @director = Director.new

    render("directors/new.html.erb")
  end

  def create
    @director = Director.new

    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image = params[:image]

    save_status = @director.save

    if save_status == true
      redirect_to(:back, :notice => "Director created successfully.")
    else
      render("directors/new.html.erb")
    end
  end

  def edit
    @director = Director.find(params[:id])

    render("directors/edit.html.erb")
  end

  def update
    @director = Director.find(params[:id])

    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image = params[:image]

    save_status = @director.save

    if save_status == true
      redirect_to(:back, :notice => "Director updated successfully.")
    else
      render("directors/edit.html.erb")
    end
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy

    if URI(request.referer).path == "/directors/#{@director.id}"
      redirect_to("/", :notice => "Director deleted.")
    else
      redirect_to(:back, :notice => "Director deleted.")
    end
  end
end
