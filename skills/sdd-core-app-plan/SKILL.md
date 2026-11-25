---
name: sdd-core-app-plan
description: Especificacao enxuta e modular de um aplicativo inteiro (APP_MAP.md) em Spec-Driven Development (SDD), livre de modelo, com economia maxima de tokens e contratos tipados. Use quando o usuario pedir para planejar um aplicativo novo, sistema completo, produto de software ou gerar um APP_MAP.md / APP_SPEC.md.
---

# SDD Core App Plan

Projeta o mapa arquitetural ultra-enxuto de um aplicativo modular (APP_MAP.md, limite de 150 linhas), decompondo o sistema em modulos independentes com contratos tipados e zero prosa redundante.

## Passo 0: Entrevista Rapida (Quando o Escopo Vier Incompleto)
- Se o usuario informar apenas o nome ou uma ideia vaga do aplicativo, NAO gere o APP_MAP.md ainda.
- Faca no maximo 5 perguntas curtas e numeradas sobre: (1) Entradas/Saidas principais, (2) Regras de negocio criticas/overrides, (3) Modulos obrigatorios na v1, (4) O que fica fora da v1 e (5) Stack e alvos de compilacao (ex.: C# net10.0-windows, multi-target net48;net10.0-windows, TypeScript/Node.js, banco de dados).
- Assim que o usuario responder (ou se ele ja passou o escopo completo no primeiro prompt), gere e grave o APP_MAP.md imediatamente.

## Estrutura Obrigatoria (APP_MAP.md)
1. **Escopo & Stack (max. 10 linhas):** Objetivo em 1 frase, plataformas, linguagens/TFMs exatos, persistencia e o que esta fora da v1.
2. **Contratos Compartilhados (Shared Kernel):** Tipos base, IDs, eventos e interfaces comuns em assinaturas reais compativeis com os alvos definidos na stack.
3. **Mapa de Modulos:** Tabela compacta: ID | Modulo | Responsabilidade Unica | Depende de | Expoe (Interfaces/Eventos).
4. **Modelo de Dados Global:** Entidades principais, chaves (PK/FK) e indices criticos em schema enxuto.
5. **Fluxos Criticos & Seguranca (max. 15 linhas):** Autenticacao/licenciamento e sequencia A -> B -> C.
6. **Criterios de Aceite v1:** Lista verificavel de conclusao do MVP.

## Regras de Economia de Tokens e Persistencia
- Prefira assinaturas de codigo e tabelas em vez de paragrafos explicativos.
- Todo aplicativo deve ser quebrado em modulos coesos e desacoplados; nunca gere especificacao monolitica.
- **Gravacao Direta no Editor:** Sempre que estiver em uma IDE ou CLI com acesso a arquivos (Antigravity, Cursor, VS Code, Claude Code), grave o resultado diretamente em docs/sdd/APP_MAP.md em vez de apenas exibir na conversa.