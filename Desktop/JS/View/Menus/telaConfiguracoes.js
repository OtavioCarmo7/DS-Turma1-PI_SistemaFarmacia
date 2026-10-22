const telaConfiguracoes = `
              <header class="header-configuracoes">
                    <h2 class="negrito" id="tituloConfig">Configurações</h2>
                </header>

                <main class="opcoes-Configuracoes" id="opcoes-Config">
                    <h4 class="" id="corFundo">Cor de Fundo</h4>

                    <div class="form-field">
                        <div class="switch switch-padding theme-inverse" id="botaoFundoCor" style="--bs-switch-width: 25rem; --bs-switch-indicator-width: 2rem;  --bs-switch-padding: 0.10rem">
                        <input type="checkbox" value="" id="switchinverse" class="botaoFundo"  role="switch" switch checked>
                        </div>
                    </div>

                    <h4 class="" id="tamanhoBtn">Tamanho de Texto</h4>

                    <div class="botoes-tamanho">
                        <button type="button" class="btn-outline theme-accent" id="btnPequeno">Pequena</button>

                        <button type="button" class="btn-outline theme-success" id="btnNormal">Normal</button>

                        <button type="button" class="btn-outline theme-danger" id="btnGrande">Grande</button>
                    </div>


                </main>
        `

function renderizarConfiguracoes(){

    document.addEventListener("click", function (event) {
    
        const botaoConfiguracoes = event.target.closest("#fundoConfiguracoes");
    
        if (botaoConfiguracoes) {
            event.preventDefault()
            renderizarElementos(telaConfiguracoes)
        }
    });
}

renderizarConfiguracoes()

