---
name: sdd-core-module-plan
description: Especificacao tecnica ultra-enxuta baseada em contratos tipados de um modulo isolado (MOD_XX.spec.md) em Spec-Driven Development (SDD), livre de modelo e otimizado para economia de tokens. Use quando o usuario pedir para planejar um modulo, biblioteca, componente, servico ou plugin especifico e gerar um MOD_XX.spec.md / MODULE_SPEC.md.
---

# SDD Core Module Plan

Especifica um modulo isolado (MOD_XX.spec.md, limite de 150 linhas) usando contratos tipados reais da linguagem e DDL SQLite exato em vez de prosa longa.

## Passo 0: Entrevista Rapida (Quando Houver Ambiguidade)
- Se o usuario pedir para planejar um modulo sem detalhar regras de calculo, validacoes ou limites, faca no maximo 4 perguntas diretas e numeradas antes de gerar o arquivo.
- Se os dados ja estiverem claros no APP_MAP.md ou no prompt do usuario, pule as perguntas e gere o arquivo direto.

## Estrutura Obrigatoria (MOD_XX.spec.md)
1. **Fronteira & Dependencias (max. 8 linhas):** Responsabilidade unica, o que fica fora e interfaces externas consumidas (DI).
2. **Contratos Tipados:** Assinaturas reais (C#, TypeScript, etc.) de interfaces, DTOs, eventos e erros.
3. **[DB-DELTA] Persistencia (Quando houver banco):** DDL SQLite exato (CREATE TABLE / CREATE INDEX, PK TEXT GUID, WAL) e queries Dapper criticas. Se nao houver persistencia, escreva: N/A.
4. **Arvore de Arquivos do Modulo (Clean Architecture):** Caminhos exatos respeitando a dependencia unidirecional: Domain (zero dependencias externas) <- Application (apenas Domain) <- Infrastructure / Presentation (implementam interfaces de Application/Domain).
5. **Regras de Negocio & Casos de Borda:** Bullets curtos no formato SE <condicao> ENTAO <resultado>.
6. **Criterios de Aceite & Testes Obrigatorios:** Cenarios verificaveis (entrada -> saida esperada).

## Regras de Economia de Tokens e Persistencia
- Substitua paragrafos descritivos por assinaturas tipadas e condicoes diretas.
- Nao repita contratos globais do APP_MAP.md; apenas referencie os tipos importados.
- **Gravacao Direta no Editor:** Em IDEs/CLIs com acesso a arquivos (Antigravity, Cursor, VS Code, Claude Code), grave diretamente em docs/sdd/MOD_XX.spec.md.