const botaoTextoGrande = document.getElementById("btnGrande");

const botaoTextoNormal = document.getElementById("btnNormal");

const botaoTextoPequeno = document.getElementById("btnPequeno");

const vetorTextos = ["fundoRealizarVenda", "fundoClientes", "fundoEstoque", "fundoHistorico", "fundoConfiguracoes", "fundoAreaControle", "fundoSair", "nomeUsuario", "nomeCargo"];

const variaveisTamanho = ["letra-pequena", "letra-grande"]

function textoPequeno() {
    vetorTextos.forEach(texto => {
        texto.classList.add(variaveisTamanho[0])
    });
}

function textoNormal() {

}

function textoGrande() {

}