# Witchparty Rework v1.0.0

[EN] [translation](https://translate.google.com/translate?sl=es&tl=en&u=https://github.com/AoC-Gamers/WitchParty-Rework)

Witchparty Rework es una configuración para Left 4 Dead 2, diseñada para aprovechar una serie de reglas que permiten cambiar el enfoque del juego y dirigirlo a la Witch, su jefe infectado especial.

## Características

### General
- Las reglas generales estan basadas en ZoneMod.
- El sistema de bonus se basa en realizar crown o chip-crown a tantas witch sean posibles.
- Spawn de witch constantes.
- Realizar Crown o Chip-Crown: +5 de vida permanente y +10 de vida temporal. Ademas de un bonus de puntos para el equipo.
- El spawn del tank elimina todas las witchs del mapa y detiene su spawn.
- Las witch que se encuentren a una distancia de 1500 de los supervivientes sean eliminadas.
- Glow para la witch.
- Tank con melee especial
- La incapacitación de un supervivientes witch.

### Witchparty 4v4
- Realizar Crown o Chip-Crown: +5 de bonus al equipo
- Tiempo de spawn de witch 12 segundos
- Incapacitación genera 2 witch

### Witchparty 3v3
- Realizar Crown o Chip-Crown: +5 de bonus al equipo
- Tiempo de spawn de witch 14 segundos
- Incapacitación genera 2 witch

### Witchparty 2v2
- Realizar Crown o Chip-Crown: +10 de bonus al equipo
- Tiempo de spawn de witch 16 segundos
- Incapacitación genera 1 witch

### Witchparty 1v1
- Realizar Crown o Chip-Crown: +10 de bonus al equipo
- Tiempo de spawn de witch 18 segundos
- Incapacitación no genera witch

## Instalación
1. Witchparty Rework requiere el proyecto base [L4D2-Competitive-Rework](https://github.com/SirPlease/L4D2-Competitive-Rework). Descárgalo e instálalo primero.
2. Descarga los archivos desde el [repositorio de GitHub](https://github.com/AoC-Gamers/WitchParty-Rework).
3. Extrae los archivos en la carpeta principal de tu servidor.
4. Configura los archivos según tus necesidades (ver [Configuración](wiki/Configuración.md)).
5. Reinicia el servidor para aplicar los cambios.

## Configuración

### Agregar modo de juego
Para habilitar *Witchparty Rework* en las votaciones del servidor, edita el archivo `addons/sourcemod/configs/matchmodes.txt` y agrega:

```plaintext
"MatchModes"
{
    "Witchparty Rework Configs"
    {
        "witchparty"
        {
            "name" "Witchparty Rework"
        }
        "wp3v3"
        {
            "name" "3v3 Witchparty"
        }
        "wp2v2"
        {
            "name" "2v2 Witchparty"
        }
        "wp1v1"
        {
            "name" "1v1 Witchparty"
        }
    }
}
```
Luego, reinicia el servidor para aplicar los cambios.

## Contribuciones
Gracias por tu interés en contribuir a *Witchparty Rework*, Puedes reportar problemas o sugerir mejoras a través de la [página de issues](https://github.com/AoC-Gamers/WitchParty-Rework/issues) o enviando un *pull request* en el [repositorio de GitHub](https://github.com/AoC-Gamers/WitchParty-Rework/pulls).

# Copyright
*Witchparty Rework* es es una adaptación de "Witchparty".
Todos los complementos y códigos acondicionados son de sus respectivos autores.
```
- https://github.com/SirPlease/L4D2-Competitive-Rework
- https://forums.alliedmods.net/showthread.php?p=2656053
- https://forums.alliedmods.net/showthread.php?t=138553
- https://github.com/MatthewClair/sourcemod-plugins/blob/5a70db01be64ef4a34504625b15fa9201006f199/healer_witch/healer_witch.sp
- https://github.com/MatthewClair/sourcemod-plugins/blob/5a70db01be64ef4a34504625b15fa9201006f199/mutliwitch/l4d_multiwitch.sp
```