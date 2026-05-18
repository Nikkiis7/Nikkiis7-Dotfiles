# Nikkiis7-Dotfiles
Um guia completo sobre ricing, tudo que você precisa para entender sobre a personalização do seu sistema operacional Linux Hyprland. Se você quer somente minhas dotfiles, elas estarão na pasta chamada **assets**!

---------

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

---------

# Parte 1: Definir um Wallpaper (Específico para Hyprland)

De início, o que todo usuário pensa ao personalizar o seu sistema, é óbviamente mudar o seu wallpaper

Wallpaper, vem da expressão do inglês (papel de parede), seria basicamente uma imagem que será exibida em sua área de trabalho, acho que a maioria das pessoas que usam um sistema operacional, seja windows, linux ou mac, usa um wallpaper, é algo bem fácil de se fazer... Não no Hyprland.

No Hyprland as coisas são um pouco mais complicadas (nada impossível), visto que você precisará instalar um aplicativo para colocar o seu wallpaper e o aplicativo em questão se chama **Hyprpaper**

- 1º passo | Instalar o Hyprpaper:

Abra seu terminal e coloque: 

`sudo pacman -S hyprpaper`

---------

- 2º passo | Configurar o diretório do hyprland:

No terminal, coloque o seguinte comando:

`nano ~/.config/hypr/hyprpaper.conf`

nano = basicamente ele abre um editor simples no próprio terminal, irei usá-lo por ser o mais simples, porém, se quiser usar o nvim ou o vscode, fique à vontade!

~ = O til, basicamente é uma abreviação de /home/usuário/, ele é extremamente útil para uma digitação mais rápida.

hypr = pasta central do hyprland

Agora que você soltou esse comando no terminal, você pode continuar a configuração!

---------

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

