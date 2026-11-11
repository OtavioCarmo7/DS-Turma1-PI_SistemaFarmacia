if (window.lucide) { lucide.createIcons(); }

let historicos = [
  { valor: "R$ 150,00", cpf: "123.456.789-00", relatorio: "Venda de Medicamentos" },
  { valor: "R$ 89,90", cpf: "987.654.321-11", relatorio: "Produtos de Higiene" },
  { valor: "R$ 230,50", cpf: "456.789.123-22", relatorio: "Cosméticos Variados" }
];

function renderHistorico(data = historicos) {
  const tbody = document.getElementById('historico-table-body');
  tbody.innerHTML = '';

  if (data.length === 0) {
    tbody.innerHTML = `<tr><td colspan="3" style="text-align: center; color: #94a3b8;">Nenhum registro encontrado</td></tr>`;
    return;
  }

  data.forEach(h => {
    const tr = document.createElement('tr');
    tr.innerHTML = `<td><strong>${h.valor}</strong></td><td>${h.cpf}</td><td>${h.relatorio}</td>`;
    tbody.appendChild(tr);
  });
}

function buscarHistorico() {
  const cpf = document.getElementById('filter-cpf').value.toLowerCase();
  const endereco = document.getElementById('filter-address').value.toLowerCase();
  
  const filtered = historicos.filter(h => {
    return h.cpf.toLowerCase().includes(cpf);
  });
  
  renderHistorico(filtered);
}

document.addEventListener('DOMContentLoaded', () => renderHistorico());