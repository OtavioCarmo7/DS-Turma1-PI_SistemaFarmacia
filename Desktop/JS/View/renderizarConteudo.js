function renderizarElementos(htmlPagina) {
    const coluna = document.getElementById("colunaAcoes")

    if(coluna){
        coluna.innerHTML = htmlPagina;

        if(document.documentElement.classList.contains("fundo-escuro")) {
            const tabelaEstoque = document.getElementById("tabelaEstoque");
            const barraPesquisa = document.getElementById("inputCodigoBarras");
            if(tabelaEstoque) {
                tabelaEstoque.classList.toggle("tabelaEstoque-escuro")
            }
            if(barraPesquisa) {
                barraPesquisa.classList.toggle("barra-pesquisa-escuro")
            }
        }
    }
}