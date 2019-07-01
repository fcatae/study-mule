Criar uma API:

1. Criar o recurso `/accounts`
2. Definir o método `GET /acccounts`
3. Adicionar os parâmetros `type`, `name` e `country`
4. Criar uma enumeração para `type`: [personal, business]
5. Criar um tipo específico `Account`
6. Criar um método `POST /accounts` (passando `Account[]`)
7. Criar o retorno 201 para POST, junto com 400 para ambos os métodos
8. Configurar um trait para adicionar o header `Requester-ID`
9. Aplicar o trait no recurso `/accounts`

Ref:
https://github.com/raml-org/raml-spec/blob/master/versions/raml-10/raml-10.md
