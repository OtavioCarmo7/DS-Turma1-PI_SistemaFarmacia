function mudarTamanhoPequeno(elemento) {
    elemento.classList.remove("letra-grande");
    elemento.classList.add("letra-pequena");
}

document.addEventListener("click", (event) => {
    // Colocar texto da página-principal
    const vetorTextosOpcoes = document.querySelectorAll(".Opcao")

    const nomeUsuario = document.getElementById("nomeUsuario")
    const cargoUsuario = document.getElementById("usuarioCargo")

    const botaoPequeno = event.target.closest("#btnPequeno");
    const botaoPadrao = event.target.closest("#btnNormal");
    const botaoGrande = event.target.closest("#btnGrande");

    if (botaoPequeno) {

        vetorTextosOpcoes.forEach(opcao => {
            opcao.classList.remove("letra-grande")
            opcao.classList.add("letra-pequena")
        });


        nomeUsuario.classList.remove("letra-grande");
        cargoUsuario.classList.remove("letra-grande");

        nomeUsuario.classList.add("letra-pequena");
        cargoUsuario.classList.add("letra-pequena");

    }

    else if (botaoPadrao) {

        vetorTextosOpcoes.forEach(opcao => {
            opcao.classList.remove("letra-pequena");
            opcao.classList.remove("letra-grande");
        });

        nomeUsuario.classList.remove("letra-grande");
        cargoUsuario.classList.remove("letra-grande");

        nomeUsuario.classList.remove("letra-pequena");
        cargoUsuario.classList.remove("letra-pequena");
    }

    if (botaoGrande) {

        vetorTextosOpcoes.forEach(opcao => {
            opcao.classList.remove("letra-pequena")
            opcao.classList.add("letra-grande")
        });

        nomeUsuario.classList.remove("letra-pequena");
        cargoUsuario.classList.remove("letra-pequena");

        nomeUsuario.classList.add("letra-grande");
        cargoUsuario.classList.add("letra-grande");

    }
});

