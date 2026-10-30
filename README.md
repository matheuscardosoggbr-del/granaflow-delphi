# GranaFlow em Delphi

Sistema de controle financeiro desenvolvido em Delphi VCL com FireDAC e MySQL.

## Funcionalidades

- Cadastro e login de usuários;
- Cadastro, edição, exclusão e listagem de gastos;
- Cadastro, edição, exclusão e listagem de receitas;
- Cadastro de categorias;
- Cadastro de metas;
- Painel com receitas, gastos e saldo;
- Relatório financeiro resumido;
- Encerramento da sessão do usuário.

## Como executar

1. Abra `Granaflow.dproj` no Delphi.
2. Verifique se o MySQL está executando na porta `3307`.
3. Confira a conexão no `UnitDMDB.dfm`.
4. Confirme que o banco se chama `granaflow`.
5. Compile com **Run > Run**.

## Estrutura do projeto

- `Granaflow.dpr`: inicia o programa e cria as telas.
- `UnitDMDB`: concentra a conexão e os componentes de acesso ao banco.
- `UnitLogin`: login e abertura do sistema.
- `UnitCadastro`: criação de usuários.
- `UnitPrincipal`: tela principal e botões de navegação.
- `UnitGastos`: controle de gastos.
- `UnitReceitas`: controle de receitas.
- `UnitCategorias`: controle de categorias.
- `UnitMetas`: controle de metas.
- `UnitPainel`: resumo financeiro.
- `UnitRelatorios`: relatório resumido.

## Conceitos usados

O projeto usa `TFDTable` para acessar tabelas, `TDataSource` para ligar os dados aos componentes visuais e `TDBGrid`/`TDBEdit` para exibir e editar os registros.

O campo `UsuarioLogadoId` identifica o usuário atual. Os módulos de gastos, receitas e metas usam esse valor para mostrar somente os dados do usuário conectado.

## Observação

As tabelas do banco precisam usar os nomes esperados pelo sistema: `usuarios`, `gastos`, `receitas`, `categorias` e `metas`. Os campos principais usados pelo código estão descritos nos próprios componentes e consultas de cada unidade.
