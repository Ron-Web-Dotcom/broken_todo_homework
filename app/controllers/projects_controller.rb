
#ApplicationController inherit  from ProjectsController in the ProjectController with various methods and function

class ProjectsController < ApplicationController
  before_action :set_project, except:[:index, :new, :create, :show_all_project_details]

  def index
    @projects = Project.all
  end

  def show
  end
def show_all_project_details
    @projects = Project.all.where(deleted: [false, nil])

    filtered_project_list = []

    @projects.each do |project|

      items = []

      project.items.each do |item|
        items << {:action => item.action, :done => item.done}
      end

      filtered_project_list << {
        :title => project.title, :items => items
      }

    end

    render :json => filtered_project_list

  end
  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html {
                      redirect_to project_path(@project),
                      notice: 'Project was successfully created.'
                    }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html {
                      redirect_to project_path(@project),
                      notice: 'Project was successfully updated.'
                    }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html {
                    redirect_to projects_path,
                    notice: 'Project was successfully destroyed.'
                  }
    end
  end

  def clear
    @project.items.complete.destroy_all
    respond_to do |format|
      format.html {
                    redirect_to project_path(@project),
                    notice: 'There are no completed items for this project.' 
                  }
    end
  end

private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title)
  end
end

