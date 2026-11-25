---
name: sdd-core-exec
description: Execucao cirurgica e silenciosa de passos SDD com Context Slice, TDD estrito (Red-Green-Refactor), conformidade com os alvos da stack, limite de 2 tentativas e auto-check no SDD_STATE.md, livre de modelo e otimizada para economia maxima de output tokens. Use quando o usuario pedir para executar um plano, implementar uma SPEC, rodar um passo de SDD ou codificar a partir de um Context Slice.
---

# SDD Core Exec

Executa um micro-passo de SDD (Context Slice) com fidelidade absoluta aos contratos tipados, disciplina TDD (Red -> Green -> Refactor), respeito aos alvos declarados da stack e saida silenciosa.

## Quando Usar
- Ao fornecer um bloco Passo M0X (de MOD_XX.steps.md), um passo da Fase 0 (APP_ROADMAP.md) ou uma SPEC.md (de docs/sdd/changes/<slug>/) para implementacao.

## Regras de Execucao, TDD & Guardrails
1. **Contexto Fechado:** Implemente estritamente os arquivos listados e as assinaturas/DDL/regras do Context Slice. Nao invente metodos extras, nao refatore codigo fora do alvo e nao adicione comentarios obvios.
2. **Conformidade com Alvos da Stack (Single ou Multi-Target):**
   - Respeite estritamente a stack e os Target Frameworks/runtimes declarados no projeto (ex.: .csproj ou package.json).
   - **Somente quando o projeto declarar multiplos alvos** (ex.: net48;net10.0-windows), use APIs compativeis com todos os TFMs ou isole diferencas com diretivas de compilacao condicional (#if) e valide o build de todos os alvos.
3. **Ciclo TDD (Red -> Green -> Refactor):**
   - **RED:** Crie/atualize primeiro o arquivo de teste unitario cobrindo 100% dos contratos, casos Golden Master ([LEGACY-SOURCE]) e regras condicionais (SE ... ENTAO) antes de escrever a implementacao.
   - **GREEN:** Escreva apenas o codigo minimo necessario nos arquivos alvo para satisfazer os contratos e fazer todos os testes passarem.
   - **REFACTOR:** Limpe duplicacoes evidentes mantendo a compatibilidade com os alvos da stack sem alterar assinaturas.
   - *(Excecao: passos puramente declarativos de DTOs/Interfaces sem logica dispensam teste unitario dedicado).*
4. **Limite de 2 Tentativas & Reversao Segura:**
   - Execute o build e a suite de testes da stack para confirmar compilacao e GREEN.
   - Se o build ou os testes falharem apos **2 tentativas de ajuste** dentro dos arquivos alvo, **pare imediatamente** (nunca altere arquivos fora do Context Slice para forcar o verde), reverta alteracoes quebradas se necessario e reporte em 2 linhas qual contrato ou dependencia bloqueou o passo.
5. **Auto-Check no SDD_STATE.md:**
   - Apos confirmar build + testes verdes, se existir SDD_STATE.md na raiz do projeto, marque automaticamente o passo como [x] (ou a change como [exec-ok]) e atualize a linha Proximo Passo.
6. **Modo Silencioso (Economia de Output Tokens):**
   - PROIBIDO escrever introducoes, explicacoes didaticas ou resumos longos.
   - Entregue apenas o rodape compacto de encerramento:

DONE: <ID do Passo>
TDD: RED -> GREEN (<qtd> testes) | Build: OK
Arquivos: <lista curta (implementacao + testes)>
Validar: <comando exato de teste / build>
SDD_STATE: <ID> marcado [x] / [exec-ok]