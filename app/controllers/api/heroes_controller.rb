module Api
  class HeroesController < ApplicationController

    # listar Heroes 
    def index 
        heroes = Hero.order('created_at DESC')
        
        render json: {status: 'SUCCESS', message: 'heroes carregados', data: heroes}, status: :ok
    end
    
    def show
      hero = Hero.find(params[:id])

      render json: {status: 'SUCCESS', message: 'hero carregado', data: hero}, status: :ok
    end
  end
end
