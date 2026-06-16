# Pedro Workout BI

Dashboard pessoal de acompanhamento do programa **MAX Workouts** (90 dias) — treinos, peso, hidratação, insights e progressão de nível. App de página única (`index.html`), sem backend.

🔗 **App publicado**: https://pedrordemiranda-ai.github.io/pedro-workout-bi/

## Funcionalidades

- **Dashboard**: KPIs do dia/semana, corredor animado com progresso no programa, nível atual e próximo treino (MAX Workouts: 4 níveis × 3 semanas, treinos A/B/C).
- **Calendário semanal**: peso e variação por dia, com cor de fundo proporcional ao delta (verde = perda, vermelho = ganho), badge de treino e barra de hidratação.
- **Insights**: bloco "Insight do Dia" com 7 análises rotativas (velocímetro de perda, DNA semanal, mapa de calor, momentum 7×7, recordes, consistência, equilíbrio do dia perfeito) e seção de correlações (água do dia anterior × Δ peso do dia seguinte, exercício × Δ peso).
- **Analítico**: regressões, projeção de meta, comparação por dia da semana e por tipo de treino.
- **Assistente IA**: chat conectado à API da Anthropic (chave inserida pelo usuário em Config, salva apenas localmente).
- **Login simples**: tela de senha (hash SHA-256, client-side) para impedir acesso casual à URL pública.
- **Sincronização via Google Drive**: salva/carrega um arquivo `pedro-workout-bi.json` no Drive do usuário (escopo `drive.file`, restrito ao próprio arquivo do app). Auto-save com debounce a cada novo dado.
- **PWA**: instalável na tela inicial do celular (`manifest.json` + `sw.js`), funciona offline para a última versão carregada.
- **Responsivo**: layout adaptado para mobile (menu rolável, calendário e cards reduzidos).

## Stack

- HTML/CSS/JS puro, single-file (`index.html`)
- [Chart.js](https://www.chartjs.org/) para gráficos
- [Flatpickr](https://flatpickr.js.org/) para seleção de datas
- Google Identity Services (GIS) + Drive API para sync
- Anthropic API (chamada direto do browser) para o assistente

## Rodando localmente

Por causa do OAuth do Google, o app precisa ser servido via HTTP (não funciona em `file://`):

```
PedroWorkoutBI.bat
```

Isso inicia um servidor Python em `http://localhost:3456` e abre o navegador. Esse domínio já está na lista de origens autorizadas no Google Cloud Console.

## Publicando atualizações

```
git add -A
git commit -m "descrição da mudança"
git push
```

O GitHub Pages republica automaticamente em 1-2 minutos. Se mudar de domínio, é preciso adicionar a nova origem em **Authorized JavaScript origins** no [Google Cloud Console](https://console.cloud.google.com/apis/credentials) (Client ID OAuth "Pedro Workout BI").

## Segurança

- A senha de login é verificada via hash SHA-256 no navegador — protege contra acesso casual, mas o hash é visível no código-fonte público (sem backend não há segredo real). Use uma senha longa.
- O escopo `drive.file` do Google Drive restringe o acesso apenas ao arquivo de backup criado pelo próprio app — nenhum outro arquivo do Drive é acessível.
- A chave da API Anthropic fica salva apenas em `localStorage` (e no backup do Drive, se conectado) — nunca é commitada no repositório.

## Changelog

Ver tags do repositório e histórico de commits (`git log`).
