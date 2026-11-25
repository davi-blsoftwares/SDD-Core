---
name: sdd-core-app-steps
description: Orquestracao e sequenciamento de modulos de um aplicativo (APP_ROADMAP.md) a partir do APP_MAP.md em Spec-Driven Development (SDD), livre de modelo e otimizado para economia de tokens. Use quando o usuario pedir para gerar os passos de construcao de um aplicativo, roteiro de modulos ou gerar APP_ROADMAP.md / APP_STEPS.md.
---

# SDD Core App Steps

Converte o APP_MAP.md em um roteiro de orquestracao de modulos (APP_ROADMAP.md), definindo a ordem topologica de construcao, setup base e integracao final sem duplicar especificacoes.

## Quando Usar
- Apos aprovar o APP_MAP.md gerado por sdd-core-app-plan.
- Para coordenar a ordem em que cada modulo passara por sdd-core-module-plan -> sdd-core-module-steps -> sdd-core-exec.

## Estrutura Obrigatoria (APP_ROADMAP.md)
1. **Fase 0: Fundacao & Shared Kernel:** Setup da solucao/repositorio conforme os alvos da stack no APP_MAP.md (ex.: Directory.Build.props se multi-target, ou projeto unico), projetos base e contratos compartilhados com bloco Context Slice pronto para sdd-core-exec.
2. **Fase 1..N: Matriz de Construcao dos Modulos:** Tabela Ordem | Modulo | Depende de | Pipeline SDD | Integracao no Host, com Prompt Gatilho de 2 linhas para sdd-core-module-plan.
3. **Fase Final: Composicao & Smoke Test E2E:** Registro de DI/rotas/menus conectando todos os modulos no host e checklist final.

## Regras de Economia de Tokens e Persistencia
- Nao escreva codigo de implementacao dos modulos aqui; delegue cada modulo ao ciclo sdd-core-module-plan + sdd-core-module-steps.
- Mantenha o APP_ROADMAP.md abaixo de 100 linhas.
- **Gravacao Direta no Editor:** Em IDEs/CLIs com acesso a arquivos (Antigravity, Cursor, VS Code, Claude Code), grave diretamente em docs/sdd/APP_ROADMAP.md.