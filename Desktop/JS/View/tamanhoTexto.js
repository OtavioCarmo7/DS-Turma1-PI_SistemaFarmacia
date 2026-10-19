const botaoTextoGrande = document.getElementById("btnGrande");

const botaoTextoNormal = document.getElementById("btnNormal");

const botaoTextoPequeno = "#btnPequeno";

const vetorTextos = [
    document.getElementById("fundoRealizarVenda"),
    document.getElementById("fundoClientes"),
    document.getElementById("fundoEstoque"),
    document.getElementById("fundoHistorico"),
    document.getElementById("fundoConfiguracoes"),
    document.getElementById("fundoAreaControle"),
    document.getElementById("fundoSair"),
    document.getElementById("nomeUsuario"),
    document.getElementById("nomeCargo")
];

const variaveisTamanho = ["letra-pequena", "letra-grande"]

function textoPequeno(event) {
    const botaoPequeno = event.target.closest("#btnPequeno");

    if (botaoPequeno) {
        vetorTextos.forEach(texto => {
            texto.classList.remove(variaveisTamanho[1]);
            texto.classList.add(variaveisTamanho[0]);
        });
    }
}

function textoNormal(event) {

    const botaoPadrao = event.target.closest("#btnNormal");

    if (botaoPadrao) {
        vetorTextos.forEach(texto =>{
            texto.classList.remove(variaveisTamanho[0]);
            texto.classList.remove(variaveisTamanho[1]);
        });
    }
}

function textoGrande(event) {

    const botaoGrande = event.target.closest("#btnGrande");

    if (botaoGrande) {
        vetorTextos.forEach(texto => {
            texto.classList.toggle.remove(variaveisTamanho[0]);
            texto.classList.toggle.add(variaveisTamanho[1]);
        });
    }
}

document.addEventListener("click", () => {
    textoGrande();
    textoPequeno();
    textoNormal();

});

