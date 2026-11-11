if (window.lucide) { lucide.createIcons(); }

let clientes = [
  { id: 1, nome: "João Silva", cpf: "123.456.789-00", endereco: "Rua Flores, 123" },
  { id: 2, nome: "Maria Oliveira", cpf: "987.654.321-11", endereco: "Av. Brasil, 456" },
  { id: 3, nome: "Carlos Souza", cpf: "456.789.123-22", endereco: "Rua das Palmeiras, 789" }
];

let selectedClientId = null;

function renderClientes(data = clientes) {
  const tbody = document.getElementById('clientes-table-body');
  tbody.innerHTML = '';

  if (data.length === 0) {
    tbody.innerHTML = `<tr><td colspan="3" style="text-align: center; color: #94a3b8;">Nenhum cliente encontrado</td></tr>`;
    return;
  }

  data.forEach(c => {
    const isSelected = selectedClientId === c.id;
    const tr = document.createElement('tr');
    if (isSelected) tr.classList.add('selected');
    tr.onclick = () => {
      selectedClientId = selectedClientId === c.id ? null : c.id;
      renderClientes();
    };
    tr.innerHTML = `<td>${c.nome}</td><td>${c.cpf}</td><td>${c.endereco}</td>`;
    tbody.appendChild(tr);
  });
}

function buscarCliente() {
  const query = document.getElementById('search-client-cpf').value.toLowerCase();
  const filtered = clientes.filter(c => c.cpf.toLowerCase().includes(query) || c.nome.toLowerCase().includes(query));
  renderClientes(filtered);
}

function salvarCliente() {
  const nome = document.getElementById('new-name').value;
  const cpf = document.getElementById('new-cpf').value;
  const endereco = document.getElementById('new-address').value;

  if (!nome || !cpf) {
    alert('Preencha pelo menos Nome e CPF.');
    return;
  }

  clientes.push({ id: Date.now(), nome, cpf, endereco });
  renderClientes();
  closeModal('modal-cadastrar');

  document.getElementById('new-name').value = '';
  document.getElementById('new-cpf').value = '';
  document.getElementById('new-address').value = '';
}

function removerCliente() {
  if (!selectedClientId) {
    alert('Selecione um cliente na tabela para remover.');
    return;
  }
  clientes = clientes.filter(c => c.id !== selectedClientId);
  selectedClientId = null;
  renderClientes();
}

function atualizarCliente() {
  if (!selectedClientId) {
    alert('Selecione um cliente na tabela para atualizar.');
    return;
  }
  const cliente = clientes.find(c => c.id === selectedClientId);
  const novoNome = prompt('Editar Nome:', cliente.nome);
  if (novoNome) {
    cliente.nome = novoNome;
    renderClientes();
  }
}

function openModal(id) { document.getElementById(id).classList.remove('hidden'); }
function closeModal(id) { document.getElementById(id).classList.add('hidden'); }

document.addEventListener('DOMContentLoaded', () => renderClientes());