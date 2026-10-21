class MudaTamanho {

    apagaClasse(elemento, classe) {
        elemento.classList.remove(classe)
    }

    adicionaClasse(elemento, classe) {
        elemento.classList.add(classe)
    }

    fontePequena(vetor, nomeUsuario, cargoUsuario, tituloConfig, txtCorFundo, txtTamanhoBtn) {
        vetor.forEach(opcao => {
            this.apagaClasse(opcao, "letra-grande");
            this.adicionaClasse(opcao, "letra-pequena");

        });

        this.apagaClasse(nomeUsuario, "letra-grande");
        this.apagaClasse(cargoUsuario, "letra-grande");
        this.apagaClasse(tituloConfig, "letra-grande");
        this.apagaClasse(txtCorFundo, "letra-grande")
        this.apagaClasse(txtTamanhoBtn, "letra-grande")

        this.adicionaClasse(nomeUsuario, "letra-pequena");
        this.adicionaClasse(cargoUsuario, "letra-pequena");
        this.adicionaClasse(tituloConfig, "letra-pequena");
        this.adicionaClasse(txtCorFundo, "letra-pequena");
        this.adicionaClasse(txtTamanhoBtn, "letra-pequena");
    }

    fonteNormal(vetor, nomeUsuario, cargoUsuario, tituloConfig, txtCorFundo, txtTamanhoBtn) {
        vetor.forEach(opcao => {
            this.apagaClasse(opcao, "letra-pequena");
            this.apagaClasse(opcao, "letra-grande");
        });

        this.apagaClasse(nomeUsuario,"letra-grande");
        this.apagaClasse(cargoUsuario, "letra-grande");
        this.apagaClasse(nomeUsuario, "letra-pequena");
        this.apagaClasse(cargoUsuario, "letra-pequena");
        this.apagaClasse(tituloConfig, "letra-grande");
        this.apagaClasse(txtCorFundo, "letra-grande")
        this.apagaClasse(txtTamanhoBtn, "letra-grande")
        this.apagaClasse(tituloConfig, "letra-pequena");
        this.apagaClasse(txtCorFundo, "letra-pequena")
        this.apagaClasse(txtTamanhoBtn, "letra-pequena")
    }

    fonteGrande(vetor, nomeUsuario, cargoUsuario, tituloConfig, txtCorFundo, txtTamanhoBtn) {
        vetor.forEach(opcao => {
            this.apagaClasse(opcao, "letra-pequena")
            this.adicionaClasse(opcao, "letra-grande")
        });

        this.apagaClasse(nomeUsuario, "letra-pequena");
        this.apagaClasse(cargoUsuario, "letra-pequena");

        this.adicionaClasse(tituloConfig, "letra-grande");
        this.adicionaClasse(txtCorFundo, "letra-grande")
        this.adicionaClasse(txtTamanhoBtn, "letra-grande")


        this.adicionaClasse(nomeUsuario, "letra-grande");
        this.adicionaClasse(cargoUsuario, "letra-grande");
    }
}