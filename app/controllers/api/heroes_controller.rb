module Api
  class HeroesController < ApplicationController

    # listar Heroes 
    def index 
        heroes = Hero.order('created_at DESC')
        
        render json: { status: 'SUCCESS', message: 'heroes carregados', data: heroes }, status: :ok
    end
    
    def show
      hero = Hero.find(params[:id])

      render json: { status: 'SUCCESS', message: 'hero carregado', data: hero }, status: :ok
    end

    def create
      hero = Hero.new(hero_params)
      if hero.save()
        render json: { status: 'SUCCESS', message: 'novo hero cadastrado', data: hero }, status: :ok
      else
        render json: { status: 'ERROR', message:'Hero não foi salvo', data: hero.errors }, status: :unprocessable_entity
      end
    end

    def update
      hero = Hero.find(params[:id])
      if  hero.update(name: params[:name])
        render json: { status: 'SUCCESS', message: 'novo hero atualizado', data: hero }, status: :ok
      else
        render json: { status: 'ERROR', message:'Hero não foi atualizado', data: hero.errors }, status: :unprocessable_entity
      end
    end


    def destroy
      hero = Hero.find(params[:id])
      hero.destroy

      render json: { status: 'SUCCESS', message: 'Hero deletado', data: hero }, status: :ok
    end

    private 
    def hero_params
      params.permit(:name)
    end
  end
end
