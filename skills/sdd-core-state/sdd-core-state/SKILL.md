---
name: sdd-core-state
description: Gerencia o estado minimo de progresso do Spec-Driven Development (SDD_STATE.md) entre sessoes de trabalho, suportando modulos (MOD_XX) e mudancas incrementais (docs/sdd/changes/<slug>/) com estados claros ([spec], [exec-ok], [archived]), livre de modelo e otimizado para economia de tokens. Use quando o usuario pedir para iniciar, atualizar, consultar ou retomar o status/progresso de um projeto, modulo ou change SDD.
---

# SDD Core State

Mantem um arquivo unico ultra-compacto (SDD_STATE.md, maximo 35 linhas) para retomar sessoes em qualquer modelo sem reenviar historico nem especificacoes completas.

## Quando Usar
- Ao iniciar um projeto novo (cria SDD_STATE.md).
- Ao abrir uma change em docs/sdd/changes/<slug>/ ou arquivar com sdd-core-archive (passos de execucao sao marcados automaticamente pelo sdd-core-exec).
- Ao abrir uma nova conversa e querer saber exatamente onde parou.

## Formato Obrigatorio (SDD_STATE.md)
- Cabecalho: # SDD_STATE: <Projeto> | Stack: <Stack> | Artefatos: APP_MAP.md [ok|pendente] | APP_ROADMAP.md [ok|pendente]
- Modulos Ativos: - MOD-01 (<Nome>): spec [ok|pendente] | steps [ok|pendente] | exec TDD: M01[x] M02[ ]
- Changes Ativas (ciclo [spec] -> [exec-ok] -> [archived]): - CHG (<slug>): [spec|exec-ok]
- Historico Arquivado: - <ID/slug>: [archived -> docs/archive/YYYY-MM-<ID>/]
- Proximo Passo: Acao: <skill + alvo exato> | Contexto Minimo: <arquivo ou bloco exato>

## Regras de Economia de Tokens e Persistencia
- Nunca adicione historico narrativo ou logs longos no SDD_STATE.md.
- Mantenha apenas o estado corrente e os links de arquivo frio.
- **Gravacao Direta no Editor:** Sempre que estiver em uma IDE ou CLI com acesso a arquivos (Antigravity, Cursor, VS Code, Claude Code), atualize SDD_STATE.md diretamente na raiz do projeto.