# Perguntas.Dev



## Descrição

O aplicativo é um quiz em Flutter que permite ao usuário escolher um tema e responder a perguntas relacionadas a esse tema. Ele é composto por três partes principais: a tela inicial (`HomePage`), a lógica de controle do quiz (`_PerguntaAppState`), e as telas de exibição das perguntas e resultados (`Questionario` e `Resultado`).

## Principais Funcionalidades
<details>
    <summary><b>HomePage (`home_page.dart`):</b></summary>
    <img src="https://github.com/user-attachments/assets/e7c206f1-c944-46ef-b773-135621c3467f" alt="HomePage" width="200px">
  
  - **Função:** Serve como a tela inicial do aplicativo onde o usuário escolhe o tema das perguntas.
  - **Funcionamento:** Exibe três botões, cada um representando um tema diferente. Quando o usuário clica em um botão, a função `selecionarTema` é chamada com o tema correspondente.
</details>
<details>
    <summary><b>Classe `_PerguntaAppState` (`main.dart`):</b></summary>
  
  - **Função:** Gerencia o estado do aplicativo, incluindo a seleção do tema, a pontuação, e a navegação entre as perguntas.
  - **Atributos Principais:**
    - `_temaSelecionado`: Armazena o tema atualmente selecionado.
    - `_perguntaSelecionada`: Indica o índice da pergunta atualmente exibida.
    - `_pontuacaoTotal`: Acumula a pontuação obtida pelo usuário.
    - `_perguntasPorTema`: Um Map que contém listas de perguntas, cada uma associada a um tema específico.
  - **Métodos Principais:**
    - `_selecionarTema(String tema)`: Define o tema selecionado pelo usuário e reinicia o questionário.
    - `_responder(int pontuacao)`: Avança para a próxima pergunta e acumula a pontuação.
    - `_reiniciarQuestionario()`: Reinicia o questionário e retorna à tela de seleção de tema.
  - **Método `build(BuildContext context)`:**
    - Define a interface do usuário. Dependendo do estado do aplicativo (`_temaSelecionado`), exibe a `HomePage` ou o conteúdo do quiz (`perguntas` e `resultados`).
</details> 
<details>
    <summary><b>Questionário e Resultado:</b></summary>
  <img src="https://github.com/user-attachments/assets/0fd371f5-b9fb-46e8-a0fd-ef3e90e88bb3" alt="Questionário" width="200px">
  <img src="https://github.com/user-attachments/assets/8c2d5d55-494a-464f-9a22-255d6daf0557" alt="Resultado" width="200px">
  
  - **Questionario** (`questionario.dart`): Exibe a pergunta atual e as opções de resposta. Chama a função responder ao clicar em uma resposta.
  - **Resultado** (`resultado.dart`): Mostra a pontuação final do usuário e um botão para reiniciar o quiz. Chama a função reiniciarQuestionario quando o botão é clicado.
  
</details>  




## Fluxo de Execução:
![Fluxo de Execução](https://github.com/user-attachments/assets/356aaab8-b01e-4665-8fb0-fc6dfead108e)



## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento de aplicativos móveis.
- **Dart**: Linguagem de programação usada com Flutter.

## Como Usar

1. Clone este repositório.
   ```bash
   git clone https://github.com/racinefe/Perguntas.Dev.git

2. Navegue até o diretório do projeto.
   ```bash
   cd Perguntas.Dev

3. Instale as dependências.
   ```bash
   flutter pub get

4. Execute o aplicativo..
   ```bash
   flutter run

## Link para Download

Baixe o APK de teste [aqui](https://drive.google.com/file/d/1of4d9VRCRaMxzsZG5FDC3FZqOME07NSw/view?usp=drive_link)

## Autor
- **Racine Fellipe** - Desenvolvedor do projeto.



