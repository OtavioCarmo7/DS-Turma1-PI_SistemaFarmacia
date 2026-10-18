const body = document.getElementById("body")

const html = document.getElementById("html")

const menuOpcoes = document.getElementById("ColunaOpcoes");

const menuAcoes = document.getElementById("colunaAcoes")

const paginaPrincipal = document.getElementById("paginaPrincipal");

const botaoRealizarVenda = document.getElementById("fundoRealizarVenda");
const botaoClientes = document.getElementById("fundoClientes");
const botaoEstoque = document.getElementById("fundoEstoque");
const botaoHistorico = document.getElementById("fundoHistorico");
const botaoConfiguracoes = document.getElementById("fundoConfiguracoes");
const botaoAreaControle = document.getElementById("fundoAreaControle");
const botaoSair = document.getElementById("fundoSair");


function trocaCor(){
    

    document.addEventListener("click", (event)=> {

    const botao = event.target.closest("#botaoFundoCor");

        if (botao) {
    
            html.classList.toggle("fundo-escuro")
    
            paginaPrincipal.classList.toggle("pagina-principal-escuro")
    
            menuOpcoes.classList.toggle("coluna-lateral-escuro")
    
            menuAcoes.classList.toggle("coluna-principal-escuro")
    
            botaoRealizarVenda.classList.toggle("quadrado-opcaoEscuro");
            botaoClientes.classList.toggle("quadrado-opcaoEscuro");
            botaoEstoque.classList.toggle("quadrado-opcaoEscuro");
            botaoHistorico.classList.toggle("quadrado-opcaoEscuro");
            botaoConfiguracoes.classList.toggle("quadrado-opcaoEscuro");
            botaoAreaControle.classList.toggle("quadrado-opcaoEscuro");
            botaoSair.classList.toggle("quadrado-opcaoEscuro");
    
        }
    }
)}

trocaCor();






