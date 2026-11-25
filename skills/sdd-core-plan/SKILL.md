---
name: sdd-core-plan
description: Planejamento tecnico enxuto baseado em contratos tipados, Delta Specs (ADDED/MODIFIED/REMOVED), DB-DELTA e extracao de legado (LEGACY-SOURCE) em docs/sdd/changes/<slug>/SPEC.md, livre de modelo e otimizado para economia de tokens. Use quando o usuario pedir para planejar uma feature, tarefa tecnica, correcao, mudanca incremental ou refatoracao.
---

# SDD Core Plan

Cria especificacoes tecnicas ultra-compactas (docs/sdd/changes/<slug>/SPEC.md, limite de 120 linhas) baseadas em contratos tipados, Delta Specs, DB-DELTA e extracao de legado, prontas para execucao TDD em qualquer modelo.

## Passo 0: Entrevista Rapida (Quando a Mudanca Vier Vaga)
- Se o usuario descrever a feature, bug ou refatoracao de forma generica sem especificar arquivos alvo, impacto em assinaturas existentes ou casos de borda, faca no maximo 3 perguntas curtas e numeradas antes de gerar a SPEC.
- Se a mudanca ja estiver objetiva, gere e grave o arquivo diretamente.

## Estrutura Obrigatoria (docs/sdd/changes/<slug>/SPEC.md)
1. **Escopo & Arquivos Alvo (max. 8 linhas):**
   - Objetivo em 1 frase, o que fica fora de escopo e caminhos exatos dos arquivos (codigo + teste TDD).
2. **[LEGACY-SOURCE] Origem no Legado (Opcional — usar ao desacoplar codigo antigo):**
   - Arquivo(s) e metodo(s) de origem no legado (ex.: LinhaMax 6.1) + casos Golden Master (entradas reais -> saidas exatas) para garantir zero regressao.
3. **Delta de Contratos & Assinaturas (ADDED / MODIFIED / REMOVED):**
   - **[ADDED]:** Novos metodos, propriedades, DTOs ou regras.
   - **[MODIFIED]:** Assinaturas ou comportamentos alterados (Antes -> Depois).
   - **[REMOVED]:** Metodos, parametros ou regras obsoletas a remover.
4. **[DB-DELTA] Migracao de Banco (Quando houver alteracao em SQLite/SQL):**
   - Comandos DDL exatos (CREATE TABLE / ALTER TABLE / CREATE INDEX) e impacto em queries Dapper. Se nao houver, escreva: N/A.
5. **Regras & Casos de Borda:**
   - Bullets curtos no formato SE <condicao> ENTAO <acao/erro> (cada linha virara um Assert no TDD).
6. **Criterios de Aceite & Validacao:**
   - Comando exato de teste/build e assercoes objetivas.

## Regras de Economia de Tokens e Persistencia
- Substitua texto descritivo por assinaturas tipadas e deltas diretos.
- Se a mudanca exigir mais de 4 arquivos (incluindo testes), divida a saida em blocos Context Slice (com par Codigo + Teste TDD) prontos para execucao individual com sdd-core-exec.
- **Gravacao Direta no Editor:** Sempre que estiver em uma IDE ou CLI com acesso a arquivos (Antigravity, Cursor, VS Code, Claude Code), crie a pasta e grave o resultado diretamente em docs/sdd/changes/<slug>/SPEC.md.