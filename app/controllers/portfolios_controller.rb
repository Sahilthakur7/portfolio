class PortfoliosController < ApplicationController
    before_action :set_portfolio_item,only: [ :show,:destroy,:edit,:update]
    access all: [:show,:index,:ror,:react], user: {except: [:destroy,:new,:create,:update,:edit]}, site_admin: :all
    layout "portfolio"
    def index
        @page_title +=  " Portfolios"
        @portfolio_items = Portfolio.by_position
    end

    def sort
        params[:order].each do |key,value|
            Porfolio.find(value[:id]).update(position: value[:position])
        end

        render nothing: true
    end

    def new
        @portfolio_item = Portfolio.new        
        3.times { @portfolio_item.technologies.build}
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
                                          technologies_attributes: [:name])



    end

    def set_portfolio_item
        @portfolio_item = Portfolio.find(params[:id])

    end
end
