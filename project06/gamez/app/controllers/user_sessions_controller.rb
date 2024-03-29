class UserSessionsController < ApplicationController
  filter_resource_access
  # GET /user_sessions/new
  # GET /user_sessions/new.json
  def new
    @user_session = UserSession.new
  end

  # POST /user_sessions
  # POST /user_sessions.json
  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to :root }
        format.json { render json: @user_session, status: :created, location: @user_session, notice: 'Logged in successfully.' }
      else
        format.html { render action: "new" }
        format.json { render json: @user_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.json
  def destroy
    @user_session = UserSession.find
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_to :root, notice: 'Logged out successfully.' }
      format.json { head :no_content, notice: 'Logged in successfully.' }
    end
  end
end
