# -*- encoding: utf-8 -*-
class UserController < Devise::OmniauthCallbacksController 

  def index
    @users = User.all(:select => "email")
  end

  def show
    logger.debug "session : " + session.inspect
    logger.debug "user  : #{userinfo.email }"
    logger.debug "params : #{params.inspect}"
 
    # @attendance_time = AttendanceTime.find_by_user_id(current_user.id) 
  end


  def regist_attendance_time
    #今日の出勤時間が登録されていなければ登録
    @attendance_time = current_user.create_attendance_time  
  end

  def regist_leaving_time
    #今日の退勤時間が登録されていなければ登録
    @leaving_time = current_user.create_leaving_time  
  end

  private
  def current_user
    current_user
  end

end
