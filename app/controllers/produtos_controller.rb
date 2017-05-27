class ProdutosController < ApplicationController

	def index
		@produtos = Produto.order(:nome).limit(10)
	end

	def busca
		@nome_a_buscar = params[:nome]
		@produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}"
	end

	def create
		valores = params.require(:produto).permit(:nome,:preco,:descricao,:quantidade)
		produto = Produto.create valores
		flash[:notice] = "Produto salvo com sucesso"
		redirect_to root_url
	end

	def destroy
		id = params[:id]
		Produto.destroy id
		redirect_to root_url
	end

end