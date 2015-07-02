class KittensController < ApplicationController
	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.new(kitten_params)

		if @kitten.save
			flash[:success] = "Kitten successfully added nyahaha"
			redirect_to root_url
		else
			flash[:error] = "Error adding kitten"
			render 'new'
		end
	end

	def edit
		@kitten = Kitten.find_by(id: params[:id])
	end

	def update
		@kitten = Kitten.find_by(id: params[:id])

		if @kitten.update(kitten_params)
			flash[:success] = "Is this the same kitty?"
			redirect_to kitten_path
		else
			flash[:error] = "Kitty looks the same to me"
			render 'edit'
		end
	end

	def destroy
		@kitten = Kitten.find_by(id: params[:id])

		if @kitten.destroy
			flash[:success] = "You have destroyed a kitten"
			redirect_to root_url
		else
			flash[:error] = "Kitten could not be destroyed"
			redirect_to root_url
		end

	end

	def index
		@kittens = Kitten.all

		respond_to do |format|
			format.html
			format.xml { render xml: @kittens}
			format.json { render json: @kittens}
		end
	end

	def show
		@kitten = Kitten.find_by(id: params[:id])
		respond_to do |format|
			format.html
			format.xml { render xml: @kitten}
			format.json { render json: @kitten}
		end
	end

	private

	def kitten_params
		params.require(:kitten).permit(:name, :age, :softness, :cuteness)
	end
end
