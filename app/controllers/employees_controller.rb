class EmployeesController < ApplicationController
    before_action :authenticate_admin_user!
    before_action :set_employee, only: [:edit, :update, :destroy]


     # 従業員の一覧表示
    def index
      @employees =User.all
    end
    # 新しい従業員を作成するためのフォームを表示
    def new
        @employee = User.new
    end
    # 新しい従業員を保存
    def create
        @employee = User.new(employee_params)
        if @employee.save
          redirect_to employees_path, notice: '従業員を追加しました'
        else
          render :new
        end
    end

     # 従業員の編集フォームを表示
    def edit
    end

     # 従業員の編集フォームを表示
    def update
        if @employee.update(employee_params)
          redirect_to employees_path, notice: 'シフト設定が更新されました。'
        else
          render :edit
        end
    end


    # 従業員を削除
    def destroy
        @employee.destroy
        redirect_to employees_path, notice: 'シフト設定が削除されました。'
    end

    private

    # 従業員IDを取得
    def set_employee
        @employee = User.find(params[:id])
      
    end
    
    def employee_params
        params.require(:user).permit(:employee_id, :email, :password, :password_confirmation, :name)
    end


end
