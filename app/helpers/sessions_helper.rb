module SessionsHelper
  #登入指定的用户
  def log_in(user)
    session[:user_id] = user.id
  end

  #返回当前登陆的用户（如果有的话）
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    #  @foo = @foo || "bar" 和 @foo ||= "bar" 两种写法是等效的。
  end

  def logged_in?
    !current_user.nil?
  end
  
  # 退出当前用户
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
