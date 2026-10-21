document.addEventListener("click", (event) => {
    const tamanhoTexto = new TamanhoTexto();
    const mudaTamanho = new MudaTamanho();

    const vetorMenuOpcoes = tamanhoTexto.getMenuOpcoes();

    const nomeUsuario = tamanhoTexto.getNomeUsu(); 
    
    const cargoUsuario = tamanhoTexto.getCargoUsu();

    const tituloConfig = tamanhoTexto.getTituloConfig();
    
    const txtCorFundo = tamanhoTexto.getTxtCorFundo();
    
    const txtTamanhoBtn = tamanhoTexto.getTxtTamanhoBtn();

    const botaoPequeno = event.target.closest("#btnPequeno");
    const botaoPadrao = event.target.closest("#btnNormal");
    const botaoGrande = event.target.closest("#btnGrande");

    if (botaoPequeno) {

        mudaTamanho.fontePequena(vetorMenuOpcoes, nomeUsuario, cargoUsuario, tituloConfig, txtCorFundo, txtTamanhoBtn);
        // vetorMenuOpcoes.forEach(opcao => {
        //     mudaClasse.apagaClasse(opcao, "letra-grande");
        //     mudaClasse.adicionaClasse(opcao, "letra-pequena");

        //     // opcao.classList.remove("letra-grande")
        //     // opcao.classList.add("letra-pequena")
        // });


        // mudaClasse.apagaClasse(nomeUsuario, "letra-grande");
        // mudaClasse.apagaClasse(cargoUsuario, "letra-grande");

        // mudaClasse.apagaClasse(tituloConfig,"letra-grande");
        // mudaClasse.apagaClasse(txtCorFundo, "letra-grande")
        // mudaClasse.apagaClasse(txtTamanhoBtn, "letra-grande")

        // mudaClasse.adicionaClasse(nomeUsuario, "letra-pequena");
        // mudaClasse.adicionaClasse(cargoUsuario, "letra-pequena");

        // mudaClasse.adicionaClasse(tituloConfig, "letra-pequena");
        // mudaClasse.adicionaClasse(txtCorFundo, "letra-pequena");
        // mudaClasse.adicionaClasse(txtTamanhoBtn, "letra-pequena");
    }

    else if (botaoPadrao) {
        
        mudaTamanho.fonteNormal(vetorMenuOpcoes, nomeUsuario, cargoUsuario, tituloConfig, txtCorFundo, txtTamanhoBtn);
        // vetorTextosOpcoes.forEach(opcao => {
        //     opcao.classList.remove("letra-pequena");
        //     opcao.classList.remove("letra-grande");
        // });

        // nomeUsuario.classList.remove("letra-grande");
        // cargoUsuario.classList.remove("letra-grande");

        // nomeUsuario.classList.remove("letra-pequena");
        // cargoUsuario.classList.remove("letra-pequena");

        // tituloConfig.classList.remove("letra-grande");
        // txtCorFundo.classList.remove("letra-grande")
        // txtTamanhoBtn.classList.remove("letra-grande")

        // tituloConfig.classList.remove("letra-pequena");
        // txtCorFundo.classList.remove("letra-pequena")
        // txtTamanhoBtn.classList.remove("letra-pequena")

    }

    if (botaoGrande) {

        mudaTamanho.fonteGrande(vetorMenuOpcoes, nomeUsuario, cargoUsuario, tituloConfig, txtCorFundo, txtTamanhoBtn);

        // vetorTextosOpcoes.forEach(opcao => {
        //     opcao.classList.remove("letra-pequena")
        //     opcao.classList.add("letra-grande")
        // });

        // nomeUsuario.classList.remove("letra-pequena");
        // cargoUsuario.classList.remove("letra-pequena");

        // tituloConfig.classList.add("letra-grande");
        // txtCorFundo.classList.add("letra-grande")
        // txtTamanhoBtn.classList.add("letra-grande")


        // nomeUsuario.classList.add("letra-grande");
        // cargoUsuario.classList.add("letra-grande");

    }
});

