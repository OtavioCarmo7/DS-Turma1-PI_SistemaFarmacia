class CarregarOpcoes extends HTMLElement{
    connectedCallback(){
        this.innerHTML = `
        <aside class="coluna-lateral">
            <header class="cabecalho-usuario">
                <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="rounded-circle icon-usuario" alt="Avatar" />
                <div class="info-usuario">
                    <h2 class="nomeUsuario">Nome Usuario</h2>
                    <h6 class="cargoUsuario">Cargo</h6>
                </div>
            </header>

            <div class="linha">
            <p></p></div>

            <nav class="layout-principal">
                <div class="areaOpcao">
                    <div class="quadrado-opcao"></div>
                    <a href="#" id="realizarVenda">Realizar Venda</a>
                </div>

                <div class="areaOpcao">
                    <div class="quadrado-opcao"></div>
                    <a href="#" class="tipoOpcaoDireita">Clientes</a>
                </div>

                <div class="areaOpcao">
                    <div class="quadrado-opcao"></div>
                    <a href="#" class="tipoOpcaoEsquerda">Estoque</a>
                </div>

                <div class="areaOpcao">
                    <div class="quadrado-opcao"></div>
                    <a href="#" class="tipoOpcaoDireita">Histórico</a>
                </div>

                <div class="areaOpcao">
                    <div class="quadrado-opcao"></div>
                    <a href="#" id="Configuracoes">Configurações</a>
                </div>

                <div class="areaOpcao">
                    <div class="quadrado-opcao"></div>
                    <a href="#" id="areaControle">Área de Controle</a>
                </div>
            </nav>

            <div class="area-sair">
                <div class="quadrado-opcao" style="width: 4rem; height: 4rem;"></div>
                <a href="#" id="sair">Sair</a>
            </div>
        </aside>`;
    }
}

customElements.define('carregar-opcoes', CarregarOpcoes);