class HomeworksController < ApplicationController
  before_filter :authenticate_user!

  # GET /homeworks
  # GET /homeworks.json
  def index
    @homeworks = current_user.lists.default.homeworks

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @homeworks }
    end
  end

  # GET /homeworks/1
  # GET /homeworks/1.json
  def show
    @homework = Homework.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @homework }
    end
  end

  # GET /homeworks/new
  # GET /homeworks/new.json
  def new
    @homework = Homework.new
    @homework.deadline = Time.now + 2.hours
    @in_wizard = current_user.lists.default.homeworks.empty?

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @homework }
    end
  end

  # GET /homeworks/1/edit
  def edit
    @homework = Homework.find(params[:id])
  end

  # POST /homeworks
  # POST /homeworks.json
  def create
    @homework = current_user.lists.default.homeworks.build(params[:homework])

    respond_to do |format|
      if @homework.save
        format.html { redirect_to homeworks_path, notice: 'Homework was successfully created.' }
        format.json { render json: @homework, status: :created, location: @homework }
      else
        format.html { render action: "new" }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /homeworks/1
  # PUT /homeworks/1.json
  def update
    @homework = Homework.find(params[:id])

    respond_to do |format|
      if @homework.update_attributes(params[:homework])
        format.html { redirect_to @homework, notice: 'Homework was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeworks/1
  # DELETE /homeworks/1.json
  def destroy
    @homework = Homework.find(params[:id])
    @homework.destroy

    respond_to do |format|
      format.html { redirect_to homeworks_url }
      format.json { head :no_content }
    end
  end
end
