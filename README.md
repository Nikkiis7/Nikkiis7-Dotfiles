# Nikkiis7-Dotfiles
Um guia completo sobre ricing, tudo que você precisa para entender sobre a personalização do seu sistema operacional Linux Hyprland. Se você quer somente minhas dotfiles, elas estarão em uma parte separada do site!

# Introdução:

Primeiro, o que seria um rice? No mundo do linux, rice seria a personalização do seu sistema, tudo que você faz para alterar e deixar estéticamente agradável de acordo com seu gosto, fugindo da estética padrão dos sistemas operacionais. 

Mesmo que para alguns usuários seja interessante personalizar o sistema com o seu gosto, pode ser uma tarefa cansativa e difícil para pessoas iniciantes, portanto, estarei apresentando esse guia sobre os principais aspectos para ter uma interface gráfica agradável.

Claramente não irei me aprofundar nas partes mais complexas (como por exemplo um eww da vida, que eu não sei configurar), o foco vai ser em coisas mais "simples", a ideia é que o usuário vá progredindo conforme o tempo e vá aprendendo cada vez mais sobre seu sistema.

Óbviamente, para ter um rice e uma interface personalizada, será necessário instalar os componentes necessários. Eu estarei fazendo esse tutorial especificamente no HYPERLAND, portanto, **SE VOCÊ NÃO TEM UM SISTEMA HYPRLAND EU NÃO RECOMENDO ESSE TUTORIAL PARA VOCÊ**, pode ser que algumas coisas funcionem, mas o ideal é o hyprland. Na parte dos aplicativos, se você quiser tentar seguir esse tutorial sem estar no hyprland, eu deixarei algumas observações se é possível ou não fazer.

Os aplicativos externos que serão usados:
- Waybar;
- Rofi;
- Swaync;
- Hyprlock;
- Hyprpaper.

Um último adendo, **ESSE TUTORIAL NÃO FOI FEITO PARA ADICIONAR MELHORIAS NO SISTEMA, TODAS AS MUDANÇAS APRESENTADAS AQUI SÃO TOTALMENTE ESTÉTICAS, RECOMENDO CONFIGURAR O SISTEMA HYPRLAND PRIMEIRO ANTES DE PROSSEGUIR COM O TUTORIAL!**

# Parte 1: Definir um Wallpaper (Específico para Hyprland)

De início, o que todo usuário pensa ao personalizar o seu sistema, é óbviamente mudar o seu wallpaper

Wallpaper, vem da expressão do inglês (papel de parede), seria basicamente uma imagem que será exibida em sua área de trabalho, acho que a maioria das pessoas que usam um sistema operacional, seja windows, linux ou mac, usa um wallpaper, é algo bem fácil de se fazer... Não no Hyprland.

No Hyprland as coisas são um pouco mais complicadas (nada impossível), visto que você precisará instalar um aplicativo para colocar o seu wallpaper e o aplicativo em questão se chama **Hyprpaper**

- 1º passo | Instalar o Hyprpaper:

Abra seu terminal e coloque: 

`sudo pacman -S hyprpaper`

- 2º passo | Configurar o diretório do hyprland:

No terminal, coloque o seguinte comando:

`nano ~/.config/hypr/hyprpaper.conf`

nano = basicamente ele abre um editor simples no próprio terminal, irei usá-lo por ser o mais simples, porém, se quiser usar o nvim ou o vscode, fique à vontade!

~ = O til, basicamente é uma abreviação de /home/usuário/, ele é extremamente útil para uma digitação mais rápida.

hypr = pasta central do hyprland

Agora que você soltou esse comando no terminal, você pode continuar a configuração!

3º passo | Configuração: 

Primeiro, no editor aberto, precisaremos definir aonde nossa imagem irá ficar, para isso, você precisa obviamente ter uma imagem de wallpaper e salvar ela em alguma pasta, no exemplo que irei passar, salvarei a imagem na pasta de Downloads (pasta criada pelo próprio firefox), mas fique à vontade para usar outra pasta.

`preload = /home/seuusuário/Downloads/imagem.png`

Eu recomendo você usar a pasta de Downloads e marcar a sua imagem com um nome simples como você mesmo pode ver o "imagem.png", isso irá mostrar o diretório de onde ficará o seu wallpaper.

Agora, o próximo comando:

`wallpaper = seumonitor,/seuusuario/Downloads/imagem.png`

Aqui, você vai fazer a mesma coisa de antes, definir onde sua imagem está, com um diferencial, você terá que especificar qual é o seu monitor, ou seja, o nome dele.

Para descobrir o seu monitor, coloque no terminal 

`hyprctl monitors`

E com isso, você descobrirá o nome do seu monitor. É praticamente a primeira linha depois do nome "Monitor".

![Foto de exemplo](https://github.com/Nikkiis7/Nikkiis7-Dotfiles/blob/main/print-2026-05-17_23-38-04.png)

No meu caso, o nome é HDMI-A-1, portanto eu adicionei.


`wallpaper = HDMI-A-1,/home/ryanmatsui/Downloads/heaven.png`

Depois, você irá pular uma linha e prosseguir com esses comandos:

```
wallpaper {
    monitor = 
    path = /home/ryanmatsui/Downloads/heaven.png
    fit_mode = cover
}
```


Você apenas adiciona esses comandos, substituindo claro o seu diretório e depois você pode reiniciar sua sessão do hyprland e pronto, você terá um wallpaper :D

![Wallpaper](https://github.com/Nikkiis7/Nikkiis7-Dotfiles/blob/main/print-2026-05-17_23-53-50.png)

# Parte 1.1 | E se eu quiser trocar o meu wallpaper?

É bem simples, basta pegar a imagem e renomeá-la com a do seu wallpaper antigo.

Por exemplo: o meu wallpaper antigo se chamava heaven.png, para eu trocar basta eu mudar o nome da imagem nova para heaven.png também, assim o hyprpaper já reconhece os arquivos e troca quando você sai da sessão.

Porém, obviamente é necessário você apagar o wallpaper antigo ou mudar o nome dele, para evitar problemas no reconhecimento.

Para informações mais precisas, acesse o site oficial do hyprland falando sobre o hyprpaper: https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/

# Parte 2 | A Waybar

A waybar, como é conhecida, é uma barra que fica no topo da tela e apresenta algumas informações, como o horário, as workspaces, consumo de ram, cpu, etc. É muito usada pela maioria dos usuários de Hyprland, mesmo que seja mais voltado para a estética.

**ATENÇÃO LER SE VOCÊ NÃO ESTIVER NO HYPRLAND:** é possível usar a waybar em outro ambiente (KDE, Cosmic, Gnome)? A resposta é sim, você consegue instalar a waybar em um desses ambientes, porém, vale lembrar que terão algumas funcionalidades que não serão aplicadas, como por exemplo o controle de workspaces que é algo do hyprland. É possível sim usar a waybar, desde que você oculte a sua barra do topo na distro que você usa.

A waybar pode parecer complicada de se mexer, visto que você terá que trabalhar com json e css para poder alterá-la, mas calma, essa parte será voltada para explicar cada funcionalidade e fazer VOCÊ criar sua waybar da forma que você quer!

- 1º Passo: Instalar a waybar

  `sudo pacman -S waybar`

Você consegue agora usar a waybar, e testá-la soltando `waybar` no terminal, de início, você verá que ela é bem feia, mas calma, vamos customizá-la de acordo com o seu gosto.
  


