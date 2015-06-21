class TasksController < ApplicationController

  def destroy
    @task = Task.find_by_id(params[:id])
    if !@task.nil?
      @task.destroy
    else
      redirect_to lists_path
    end
  end

end
