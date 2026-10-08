class CarregarOpcoes extends HTMLElement{
    connectedCallback(){
        this.innerHTML = 
        `  <div class="col-2 colunaOpcoes">
            <header class="p-4 text-center">
                <div class="row">
                    <div class="col-2">
                        <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="rounded-circle" style="width: 70px;"
          alt="Avatar" />
                    </div>
                    <div class="col">
                        <h4>Nome Usuario</h4>
                        <h6>Documento</h6>

                    </div>

                </div>
            </header>

            <div class="linha">
                <p></p>
            </div>

            <nav>
                <div class="col space-between text-center p-4">
                    <div class="row">
                        <div class="col-6">
                            <div class="opcao p-5">
                            </div>
                            <h5 class="tipoOpcao">Realizar Venda</h5>
                        </div>
                        <div class="col-6">
                            <div class="opcao p-5">
                            </div>
                            <h5 class="tipoOpcao">Clientes</h5>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-6 ">
                            <div class="opcao p-5">
                            </div>
                            <h5 class="tipoOpcao">Estoque</h5>
                        </div>

                        <div class="col-6">
                            <div class="opcao p-5">
                            </div>
                            <h5 class="tipoOpcao">Histórico</h5>
                        </div>
                    </div>

                    <div class="row">
                        
                        <div class="col-6">
                            <div class="opcao p-5">
                            </div>
                            <h5 class="tipoOpcao">Configurações</h5>
                        </div>

                        <div class="col-6">
                            <div class="opcao p-5">
                            </div>
                            <h5 class="tipoOpcao">Área de Controle</h5>
                        </div>
                    </div>

                    <div class="row">
                        
                        <div class="col-6 ">
                            <div class="opcao p-5 ">
                            </div>
                            <h5 class="tipoOpcao">Sair</h5>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        </div>
        </div>`;
    }
}

customElements.define('carregar-opcoes', CarregarOpcoes);


// function carregarOpcoes() {

//     const opcoes = `
//         <div class="col-2 colunaOpcoes">
//             <header class="p-4 text-center">
//                 <div class="row">
//                     <div class="col-2">
//                         <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="rounded-circle" style="width: 70px;"
//           alt="Avatar" />
//                     </div>
//                     <div class="col">
//                         <h4>Nome Usuario</h4>
//                         <h6>Documento</h6>

//                     </div>

//                 </div>
//             </header>

//             <div class="linha">
//                 <p></p>
//             </div>

//             <nav>
//                 <div class="col space-between text-center p-4">
//                     <div class="row">
//                         <div class="col-6">
//                             <div class="opcao p-5 m-6">
//                             </div>
//                             <h5 class="tipoOpcao">Realizar Venda</h5>
//                         </div>
//                         <div class="col-6">
//                             <h2 class="opcao p-5 m-6">
//                             </h2>
//                             <h5 class="tipoOpcao">Clientes</h5>
//                         </div>
//                     </div>

//                     <div class="row">

//                         <div class="col-6 ">
//                             <h2 class="opcao m-6 p-5">
//                                 <h5 class="tipoOpcao">Estoque</h5>
//                             </h2>
//                         </div>

//                         <div class="col-6">
//                             <h2 class="opcao m-6 p-5">
//                                 <h5 class="tipoOpcao">Histórico</h5>
//                             </h2>
//                         </div>
//                     </div>

//                     <div class="row">
                        
//                         <div class="col-6">
//                             <h2 class="opcao m-6 p-5">
//                                 <h5 class="tipoOpcao">Configurações</h5>
//                             </h2>
//                         </div>

//                         <div class="col-6">
//                             <h2 class="opcao m-6 p-5">
//                                 <h5 class="tipoOpcao">Área de Controle</h5>
//                             </h2>
//                         </div>
//                     </div>

//                     <div class="row">
                        
//                         <div class="col-6 ">
//                             <h2 class="opcao m-6 p-5 ">
//                                 <h5 class="tipoOpcao">Sair</h5>
//                             </h2>
//                         </div>
//                     </div>
//                 </div>
//             </nav>
//         </div>
//         </div>
//         </div>
//     `;

//     document.body.insertAdjacentHTML('afterbegin', opcoes);
// }

// document.addEventListener("DOMContentLoaded", carregarOpcoes);