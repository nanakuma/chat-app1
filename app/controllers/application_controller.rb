class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  #authenticate_user!メソッドは、処理が呼ばれた段階で、ユーザーがログインしていなければ、そのユーザーをログイン画面に遷移させる
  before_action :configure_permitted_parameters, if: :devise_controller?
  #:devise_contoller?とはdeviseを生成した際にできるヘルパーメソッドの一つで、deviseにまつわる画面に行った時に、という意味がある。
  #こうすることで全ての画面でconfigure_permitted_parametersをするのを防いでいるのである。

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #deviseでユーザー登録をする場合に使用でき、「特定のカラムを許容する」メソッド  
  end

end
