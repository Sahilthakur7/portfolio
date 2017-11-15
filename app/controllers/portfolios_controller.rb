class PortfoliosController < ApplicationController
    layout "portfolio"
    def index
        @page_title +=  " Portfolios"
        @portfolio_items = Portfolio.all
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
        @portfolio_item = Portfolio.find(params[:id])
        @page_title +=  "#{@portfolio_item.title} "
    end

    def edit
        @portfolio_item = Portfolio.find(params[:id])
    end

    def update
        @portfolio_item = Portfolio.find(params[:id])
        respond_to do |format|
            if @portfolio_item.update(portfolio_params)
                format.html {redirect_to portfolios_path, notice: "The portfolio has been updated"}
            else
                format.html {render :edit}
            end
        end
    end

    def destroy
        @portfolio_item = Portfolio.find(params[:id])

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
end
