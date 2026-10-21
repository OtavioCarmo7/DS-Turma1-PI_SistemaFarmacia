class TamanhoTexto {

    constructor() {
        this.__vetorMenus = document.querySelectorAll(".Opcao");
        this.__nomeUsuario = document.getElementById("nomeUsuario");
        this.__cargoUsuario = document.getElementById("usuarioCargo");
        this.__tituloConfig = document.getElementById("tituloConfig");
        this.__txtCorFundo = document.getElementById("corFundo");
        this.__txtTamanhoBtn = document.getElementById("tamanhoBtn");

    }

    getMenuOpcoes() {
        return this.__vetorMenus;
    }
    getNomeUsu() {
        return this.__nomeUsuario;
    }
    getCargoUsu() {
        return this.__cargoUsuario;
    }
    getTituloConfig() {
        return this.__tituloConfig;
    }
    getTxtCorFundo() {
        return this.__txtCorFundo;
    }
    getTxtTamanhoBtn() {
        return this.__txtTamanhoBtn;
    }
}