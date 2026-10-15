class MenuAcoes extends HTMLElement{
    connectedCallback(){
        this.innerHTML = 
        `  <div class="fundoOperacao
            textoCentro min-vh-100">
                Oi
            </div>
        </div>`;
    }
}

customElements.define('carregar-acoes', MenuAcoes);