class PortfoliosController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @portfolios = User.first.portfolios.all
  end

  def create
    @portfolio = current_user.portfolios.build(portfolio_params)
    if @portfolio.save
      flash[:success] = "portfolio created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:content)
    end
end
