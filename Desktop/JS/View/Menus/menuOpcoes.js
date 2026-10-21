class CarregarOpcoes extends HTMLElement{
    connectedCallback(){
        this.innerHTML = `
        <aside class="coluna-lateral" id="ColunaOpcoes">
            <header class="cabecalho-usuario">
                <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="rounded-circle icon-usuario" alt="Foto de perfil" title="Sua foto de perfil"/>
                <div class="info-usuario">
                    <h2 class="nomeUsuario" id="nomeUsuario">Nome Usuario</h2>
                    <h6 class="cargoUsuario" id="usuarioCargo">Cargo</h6>
                </div>
            </header>

            <div class="linha">
            <p></p></div>

            <nav class="layout-opcoes" id="menuOpcoes">
                <div class="areaOpcao" >
                    <a href="#" class="quadrado-opcao" title="Botão que direciona para a página de realizar vendas" id="fundoRealizarVenda"></a>
                    <a href="#" id="realizarVenda" class="Opcao">Realizar Venda</a>
                </div>

                <div class="areaOpcao">
                    <a href="#" class="quadrado-opcao" title="Botão que direciona para a página de verificar clientes" id="fundoClientes"></a>
                    <a href="#" class="Opcao">Clientes</a>
                </div>

                <div class="areaOpcao">
                    <a href="#" class="quadrado-opcao" title="Botão que direciona para a página de verificar estoque" id="fundoEstoque"></a>
                    <a href="#" class="Opcao">Estoque</a>
                </div>

                <div class="areaOpcao">
                    <a href="#" class="quadrado-opcao" title="Botão que direciona para a página de verificar o histórico" id="fundoHistorico"></a>
                    <a href="#" class="Opcao">Histórico</a>
                </div>

                <div class="areaOpcao">
                    <a  class="quadrado-opcao" title="Botão que direciona para a página de configurações" id="fundoConfiguracoes"></a>
                    <a  id="Configuracoes" class="Opcao">Configurações</a>
                </div>

                <div class="areaOpcao">
                    <a href="#"  class="quadrado-opcao" title="Botão que direciona para a página de área de controle" id="fundoAreaControle"></a>
                    <a href="#" id="areaControle" class="Opcao">Área de Controle</a>
                </div>
            </nav>

            <div class="area-sair">
                <a href="#" class="quadrado-opcao" title="Botão que sai conta" id="fundoSair"></a>
                <a href="#" id="sair" class="Opcao">Sair</a>
            </div>
        </aside>`;
    }
}

customElements.define('carregar-opcoes', CarregarOpcoes);