![Foto de exemplo](https://github.com/Nikkiis7/Nikkiis7-Dotfiles/blob/main/imagens/print-2026-05-17_23-38-04.png)

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

![Wallpaper](https://github.com/Nikkiis7/Nikkiis7-Dotfiles/blob/main/imagens/print-2026-05-17_23-53-50.png)

---------

# Parte 1.1: E se eu quiser trocar o meu wallpaper?

É bem simples, basta pegar a imagem e renomeá-la com a do seu wallpaper antigo.

Por exemplo: o meu wallpaper antigo se chamava heaven.png, para eu trocar basta eu mudar o nome da imagem nova para heaven.png também, assim o hyprpaper já reconhece os arquivos e troca quando você sai da sessão.

Porém, obviamente é necessário você apagar o wallpaper antigo ou mudar o nome dele, para evitar problemas no reconhecimento.

Para informações mais precisas, acesse o site oficial do hyprland falando sobre o hyprpaper: https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/

---------

# Parte 2: A Waybar

A waybar, como é conhecida, é uma barra que fica no topo da tela e apresenta algumas informações, como o horário, as workspaces, consumo de ram, cpu, etc. É muito usada pela maioria dos usuários de Hyprland, mesmo que seja mais voltado para a estética.

**ATENÇÃO LER SE VOCÊ NÃO ESTIVER NO HYPRLAND:** é possível usar a waybar em outro ambiente (KDE, Cosmic, Gnome)? A resposta é sim, você consegue instalar a waybar em um desses ambientes, porém, vale lembrar que terão algumas funcionalidades que não serão aplicadas, como por exemplo o controle de workspaces que é algo do hyprland. É possível sim usar a waybar, desde que você oculte a sua barra do topo na distro que você usa.

A waybar pode parecer complicada de se mexer, visto que você terá que trabalhar com json e css para poder alterá-la, mas calma, essa parte será voltada para explicar cada funcionalidade e fazer VOCÊ criar sua waybar da forma que você quer!

- 1º Passo: Instalar a waybar

  `sudo pacman -S waybar`

Você consegue agora usar a waybar, e testá-la soltando `waybar` no terminal, de início, você verá que ela é bem feia, mas calma, vamos customizá-la de acordo com o seu gosto.

---------
  
- 2º Passo: Configurar para inciar junto com o sistema

É essencial fazer essa mudança para a waybar poder iniciar junto com o sistema, se não você precisará digitar waybar toda hora no terminal para poder enxergá-la.

Abra a sua configuração do hyprland.

nano ~/.config/hypr/hyprland.conf

Agora, você deve procurar pela aba de AUTOSTART em seu hyprland.conf

Na aba de AUTOSTART, coloque:

`exec-once - waybar`

Pronto, agora quando você iniciar o seu sistema, a waybar vai iniciar automaticamente.

---------

- 3º Passo: Criar um diretório para a waybar

Utilize o comando:

`mkdir -p ~/.config/waybar`

mkdir = basicamente uma abreviação de (Make Directory), serve para criar um diretório.

-p = basicamente garante que a pasta não dê erro se já for criada.

Depois disso, você deve criar dois arquivos dentro dessa pasta da waybar, o config.jsonc e o style.css

`touch ~/.config/waybar/config.jsonc`

`touch ~/.config/waybar/style.css`

touch = cria um arquivo vazio

---------

# Parte 2.1: Configuração do Jsonc

Primeiro, vamos configurar a alma de nossa waybar, o config.jsonc, para isso, eu recomendo usar um outro editor de texto, como nvim ou o vscode, mas se quiser prosseguir com o nano, fique à vontade.

`nano ~/.config/waybar/config.jsonc`

Vamos começar com o básico:

```
{
  "layer": 
  "position": 
  "height": 
  "margin-top": 
  "margin-left": 
  "margin-right": 

  "modules-left": 
  "modules-center": 
  "modules-right":
```

Essa é a estrutura básica de uma waybar.

Um adendo, quando você abrir esse arquivo, é possível que ele venha com coisas dentro, eu recomendo apagar tudo!

Vamos começar a explicação!

O básico de um jsonc, é que o arquivo deve inciar e terminar com {}, portanto, inicie o seu documento com um {

Depois prossiga com a explicação:

- "layer": basicamente define a camada visual da waybar, se ela vai ficar na frente de tudo ou atrás.

top = a barra fica na frente de tudo, sempre visível mesmo com janelas abertas

bottom = a barra fica atrás das janelas, só aparece quando não tem nada na frente

Minha recomendação, utilizar o top!

- "position": auto-explicativo, define a posição de sua waybar, se você quer ela no topo, em baixo, na direita, esquerda.

top = barra no topo
bottom = barra em baixo
left = barra na esquerda
right = barra na direita

Aqui é mais gosto pessoal e também depende do tipo de rice que você quer fazer, mas eu prefiro deixar a barra no topo!

- "height": também é auto-explicativo, define o tamanho da sua waybar.

Eu coloco a minha em 45, que é um tamanho mediano, mas eu recomendo você ir testando.

OBS: vai dando o comando `killall waybar` e `waybar` pra ir testando as coisas e vendo as alterações.

- "margin"(top,left,right,bottom): basicamente a margem da sua waybar de acordo com a sua tela.

Se você quer deixar ela totalmente colada na tela, então deixa 0 em tudo, mas eu recomendo você ir testando e vendo a maneira que te agrada.

Como eu prefiro que ela fique flutuando, eu coloco 10 em tudo :D

- "modules"(right,left,center): aqui será basicamente a posição de onde ficará cada item em sua waybar.

Essa parte é totalmente opcional do usuário, cada um deixa as suas coisas onde elas querem.

Nome das propriedades que serão usadas aqui:
- clock = relógio
- network = internet
- pulseaudio = audio
- memory = memória ram
- -cpu = processador
- tray = aplicativos em segundo plano
- hyprland/workspaces = espaços de trabalho do hyprland
- -custom/arch = logo customizável (opcional)

Vamos por exemplo pegar o relógio(clock), se você quer deixá-lo no centro, você deve colocá-lo em:

`modules-center": ["clock"],`

Se quiser na direita, coloque em:

`"modules-right": ["clock"],`

OBS: vale lembrar que os itens que você coloca devem ser colocados na ordem exata que você quer, pois a ordem que está aí no código, é a ordem que vai aparecer na waybar.

Por exemplo, se eu colocar:

`"modules-right": ["cpu","clock"],`

O que vai aparecer é a cpu e o relógio em sua respectiva ordem.

Enfim, essa parte é totalmente opcional, configure da maneira que prefirir, mas nas minhas configurações, ela ficou assim! 

```
// - Alma - \\

{
  "layer": "top",
  "position": "top",
  "height": 45,
  "margin-top": 10,
  "margin-left": 10,
  "margin-right": 10,

  "modules-left": ["custom/arch","hyprland/workspaces"],
  "modules-center": ["group/clock"],
  "modules-right": ["group/tray","custom/arrow","network","pulseaudio","memory","cpu"],
```

Fique à vontade se quiser copiar!

OBS: O que é esse "group"? É uma configuração um pouco mais avançada para adicionar configurações secundárias a esses módulos, como por exemplo o drawer, que será explicado mais pra frente.

drawer = efeito de transição

Se não quiser usar o drawer, basta ignorar group na frente e adicionar os nomes normalmente.

- Configurando cada módulo:

Agora, vamos configurar cada módulo de nosso jsonc, vamos começar pelo relógio:

---------

- Relógio | Versão sem drawer:

Para configurar o relógio, você deve colocar o nome igual está nos modules.

```
"clock": {
    "format": 
    "tooltip": 
  },
```

Veja como não é tão difícil a waybar, cada módulo terá o:
- format = o formato, como aquele módulo irá aparecer
- tooltip = uma pequena caixa de informações quando você passa o mouse

A maioria dos módulos irão usar esse mesmo formato, com algumas modificações, claro!

- "format": é o formato do relógio, você quer que ele seja de 24 horas? 12 horas? QUe apareça os segundos? Etc...

Formatos:
- %a - dia da semana abreviado (ex: Dom, Seg, Ter)
- %d - dia do mês com dois dígitos 
- %m - mês com dois dígitos 
- %H - hora no formato 24h 
- %M - minutos 
- %S - segundos
- %I - horário 12 horas
- %p - mostrar o AM e PM (apenas para relógio 12 horas)
- %y - mostrar o ano (2 dígitos)
- %Y - mostrar o ano com 4 dígitos (2026)

Sabendo disso, basta configurar o relógio da forma que você quiser!

```
"clock": {
    "format": "{:%I:%M:%S}",
    "tooltip": 
  },
  ```

É um exemplo do que eu uso, mas se quiser, pode tentar o formato completo:

`"{:%a %d/%m/%Y ~ %I:%M %p}"`

Aí ficaria:

Dom 17/05/2026 ~ 11:20 PM

Vai da sua preferência!

- Tooltip:

O tooltip, eu acho que não tem tanta importância, mas, basicamente vai aparecer uma caixa quando você passa o mouse em cima.

Para o relógio, eu deixo em false, mas se quiser ativar, deixe em true.

```
"clock": {
    "format": "{:%I:%M:%S}",
    "tooltip": false
  },
  ```

---------

- Relógio | com drawer:

Se quiser usar o drawer, você deverá mudar o nome do "clock" lá nos modules e renomear para "group/clock".

Isso serve pra qualquer módulo que você quiser usar o drawer.

```
"group/clock": {
  "orientation": "horizontal",

  "drawer": {
    "transition-duration": 200,
    "transition-left-to-right": true
  },

  "modules": [
    "custom/clock",
    "custom/date"
  ]
},

"custom/clock": {
  "exec": "date '+%I:%M:%S'",
  "interval": 1
},

"custom/date": {
  "exec": "date '+  󰃭  = %d/%m/%Y'",
  "interval": 60
},
```

Para explicar essa parte, irei usar a minha configuração como base.

- orientation = direção que os itens ficam organizados (horizontal = lado a lado)
  
drawer = efeito de gaveta que esconde/mostra os módulos do grupo

- transition-duration = tempo da animação em milissegundos (200 = 0.2 segundos)
- transition-left-to-right = direção que a gaveta abre (true = da esquerda pra direita)


- modules = lista dos módulos que fazem parte do grupo


- custom/clock = módulo personalizado que mostra o horário

- exec = comando que ele roda para pegar a informação (date '+%I:%M:%S' = hora:minuto:segundo)
- interval = de quantos em quantos segundos ele atualiza (1 = todo segundo) [exclusivo se você quer usar segundos no seu relógio, se não, não precisa]


- custom/date = módulo personalizado que mostra a data

- exec = roda date '+%d/%m/%Y' para pegar o dia/mês/ano, o 󰃭 é um ícone de calendário (Nerd Font)
- interval = atualiza a cada 60 segundos (já que a data muda só uma vez por dia, não precisa ser tão frequente)

Fique à vontade pra copiar as minhas configuraçẽos se quiser!

Portanto, agora temos:

```
// - Alma - \\

{
  "layer": "top",
  "position": "top",
  "height": 45,
  "margin-top": 10,
  "margin-left": 10,
  "margin-right": 10,

  "modules-left": ["custom/arch","hyprland/workspaces"],
  "modules-center": ["group/clock"],
  "modules-right": ["group/tray","custom/arrow","network","pulseaudio","memory","cpu"],

  // - Relógio - \\

"group/clock": {
  "orientation": "horizontal",

  "drawer": {
    "transition-duration": 200,
    "transition-left-to-right": true
  },

  "modules": [
    "custom/clock",
    "custom/date"
  ]
},

"custom/clock": {
  "exec": "date '+%I:%M:%S'",
  "interval": 1
},

"custom/date": {
  "exec": "date '+  󰃭  = %d/%m/%Y'",
  "interval": 60
},
````

---------

- Logo customizável (opcional)

Para colocar uma logo, basta coloca-la no módulo que você quer, eu por exemplo, como você viu na minha configuração, coloquei ela na esquerda, mas você pode colocar ela onde quiser :)

`"modules-left": ["custom/arch","hyprland/workspaces"],`

"custom/arch" é a nossa logo, portanto, vamos coloca-la no arquivo!
```
  "custom/arch": {
    "format": 
    "tooltip": 
  },
````

Se você percebeu, o padrão é o mesmo do relógio, com format e tooltip, então no format, você pode adicionar a logo que você quiser por meio do site do Nerd Fonts!

Site: https://www.nerdfonts.com/

Eu usei a logo do arch linux, já que é o meu sistema operacional btw. (lol xD)

Portanto, basta:

```
  "custom/arch": {
    "format": "",
    "tooltip": false
  },
```

Pronto, colocamos a logo, agora ela vai aparecer na esquerda! Bem fácil!

---------

- Workspaces (exclusivo hyprland):

Basicamente são um indicador para mostrar quantas workspaces você tem ou em qual você está, é bem legal e útil para você não se perder!

`"modules-left": ["custom/arch","hyprland/workspaces"],`

Nós adicionamso então o "hyprland/workspaces" e vamos configurá-lo!

```
"hyprland/workspaces": {
    "format": "{id}",
    "format-icons": {}
}
```

Aqui tem algumas formas de se usar os workspaces, a primeira é a mais tradicional, usando os números

Exemplo:

![Rice](https://github.com/Nikkiis7/Nikkiis7-Dotfiles/blob/main/imagens/print-2026-05-18_01-53-18.png)

Como vocês podem ver na imagem a cima do rice do Joao Bola Bola as workspaces são em formato de número (Belo rice por sinal xD)

Porém, tem outra forma (que é a que eu uso inclusive), por meio de símbolos, para isso:

```
"hyprland/workspaces": {
  "format": "{icon}",
  "format-icons": {
    "default": "",
    "active": "󰮯"
  }
},
```
- default: a forma com que os símbolos vão ficar, no meu caso eu coloquei uma bola
- active: quando você está na sua workspace atual, ela troca por esse símbolo

No meu caso, eu usei uma bola e um pacman (xD) pra representar, experimente da forma que quiser!

---------

- CPU e Memória RAM

Vai mostrar a porcentagem da memória ram e cpu, é muito fácil de adicionar, portanto, vamos escolher onde elas vão ficar na barra! 

  `"modules-right": [""memory","cpu"],`

Ficará no módulo direito, então para configurar, basta:

```
"memory": {
  "format": "{percentage}%"
},

"cpu": {
  "format": "{usage}%"
},
```

Não tem muito o que explicar, kk, basta colocar a porcentagem e aparecerá.

Para customizar, você pode colocar um símbolo, ou apenas "CPU" e "RAM", vai da sua preferência.

OBS: Nesse caso, tente usar o que eu chamo de "espaços forçados". O que é isso? Que brisa é essa? Basicamente se você usar um espaço normal, a formatação na waybar não vai ou seja, se eu coloco por exemplo:

"format": "  = {percentage}%"

Com espaço normal, na waybar vai ficar 10% por exemplo. Pode ficar meio esquisito, então eu recomendo usar um "espaço fantasma", que aí vai ficar certinho (espero que você tenha entendido, pelo amor de Deus ;-;) 

Espaço fantasma para adicionar = " " 

Só copie esse espaço e adicione :D

Continuando...

Minha configuração:

```
// - Memória RAM - \\

"memory": {
  "format": "  = {percentage}%"
},

// - Processador | CPU - \\

"cpu": {
  "format": "  = {usage}%"
},
```

---------

- Audio:

Não tem muito segredo, a gente vai usar a mesma forma dos outros módulos.

IMPORTANTE: A partir desse ponto, se você está lendo este documento desde o início (o que eu acho difícil), vou começar a ser mais direto, pois acredito que você já tenha compreendido como funciona o jsonc na waybar, então não preciso ficar explicando muita coisa. Se não entendeu, eu recomendo você voltar o documento e ler com mais calma.

```
"pulseaudio": {
  "format": "{volume}%",
```

Não tem segredo, você só coloca o volume e com isso, você consegue ver na waybar e usar o scroll para diminuir, se você quiser.

Minha configuração:

```
// - Audio - \\

"pulseaudio": {
  "format": "  = {volume}%",
  "format-muted": " = muted",
  "format-icons": {
    "default": ["","",""]

  }

},
```

Eu apenas coloquei um ícone e coloquei o formato de mutado, ou seja, se o volume chegar em zero, o ícone aparece como mutado.

---------

- Internet:

Vai mostrar a sua internet na waybar.

```
"network": {
  "format-ethernet": "  = ethernet",
  "format-disconnected": "󰖪  = offline",
  "tooltip": true
},
```

format-ethernet: é para se você usa ethernet, ou seja, internet cabeada no seu computador.
format-wifi: é para se você usa wifi. No seu caso, você coloca {essid}.

`"format-wifi": "  = {essid}",`

No meu caso, a minha internet é cabeada, então eu não preciso do format-wifi, o contrário também serve, se você tem internet via wifi, você não precisa do format-ethernet.

format-disconnected: basicamente é o que vai aparecer na waybar se você não estiver com internet.

---------

- Tray:

Seria os aplicativos em segundo plano que vão aparecer na sua waybar. 

![Exemplo](https://github.com/Nikkiis7/Nikkiis7-Dotfiles/blob/main/imagens/print-2026-05-18_02-24-59.png)

```
"tray": {
    "icon-size": 
    "spacing": 
}
```

- icon-size: tamanho dos ícones
- spacing: espaço entre eles e o resto dos módulos

 ---------

- Tray com Drawer:

Para ficar mais bonito e agradável, eu costumo usar o tray com o drawer (módulo já apresentado antes)

Minhas configurações ficam assim:

```
"group/tray": {
  "orientation": "horizontal",

  "drawer": {
    "transition-duration": 200,
    "transition-left-to-right": false
  },

  "modules": [
    "custom/tray-arrow",
    "tray"
  ]
},

"custom/tray-arrow": {
  "format":"",
  "tooltip": false
}
```

O que é essa custom/tray-arrow? Basicamente é uma seta que fica na waybar que quando eu passo o mouse em cima, os ícones do tray aparecem, fica bem legal!

Você pode colocar o símbolo que quiser.

---------

- Finalização:

Com isso, finalizamos o jsonc e estamos aptos para ir ao css.

Minha configuração final:

```
// - Alma - \\

{
  "layer": "top",
  "position": "top",
  "height": 45,
  "margin-top": 10,
  "margin-left": 10,
  "margin-right": 10,

  "modules-left": ["custom/arch","hyprland/workspaces"],
  "modules-center": ["group/clock"],
  "modules-right": ["group/tray","custom/arrow","network","pulseaudio","memory","cpu"],

  // - Relógio - \\

"group/clock": {
  "orientation": "horizontal",

  "drawer": {
    "transition-duration": 200,
    "transition-left-to-right": true
  },

  "modules": [
    "custom/clock",
    "custom/date"
  ]
},

"custom/clock": {
  "exec": "date '+%I:%M:%S'",
  "interval": 1
},

"custom/date": {
  "exec": "date '+  󰃭  = %d/%m/%Y'",
  "interval": 60
},

   // - Logo do Arch - \\

  "custom/arch": {
    "format": "",
    "tooltip": false
  },

  // - Workspace - \\ 

  "hyprland/workspaces": {
  "format": "{icon}",
  "format-icons": {
    "default": "",
    "active": "󰮯"
  }
},

// - Memória RAM - \\

"memory": {
  "format": "  = {percentage}%"
},

// - Processador | CPU - \\

"cpu": {
  "format": "  = {usage}%"
},

// - Audio - \\

"pulseaudio": {
  "format": "  = {volume}%",
  "format-muted": " = muted",
  "format-icons": {
    "default": ["","",""]

  }

},

// - Internet - \\

"network": {
  "format-ethernet": "  = ethernet",
  "format-disconnected": "󰖪  = offline",
  "tooltip": true
},

// - Tray - \\

"tray": {
  "spacing": 20,
  "icon-size": 20

},

"group/tray": {
  "orientation": "horizontal",

  "drawer": {
    "transition-duration": 200,
    "transition-left-to-right": false
  },

  "modules": [
    "custom/tray-arrow",
    "tray"
  ]
},

"custom/tray-arrow": {
  "format":"",
  "tooltip": false
}

}

// - Feito por Ryan Matsui :D
```

Fique à vontade para usar, se quiser copiar minhas configurações!

---------

# Parte 2.2: Configurando o style.css

OBS: As explicações que eu vou mostrar aqui, vão ser de acordo com as minhas configurações, que eu acredito que será o suficiente para você entender e fazer sua própria waybar, mas acredito que se você quiser ter o domínio total de sua waybar, aí é só sabendo css mesmo.

`nano ~/.config/waybar/style.css`



