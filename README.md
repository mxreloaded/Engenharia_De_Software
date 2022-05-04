# Carrinho de Contas - UFRPE - 2021.1
  
## Gerenciador de despesas com compras em supermercado.

**Descrição**: Joana relatou que possui problemas para gerenciar e calcular o valor final das compras  realizadas em supermercado, por isso ela solicitou esse módulo de forma que ela pudesse a  medida que fosse colocando as compras no carrinho ela pudesse adicionar os itens e ao final  poder calcular o total da compra. Existe a possibilidade de um produto ter um valor diferenciado  a partir de uma quantidade X de produtos. Ela também deseja que outros membros da família  possam adicionar itens em uma lista de compras compartilhada. Ela deseja ter um relatório com  as despesas por categoria de produto e anual. 

<details>
  <summary>Comandos utilizados</summary>

  1. Criar o projeto:
   ```rails new cdc --api --database=postgresql``` 
  1. Criar o banco de dados:
    ```rails db:create```
  1. Criar migração dos usuários:
    ```rails g migration CreateUsers name:string password_digest:string email:string```
  1. Atualizar schema com as migrações pendentes:
    ```rails db:migrate```
</details>
  
<details>
  <summary>Configurações do projeto </summary>
* Ruby version 2.7.3
* Rails + Postgresql
</details>
