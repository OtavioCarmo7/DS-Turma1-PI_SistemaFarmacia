const telaConfiguracoes = `
              <header class="header-configuracoes">
                    <h2 class="negrito ">Configurações</h2>
                </header>

                <main class="opcoes-Configuracoes">
                    <h4 class="">Cor de Fundo</h4>

                    <div class="form-field">
                        <div class="switch switch-padding theme-inverse" id="botaoFundoCor" style="--bs-switch-width: 25rem; --bs-switch-indicator-width: 2rem;  --bs-switch-padding: 0.10rem">
                        <input type="checkbox" value="" id="switchinverse" class="botaoFundo"  role="switch" switch checked>
                        </div>
                    </div>

                    <h4 class="">Tamanho de Texto</h4>

                    <div class="botoes-tamanho">
                        <button type="button" class="btn-outline theme-accent">Pequena</button>

                        <button type="button" class="btn-outline theme-success">Normal</button>

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

