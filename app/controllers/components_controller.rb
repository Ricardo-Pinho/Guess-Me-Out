class ComponentsController < ApplicationController

  before_filter :save_login_state, :only => [:new, :edit, :create, :update, :destroy]
  before_filter :authenticate_user, :except => [:search, :show]

  # GET /components
  # GET /components.json
  def search
    @components = Component.all( :conditions=> ["name like ?","%" + params[:name]  + "%"])
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /components/1
  # GET /components/1.json
  def show
    @component = Component.find(params[:id])
    @componenttypes = Componenttype.all(:conditions=>["component_id = ?", @component.id])
    if session[:user_id]
      @usercomponents = Usercomponent.all( :conditions=> ["user_id = ?", + session[:user_id]])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @component }
    end
  end

  # GET /components/new
  # GET /components/new.json
  def new
    @component = Component.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @component }
    end
  end

  # GET /components/1/edit
  def edit
    @component = Component.find(params[:id])
  end

  # POST /components
  # POST /components.json
  def create
    @component = Component.new(params[:component])

    respond_to do |format|
      if @component.save
        format.html { redirect_to @component, notice: 'Component was successfully created.' }
        format.json { render json: @component, status: :created, location: @component }
      else
        format.html { render action: "new" }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /components/1
  # PUT /components/1.json
  def update
    @component = Component.find(params[:id])

    respond_to do |format|
      if @component.update_attributes(params[:component])
        format.html { redirect_to @component, notice: 'Component was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.json
  def destroy
    @component = Component.find(params[:id])
    Componenttype.destroy_all(:component_id=>@component.id)
    @component.destroy

    respond_to do |format|
      format.html { redirect_to components_url }
      format.json { head :no_content }
    end
  end
end
