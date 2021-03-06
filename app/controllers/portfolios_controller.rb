class PortfoliosController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token, :only => [:logout]
    before_action :set_portfolio_item,only: [ :show,:destroy,:edit,:update]
    access all: [:show,:index,:ror,:react], user: {except: [:destroy,:new,:create,:update,:edit,:sort]}, site_admin: :all
    layout "portfolio"
    def index
        @page_title +=  " Portfolios"
        @portfolio_items = Portfolio.by_position
    end

    def sort
        params[:order].each do |key,value|
            Portfolio.find(value[:id]).update(position: value[:position])
        end

        render nothing: true
    end

    def new
        @portfolio_item = Portfolio.new        
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_params)
        respond_to do |format|
            if @portfolio_item.save
                format.html {redirect_to portfolios_path, notice: 'Your portfolio is now live'}
            else
                format.html {render :new}
            end 
        end
    end

    def show
        @page_title +=  "#{@portfolio_item.title} "
    end

    def edit
    end

    def update
        respond_to do |format|
            if @portfolio_item.update(portfolio_params)
                format.html {redirect_to portfolios_path, notice: "The portfolio has been updated"}
            else
                format.html {render :edit}
            end
        end
    end

    def destroy

        @portfolio_item.destroy
        respond_to do |format|
            format.html { redirect_to portfolios_path, notice: 'Portfolio was deleted'}
        end
    end

    def react
        @react_items = Portfolio.react
    end

    def ror
        @ror_items = Portfolio.ror
    end

    private

    def portfolio_params
        params.require(:portfolio).permit(:title,
                                          :subtitle,
                                          :body, 
                                          :main_image,
                                          :thumb_image,
                                          technologies_attributes: [:id,:_destroy,:name])



    end

    def set_portfolio_item
        @portfolio_item = Portfolio.find(params[:id])

    end
end
