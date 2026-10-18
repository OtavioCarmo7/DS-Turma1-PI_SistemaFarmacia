function renderizarElementos(htmlPagina) {
    const coluna = document.getElementById("colunaAcoes")

    if(coluna){
        coluna.innerHTML = htmlPagina;
    }
}