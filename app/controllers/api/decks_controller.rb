module Api
  class DecksController < ApplicationController
    before_action :load_deck, except: [:index, :create]

    def index
      render json: DeckSerializer.render_as_json(Deck.all.order(name: :asc), root: 'decks')
    end

    def show
      render json: DeckSerializer.render_as_json(@deck, root: 'deck')
    end

    def create
      deck = Deck.new(deck_params)
      if deck.save
        render json: DeckSerializer.render(deck, root: 'deck'), status: :created
      else
        render json: { errors: deck.errors }, status: :bad_request
      end
    end

    def update
      if deck.update(deck_params)
        render json: DeckSerializer.render_as_json(@deck, root: 'deck')
      else
        render json: { errors: @deck.errors }, status: :bad_request
      end
    end

    def destroy
      @deck.destroy
      head :no_content
    end

    private

    def deck_params
      params.require(:deck).permit(:id, :name, :created_at, :updated_at, :owner_id)
    end

    def load_deck
      @deck = Deck.find(params[:id])
    end
  end
end