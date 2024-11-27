# U5411 - Sistemas de Gestão de Bases de Dados

## Ficha 1

**Criar a Base de Dados Airport**:

- Projetar e implementar a base de dados `Airport` com base no modelo fornecido no PDF.

**Criar a Base de Dados Salmon River**:

- Desenvolver uma base de dados para rios com salmão do atlântico `SalmonRiver` seguindo o modelo especificado no PDF.

## Ficha 2

**Criação de Utilizadores e Permissões**:

- Criar um utilizador à sua escolha e atribuir-lhe as mesmas permissões do utilizador root.
- Criar os seguintes utilizadores: `tmpAir`, `usrAir`, e `admAir`.
- Atribuir permissões:
  - `tmpAir`: Acesso de leitura a todas as tabelas da base de dados Airport.
  - `usrAir`: Acesso de leitura a todas as tabelas e acesso de escrita (inserção e atualização) na tabela `airport`.
  - `admAir`: Permissões totais sobre a base de dados Airport.
- Retirar todas as permissões ao utilizador `tmpAir`.

## Ficha 3

**Importação de Dados**:

- Importar dados do ficheiro `AtlanticSalmonRiver.csv` (campos: Country, Rivername, Category, Location) e preencher as tabelas da base de dados SalmonRiver.

## Ficha 4

**Exportação de Dados**:

- Exportar a tabela `Country` para um ficheiro CSV.
- Exportar os nomes dos rios localizados na Noruega para um ficheiro CSV.
- Criar um backup da base de dados SalmonRiver.
- Criar três backups, um para cada tabela da base de dados SalmonRiver.

## Ficha 5

**Criar Views**:

- Criar uma VIEW que liste os aeroportos da Península Ibérica (campos: airport, city, IATA_FAA, ICAO).
- Exportar a VIEW criada para um ficheiro CSV.
- Criar um backup da base de dados Airports.

## Ficha 6

**Gestão da Base de Dados WorldPort**:

- Construir um modelo de dados apropriado para o ficheiro `WorldPort.csv` (campos: Port, Region, CountryCode, Country) e importar os dados.
- Criar utilizadores: `tmpPort`, `usrPort`, e `admPort`.
- Atribuir permissões:
  - `tmpPort`: Acesso de leitura a todas as tabelas da base de dados WorldPort.
  - `usrPort`: Acesso de leitura a todas as tabelas e acesso de escrita na tabela `Port`.
  - `admPort`: Permissões totais sobre a base de dados WorldPort.
- Retirar todas as permissões ao utilizador `tmpPort`.
- Criar uma VIEW chamada `PortugalPort` que liste os portos de Portugal (campos: Port, Region, CountryCode, Country).
- Exportar a VIEW criada para um ficheiro.
- Criar um backup da base de dados WorldPort.

## Teste de Avaliação

**Gestão da Base de Dados Airlines**:

- Construir um modelo de dados adequado para o ficheiro `airline.csv` fornecido.
- Importar dados do ficheiro `airline.csv` para as tabelas criadas.
- Criar utilizadores: `tmpAirl`, `usrAirl`, e `admAirl`.
- Atribuir permissões:
  - `tmpAirl`: Acesso de leitura a todas as tabelas.
  - `usrAirl`: Acesso de leitura, inserção e atualização a todas as tabelas.
  - `admAirl`: Permissões totais.
- Retirar todas as permissões ao utilizador `tmpAirl`.
- Criar Views para Airlines para os seguintes países: Portugal e Espanha.
- Exportar as Views criadas para ficheiros CSV.
- Criar um backup da nova base de dados criada.
