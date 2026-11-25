# SDD Core - Spec-Driven Development Engine

Conjunto de 8 skills ultra-enxutas para desenvolvimento orientado a especificacoes (**Spec-Driven Development**), projetado para **economia maxima de tokens**, **TDD estrito (RED -> GREEN -> REFACTOR)** e **Clean Architecture**.

## Instalacao (Windows / PowerShell)

```powershell
git clone <url-do-seu-repositorio>
cd Skills
.\install.ps1
```

As skills serao instaladas automaticamente em `~/.agents/skills` (Antigravity, Cursor, VS Code) e `~/.claude/skills` (Claude Code).

## Skills Incluidas (`skills/`)

| Skill | Papel | Artefato |
| :--- | :--- | :--- |
| `sdd-core-app-plan` | Arquitetura macro de aplicativo + Passo 0 (Entrevista) | `docs/sdd/APP_MAP.md` |
| `sdd-core-app-steps` | Sequenciamento topologico de construcao | `docs/sdd/APP_ROADMAP.md` |
| `sdd-core-module-plan` | Contratos tipados, `[DB-DELTA]` e Clean Architecture | `docs/sdd/MOD_XX.spec.md` |
| `sdd-core-module-steps` | Fatiamento em micro-passos pareados com testes TDD | `docs/sdd/MOD_XX.steps.md` |
| `sdd-core-plan` | Mudancas incrementais, Delta Specs e `[LEGACY-SOURCE]` | `docs/sdd/changes/<slug>/SPEC.md` |
| `sdd-core-exec` | Execucao silenciosa com TDD estrito, guardrail de stack e auto-check | Codigo + Testes unitarios |
| `sdd-core-state` | GPS compacto de estado entre sessoes | `SDD_STATE.md` |
| `sdd-core-archive` | Consolidacao no `ARCHITECTURE.md` e limpeza para arquivo frio | `ARCHITECTURE.md` + `docs/archive/` |

## Fluxo Rapido (Feature ou Bugfix)

1. `Use sdd-core-plan para planejar <feature-ou-bug>`
2. `Use sdd-core-exec para implementar docs/sdd/changes/<slug>/SPEC.md`
3. `Use sdd-core-archive para arquivar <slug>`