# SDD Core — Ultra-Lightweight Spec-Driven Development

> **19 KB no disco. ~75% menos tokens por feature entregue.**  
> Motor enxuto de **Spec-Driven Development (SDD)** composto por 8 skills modulares para agentes de IA (Claude Code, Antigravity, Cursor e VS Code), combinando **contratos tipados**, **TDD estrito (`RED -> GREEN -> REFACTOR`)** e **Clean Architecture** sem burocracia.

---

## Por que o SDD Core gasta tão poucos tokens?

Frameworks tradicionais de SDD geram de 4 a 6 arquivos longos por tarefa e obrigam o agente a reler especificações inteiras a cada passo, queimando milhares de tokens com prosa repetitiva. O **SDD Core** foi desenhado desde o zero para **soberania de contexto**:

| Métrica | Frameworks SDD Tradicionais | SDD Core | Economia Real |
| :--- | :---: | :---: | :---: |
| **Peso total das skills** | ~80 a 150 KB | **~19 KB** (8 arquivos) | **~80% mais leve** |
| **Artefatos por mudança** | 4 a 6 arquivos (`proposal`, `design`, `tasks`, `specs`) | **1 arquivo compacto** (`SPEC.md` <= 120 linhas) | **-70% de saída** |
| **Leitura por micro-passo** | Releitura completa do contexto (~3.000 tokens) | **Context Slice fechado** (~300 a 500 tokens) | **-85% de entrada** |
| **Resposta de execução** | Explicações longas e resumos (~1.000 tokens) | **Modo Silencioso** (rodapé `DONE:` de 5 linhas / ~60 tokens) | **-93% de saída** |
| **Custo total por feature** | ~7.500 a 10.000+ tokens | **~1.700 a 2.300 tokens** | **~75% de economia** |

---

## Os 5 Pilares de Eficiência

1. **Carregamento Sob Demanda (~350 tokens em repouso):** O agente nunca carrega os 19 KB de uma vez. Em repouso, apenas os metadados YAML ficam visíveis; durante uma tarefa, apenas **1 skill** (~450 a 800 tokens) é expandida por vez.
2. **Contratos Tipados em vez de Prosa:** Uma assinatura de interface, DTO ou DDL SQL comunica mais precisão ao modelo do que 40 linhas de texto descritivo — sem ambiguidade.
3. **Context Slices Cirúrgicos:** Cada micro-passo de implementação recebe exclusivamente o recorte de assinaturas e regras `SE <condicao> ENTAO <resultado>` necessárias para os arquivos daquele passo.
4. **TDD Estrito + Modo Silencioso:** O executor escreve primeiro o teste unitário (`RED`), implementa o mínimo para passar (`GREEN`), valida o build da stack e responde apenas com o rodapé `DONE:`.
5. **Passo 0 (Entrevista Rápida):** Quando um pedido chega vago, as skills de planejamento fazem de 3 a 5 perguntas diretas antes de gravar qualquer arquivo.

---

## Instalação Rápida (Windows / PowerShell)

```powershell
git clone https://github.com/davi-blsoftwares/sdd-core.git
cd sdd-core
.\install.ps1
```

O instalador copia automaticamente as 8 skills para:
- `~/.agents/skills/` (Antigravity, Cursor, VS Code)
- `~/.claude/skills/` (Claude Code)

---

## As 8 Skills (`skills/`)

| Skill | Papel | Artefato | Peso |
| :--- | :--- | :--- | :---: |
| **`sdd-core-app-plan`** | Arquitetura macro modular + Passo 0 (Entrevista) | `docs/sdd/APP_MAP.md` | ~2.3 KB |
| **`sdd-core-app-steps`** | Ordem topológica de construção do app | `docs/sdd/APP_ROADMAP.md` | ~1.8 KB |
| **`sdd-core-module-plan`** | Contratos tipados, `[DB-DELTA]` e Clean Architecture | `docs/sdd/MOD_XX.spec.md` | ~2.2 KB |
| **`sdd-core-module-steps`** | Fatiamento em micro-passos pareados com testes TDD | `docs/sdd/MOD_XX.steps.md` | ~2.4 KB |
| **`sdd-core-plan`** | Mudanças incrementais, Delta Specs e `[LEGACY-SOURCE]` | `docs/sdd/changes/<slug>/SPEC.md` | ~2.8 KB |
| **`sdd-core-exec`** | Execução silenciosa com TDD estrito, guardrail de stack e auto-check | Código + Testes unitários | ~3.2 KB |
| **`sdd-core-state`** | GPS compacto de estado entre sessões (`[spec] -> [exec-ok] -> [archived]`) | `SDD_STATE.md` | ~1.8 KB |
| **`sdd-core-archive`** | Consolidação no `ARCHITECTURE.md` e limpeza para arquivo frio | `ARCHITECTURE.md` + `docs/archive/` | ~2.3 KB |

---

## Fluxos de Trabalho

### 1. Feature Pontual, Bugfix ou Extração de Legado (3 Passos)

```text
1. Planejar : Use sdd-core-plan para planejar <feature-ou-bug>
2. Executar : Use sdd-core-exec para implementar docs/sdd/changes/<slug>/SPEC.md
3. Arquivar : Use sdd-core-archive para arquivar <slug>
```

### 2. Aplicativo Completo Multi-Módulo

```text
1. Mapa Global : Use sdd-core-app-plan para planejar <nome-do-app>
2. Roadmap     : Use sdd-core-app-steps para gerar o APP_ROADMAP.md
3. Por Módulo  : sdd-core-module-plan -> sdd-core-module-steps -> sdd-core-exec -> sdd-core-archive
```

---

## Estrutura do Repositório

```text
sdd-core/
├── README.md                  # Este guia rápido
├── install.ps1                # Instalador automático para ~/.agents/skills e ~/.claude/skills
├── docs/
│   ├── MANUAL_SDD_CORE.md     # Manual operacional completo em Markdown
│   └── guia_sdd_core.pdf      # Manual formatado em PDF
└── skills/                    # Definições SKILL.md prontas para uso
```