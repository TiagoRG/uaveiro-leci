# Ex 2.1

## Atores

Neste diagrama existem 5 atores:

- Cliente (Web Customer) que pode ser um novo cliente (New Customer) ou um client registado (Registered Customer)
- Serviço de autenticação
- Fornecedor de identidade
- Serviço de pagamento por crédito
- PayPal

## Casos de Utilização

Neste diagrama existem 4 casos de utilização:

- Vizualizar items
- Fazer uma compra
- Efetuar um pagamento
- Registar um client

## Explicação do diagrama

O diagrama representa o sistema de uma loja online.

Neste caso, em vez de um diagrama de atividades, estamos perante um diagrama de casos de utilização. Ao contrário de um diagrama de atividades, aqui apenas são representadas as diversas fronteiras, entidades (os atores), as relações entre eles (de extensão e inclusão) e ainda os casos de utilização. Os atores são representados pelos bonecos e os casos de utilização representados pelas elipses.

Na esquerda podemos verificar que o Cliente é uma generalização do cliente registado e do novo cliente.

Cada um dos dois tipos de clientes está associado a dois casos de utilização:

- O cliente registado pode ver os items da loja e fazer uma compra
- O novo cliente pode, tal como o registado, ver os items mas em vez de fazer uma compra poderá se registar.

O caso de utilização de fazer uma compra inclui dois outros casos: ver os items e efetuar o pagamento. Ambos estes dois casos de utilização partilham de dois atores em comum: ambos estão associados ao fornecedor de identidade bem como ao serviço de autenticação. Este último está ainda associado ao caso do registo de cliente.

Podemos ainda ver no diagrama mais dois atores: o serviço de pagamento por crédito e o PayPal. Ambos estes atores estão associados ao pagamento.

Por último, verifica-se ainda a existência de uma fronteira que engloba os diversos casos de utilização da loja, representando os diversos serviços da mesma.