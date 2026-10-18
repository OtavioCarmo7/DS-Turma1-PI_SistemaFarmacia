const telaConfiguracoes = `
              <header class="header-configuracoes">
                    <h2 class="negrito">Configurações</h2>
                </header>

                <main class="opcoes-Configuracoes">
                    <h4>Cor de Fundo</h4>

                    <div class="form-field">
                        <div class="switch switch-padding theme-inverse" id="botaoFundoCor" style="--bs-switch-width: 25rem; --bs-switch-indicator-width: 2rem;  --bs-switch-padding: 0.10rem">
                        <input type="checkbox" value="" id="switchinverse" class="botaoFundo"  role="switch" switch checked>
                    </div>
                
                    <label for="switchinverse"></label>
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

