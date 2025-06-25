# 🧾 VBFormatters

Um pequeno utilitário com dois formatadores de texto (`TextInputFormatter`) para Flutter:

- 💸 `moneyInputFormatter`: formata valores monetários no formato brasileiro (`pt_BR`)
- 📞 `phoneInputFormatter`: formata números de telefone no padrão brasileiro `(99) 99999-9999`

## 📦 Instalação

Adicione no seu `pubspec.yaml`:

```yaml
dependencies:
  intl: ^0.18.0
```

# ✨ Uso

💰 Formatação de Moeda

```bash
TextFormField(
  inputFormatters: [moneyInputFormatter()],
  keyboardType: TextInputType.number,
  decoration: InputDecoration(labelText: 'Valor'),
)
```
Exemplo de entrada:
1234 → R$ 12,34

📱 Formatação de Telefone
```bash
TextFormField(
  inputFormatters: [phoneInputFormatter()],
  keyboardType: TextInputType.phone,
  decoration: InputDecoration(labelText: 'Telefone'),
)
```
Exemplo de entrada:
11987654321 → (11) 98765-4321
