// Criação da tela com HTML

const telaEstoque = `
              <header class="header-estoque">
                    <h2 class="negrito" id="tituloAcoes">Estoque</h2>
                </header>

                <main class="opcoes-Acoes" id="opcoes-Config">
                    <div id="container-main">
                    
			<div id="right-side-main">
				<div id="left-side-estoque-container">
					<div id="right-side-estoque-container">
						<div id="estoque-search-container">
							<form id="estoque-search-forms" action="" method="get">
								<input id="inputCodigoBarras" class="form-control"
									placeholder="CÓDIGO DE BARRAS (VALOR NUMÉRICO)">
								<input id="btnAdicionar" class="btn-solid theme-primary" type="submit" value="BUSCAR">
							</form>

						</div>
					</div>
					<div id="estoque-top">
						<div class="tabela-container">
							<table id="tabelaEstoque" class="table table-bordered">
								<thead>
									<th>CÓDIGO DE BARRAS (VALOR NUMÉRICO)</th>
									<th>NOME PRODUTO</th>
									<th>QUANTIDADE</th>
									<th>LOTE</th>
									<th>VALOR UNITÁRIO</th>
									<th>AÇÕES</th>
								</thead>
								<tbody>
									<tr>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td></td>
									</tr>
									<tr>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td></td>
									</tr>
									<tr>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td></td>
									</tr>
									<tr>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td></td>
									</tr>
									<tr>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td></td>
									</tr>
									<tr>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td></td>
									</tr>
									<tr>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td></td>
									</tr>
									<tr>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td></td>
									</tr>
									<tr>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td></td>
									</tr>
									<tr>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td>teste</td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>

					</div> 
				</div>
			</div>
		</div>
                </main>
        `

/* Coloca o HTML acima no espaço em branco da página inicial quando 
clicamos no botão configuracoes*/

function renderizarConfiguracoes(){

    document.addEventListener("click", function (event) {
    
        const botaoEstoque = event.target.closest("#fundoEstoque");
    
        if (botaoEstoque) {
            event.preventDefault()
            renderizarElementos(telaEstoque)
        }
    });
}

renderizarConfiguracoes()

