class StatusesController < ApplicationController

  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.all
  end

  # POST /statuses
  def create
    @status = Status.new(keyword: params[:keyword])
      if @status.save
        redirect_to root_path, notice: "チーム名『#{params[:keyword]}』が登録されました。またのご利用をお待ちしています。"
      else
        redirect_to root_path
      end
  end

  def result
    render :text => "id = #{params[:id]}"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:keyword)
    end
end
