---
name: sdd-core-module-steps
description: Quebra de um MOD_XX.spec.md em micro-passos autocontidos com Context Slice e par TDD (implementacao + teste) em Spec-Driven Development (SDD), livre de modelo e otimizada para gastar o minimo de tokens na execucao. Use quando o usuario pedir para planejar os passos de um modulo, quebrar um MODULE_SPEC em tarefas ou gerar MOD_XX.steps.md / MODULE_STEPS.md.
---

# SDD Core Module Steps

Converte MOD_XX.spec.md em micro-passos atomicos (MOD_XX.steps.md), onde cada passo ja embute o recorte minimo de contratos (Context Slice) e o arquivo de teste unitario correspondente para execucao TDD com sdd-core-exec.

## Quando Usar
- Apos concluir MOD_XX.spec.md com sdd-core-module-plan.
- Sempre que for preparar tarefas para execucao economica de codigo.

## Ordem Padrao de Micro-Passos (Par TDD por Passo)
1. M01: Estrutura base + Contratos/DTOs/Interfaces publicas (declarativo; dispensa teste dedicado se nao houver logica).
2. M02: Dominio puro, validadores e regras de negocio centrais + Testes unitarios de dominio.
3. M03: Persistencia/Infraestrutura/Adapters (aplicando [DB-DELTA] SQLite/Dapper) + Testes de integracao/repositorio.
4. M04: Camada de exposicao (Comandos CAD, ViewModels/UI, Controllers ou CLI) + Testes de apresentacao/fluxo.
5. M05: Smoke test ponta a ponta do modulo cobrindo os criterios de aceite da SPEC.

## Formato Obrigatorio de Cada Passo (max. 65 linhas/passo)
- **Passo M0X:** Titulo curto
- **Arquivos (Codigo):** Lista de 1 a 3 arquivos de implementacao
- **Arquivo (Teste TDD):** Caminho exato do arquivo de teste unitario correspondente (ou N/A apenas no M01 puramente declarativo)
- **Context Slice (Contratos, DDL & Regras):** Apenas assinaturas, DDL [DB-DELTA] e regras exatas (SE ... ENTAO) que este par de arquivos implementa ou consome. Zero contexto global.
- **Validacao:** Comando exato de build multi-target e teste (ex.: dotnet test --filter <ClasseTeste>)
- **Prompt de Execucao:** Use sdd-core-exec para implementar o Passo M0X acima.

## Regras de Economia de Tokens e Persistencia
- O agente executor NUNCA deve precisar ler o APP_MAP.md nem o MOD_XX.spec.md completo; tudo que ele precisa deve caber dentro do Context Slice do passo.
- Cada passo deve tocar no maximo 4 arquivos no total (implementacao + teste).
- **Gravacao Direta no Editor:** Em IDEs/CLIs com acesso a arquivos (Antigravity, Cursor, VS Code, Claude Code), grave diretamente em docs/sdd/MOD_XX.steps.md.