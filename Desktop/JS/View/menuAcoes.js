class MenuAcoes extends HTMLElement {
    connectedCallback() {
        this.innerHTML =
            `<div class="coluna-principal" id="colunaAcoes">
                
              
            </div>`;
    }
}



customElements.define('carregar-acoes', MenuAcoes);