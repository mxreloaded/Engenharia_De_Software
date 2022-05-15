# Carrinho de Contas - UFRPE - 2021.1

## Gerenciador de despesas com compras em supermercado.

**Descrição**: Joana relatou que possui problemas para gerenciar e calcular o valor final das compras realizadas em supermercado, por isso ela solicitou esse módulo de forma que ela pudesse a medida que fosse colocando as compras no carrinho ela pudesse adicionar os itens e ao final poder calcular o total da compra. Existe a possibilidade de um produto ter um valor diferenciado a partir de uma quantidade X de produtos. Ela também deseja que outros membros da família possam adicionar itens em uma lista de compras compartilhada. Ela deseja ter um relatório com as despesas por categoria de produto e anual.

<details>
  <summary>Comandos utilizados</summary>

1. Criar o projeto:
   `rails new cdc --api --database=postgresql`
1. Criar o banco de dados:
   `rails db:create`
1. Criar migração dos usuários:
   `rails g migration CreateUsers name:string password_digest:string email:string`
1. Atualizar schema com as migrações pendentes:
   `rails db:migrate`

</details>

<br />
  
<details>
  <summary>Configurações do projeto </summary>
  
  * Ruby version 2.7.3
  
  * Rails + Postgresql
  
</details>

<br />

<details>
  <summary>Detalhes da API</summary>
  
  <details>
    <summary>(API) Usuários</summary>
    <li>Criar uma conta</li>
      - (POST) /api/v1/users - enviando um json com name, email, password
      - Apenas a criação de uma conta e o login podem ser feitos sem enviar no header "Authorization"
    <li>Fazer login</li>
      - (POST) /api/v1/auth/login - enviando um json com email e email
      - Apenas a criação de uma conta e o login podem ser feitos sem enviar no header "Authorization"
    <li>Atualizar uma conta</li>
      - (PUT) /api/v1/users/:user_id - enviando um json com name ou email
      - Obrigatório enviar a senha da conta que vai ser atualizada
    <li>Deletar uma conta</li>
      - (DELETE) /api/v1/users/:user_id
    <li>Visualizar uma conta</li>
      - (GET) /api/v1/users/:user_id
      - Se o Authorization for da conta em que está sendo buscado traz com informações mais detalhadas
  </details>

  <details>
    <summary>(API) Categorias</summary>
    <li>Listar categorias</li>
      - (GET) /api/v1/categories
      - As categorias que são aqui listadas foram criadas pelo console (pelo admin) e não possuem rota de criação
  </details>

  <details>
    <summary>(API) Carrinho</summary>
   <li>Criar carrinho</li>
      - (POST) /api/v1/shopcarts - enviando: o nome (opcional)
    <li>Visualizar um carrinho</li>
      - (GET) /api/v1/shopcarts/:shopcart_id
      - O objeto carrinho vai trazer os produtos, usuários, e as categorias dos produtos do carrinho
      - O produto traz a quantidade que é armazenada em uma coluna da tabela products_shopcarts, ler sessão "Produtos-Carrinho"
    <li>Visualizar carrinhos</li>
      - (GET) /api/v1/shopcarts
      - Essa rota trás apenas os carrinhos do usuário que fez a requisição
      - O objeto carrinho vai trazer os produtos, usuários, e as categorias dos produtos do carrinho
      - O produto traz a quantidade que é armazenada em uma coluna da tabela products_shopcarts, ler sessão "Produtos-Carrinho"
    <li>Editar carrinho</li>
      - (PUT) /api/v1/shopcarts/:shopcart_id - enviando: o nome; ou user_ids aqui sendo o novo array de ids de usuários que pertencem a esse carrinho (cuidado com o valor desse parâmetro); de maneira similiar pode ser trabalhado os produtos aos user_ids podem ser enviados os product_ids porém ver a sessão de "Produtos-Carrinho" para ver a maneira oficial de se adicionar
  </details>

  <details>
    <summary>(API) Produtos</summary>
    <li>Criar produto</li>
      - (POST) /api/v1/shopcarts - enviando: o nome, preço, category_id
      - Um produto guarda o id do usuário que o criou
    <li>Listar produtos</li>
      - (GET) /api/v1/shopcarts
  </details>

  <details>
    <summary>(API) Produtos-Carrinho</summary>
    <li>Adicionar um produto em um carrinho</li>
      - (POST) /api/v1/products_shopcarts - enviando: shopcart_id, product_id, quantity
    <li>Atualizar a quantidade, preço promocional, quantidade promocional</li>
      - (PUT) /api/v1/products_shopcarts/:product_shopcart_id - enviando: quantity, promo_quantity e/ou promo_value
  </details>
</details>
