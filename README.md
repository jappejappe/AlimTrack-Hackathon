# AlimTrack

## Colinha dos commits:
| Prefixo | Descrição           | Significado                                    |
|---------|---------------------|------------------------------------------------|
| feat    | Features            | Uma nova funcionalidade                        |
| fix     | Correções de Erros  | Uma correção de bug                            |
| docs    | Documentação        | Apenas mudanças na documentação               |
| style   | Estilos             | Mudanças em relação a estilização              |
| refactor| Refatoração de Código | Uma alteração de código que não corrige um bug nem adiciona uma funcionalidade |
| perf    | Melhorias de Performance | Uma alteração de código que melhora o desempenho |
| test    | Testes              | Adição de testes em falta ou correção de testes existentes |
| build   | Builds              | Mudanças que afetam o sistema de build ou dependências externas (exemplos de escopos: gulp, broccoli, npm) |
| ci      | Integrações Contínuas | Alterações em nossos arquivos e scripts de configuração de CI (exemplos de escopos: Travis, Circle, BrowserStack, SauceLabs) |
| chore   | Tarefas             | Outras mudanças que não modificam arquivos de código-fonte ou de teste |
| revert  | Reverter            | Reverte um commit anterior        

# .ENV
Copie o arquivo `.env.example` e renomeie-o para `.env` na raiz do projeto. Preencha-o com os dados de um banco que deve ser criado manualmente antes.

# Como rodar
1. Na raiz do projeto, crie um `.env` com o seguinte conteúdo (deve ser substituido pelo ipv4 do pc host):
```
API_URL=http://192.168.0.107:5000
```

2. O conteúdo presente em `/backend/database/schema.sql` deve ser executado manualmente em um banco pré definido e configurado do PostgreSQL 

3. Da raiz do projeto, em um terminal, você deve rodar o comando abaixo (com flask run, ou rodando o `app.py` direto não funciona):
```
python -m backend.app
```