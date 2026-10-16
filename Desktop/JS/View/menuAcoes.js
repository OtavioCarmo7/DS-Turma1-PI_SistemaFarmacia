class MenuAcoes extends HTMLElement{
    connectedCallback(){
        this.innerHTML = 
        `  <div class="coluna-principal" id="colunaAcoes">
                Oi 
                <br>
                asjdoasjdoai
                <br> 
            </div>
        </div>`;
    }
}

customElements.define('carregar-acoes', MenuAcoes);