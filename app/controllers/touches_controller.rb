class TouchesController < ApplicationController
  # GET /touches
  # GET /touches.json
  def index
    @touches = Touch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @touches }
    end
  end

  def history
    user_id = params[:user_id]
    
    touch = Touch.find(:all, 
      :order => "touched_date desc", 
      :conditions => ["user_id = ?", user_id], 
      :include => :station
    )
    
    render :json => touch.to_json(:include => :station) 
  end

  # GET /touches/1
  # GET /touches/1.json
  def show
    @touch = Touch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @touch }
    end
  end

  # GET /touches/new
  # GET /touches/new.json
  def new
    @touch = Touch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @touch }
    end
  end

  # GET /touches/1/edit
  def edit
    @touch = Touch.find(params[:id])
  end

  # POST /touches
  # POST /touches.json
  def create
    @touch = Touch.new(params[:touch])

    respond_to do |format|
      if @touch.save
        format.html { redirect_to @touch, notice: 'Touch was successfully created.' }
        format.json { render json: @touch, status: :created, location: @touch }
      else
        format.html { render action: "new" }
        format.json { render json: @touch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /touches/1
  # PUT /touches/1.json
  def update
    @touch = Touch.find(params[:id])

    respond_to do |format|
      if @touch.update_attributes(params[:touch])
        format.html { redirect_to @touch, notice: 'Touch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @touch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /touches/1
  # DELETE /touches/1.json
  def destroy
    @touch = Touch.find(params[:id])
    @touch.destroy

    respond_to do |format|
      format.html { redirect_to touches_url }
      format.json { head :no_content }
    end
  end
end
