---
name: sdd-core-archive
description: Arquivamento enxuto de modulos (MOD_XX) e mudancas incrementais (docs/sdd/changes/<slug>/) concluidos em Spec-Driven Development (SDD), consolidando contratos vivos, deltas e schema SQLite no ARCHITECTURE.md e limpando o SDD_STATE.md. Use quando o usuario pedir para arquivar um modulo concluido, fechar uma change/SPEC, consolidar contratos ou limpar o SDD_STATE.
---

# SDD Core Archive

Consolida o conhecimento permanente de um modulo (MOD_XX) ou mudanca incremental (docs/sdd/changes/<slug>/) concluido, move artefatos temporarios para arquivo frio e enxuga o SDD_STATE.md.

## Quando Usar
- Quando todos os passos TDD de um modulo (MOD_XX.steps.md) ou de uma mudanca (docs/sdd/changes/<slug>/SPEC.md) estiverem concluidos e validados.
- Antes de iniciar o proximo modulo para manter o contexto ativo limpo.

## Fluxo de Arquivamento
1. **Extracao/Merge para ARCHITECTURE.md:**
   - Se for Modulo novo (MOD_XX.spec.md): adicione apenas a API publica final (interfaces, DTOs e eventos expostos a outros modulos) e o schema DDL [DB-DELTA] vigente.
   - Se for Delta Spec (docs/sdd/changes/<slug>/SPEC.md): aplique o delta ([ADDED] / [MODIFIED] / [REMOVED]) e eventuais alteracoes [DB-DELTA] diretamente nos contratos existentes do ARCHITECTURE.md, mantendo-o sempre atualizado como fonte unica da verdade.
   - Descarte passos intermediarios, referencias temporarias de legado e prosa.
2. **Arquivo Frio:**
   - Modulo: mova docs/sdd/MOD_XX.spec.md e docs/sdd/MOD_XX.steps.md para docs/archive/YYYY-MM-<MOD_XX>/.
   - Change: mova a pasta inteira docs/sdd/changes/<slug>/ para docs/archive/YYYY-MM-<slug>/.
3. **Compactacao do SDD_STATE.md:**
   - Substitua a linha ativa do modulo ou change por: - <MOD-XX ou slug>: [ARCHIVED -> docs/archive/YYYY-MM-<ID>/] e atualize o Proximo Passo.

## Regras de Economia de Tokens e Persistencia
- Nunca copie a SPEC inteira para ARCHITECTURE.md; registre apenas assinaturas publicas e schemas vigentes.
- **Gravacao Direta no Editor:** Em IDEs/CLIs com acesso a arquivos (Antigravity, Cursor, VS Code, Claude Code), execute diretamente a atualizacao de ARCHITECTURE.md e SDD_STATE.md e a movimentacao dos arquivos para docs/archive/.