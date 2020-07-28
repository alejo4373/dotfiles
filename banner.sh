autoload colors; colors

skills=(JavaScript. React. Node. Express. Jest. HTML5. CSS. PostgreSQL. aws. Unix. GraphQL. APIs.)

for i in `seq 1 100`; 
  if [[ $i == 13 ]] then
    printf $fg[red]"Alejandro."$reset_color

  elif [[ $i == 31 ]] then
    printf $fg[blue]"Full Stack Web Developer."$reset_color

  elif [[ $i == 41 ]] then
    printf $fg[green]"Who ❤️ s."$reset_color

  else
    printf $fg[yellow]$skills[(($i % 13))]$reset_color
    # printf $fg[yellow]$skills[$RANDOM%12]$reset_color
  fi
