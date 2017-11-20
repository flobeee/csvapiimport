class CsvapiimportsController < ApplicationController
  def index
    @csvapiimports = Csvapi.all.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end

  def import
    Csvapi.import(params[:file], params[:export], params[:site], params[:credentials], params[:object], params[:fieldname], params[:fieldto])
    redirect_to root_url, notice: "Api messages running."
  end
end
