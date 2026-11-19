# Witchparty Rework v1.0.1

[EN] [translation](https://translate.google.com/translate?sl=es&tl=en&u=https://github.com/AoC-Gamers/WitchParty-Rework)

Witchparty Rework es una configuración para Left 4 Dead 2, diseñada para aprovechar una serie de reglas que permiten cambiar el enfoque del juego y dirigirlo a la Witch, su jefe infectado especial.

## Características

WitchParty se juega sobre Versus y toma ZoneMod como base. Los Hunters son la
única clase ordinaria de infectado especial habilitada. Su límite coincide
con el tamaño de cada equipo.

| Formato | Límite de Hunters | Bonus de equipo por crown o chip-crown | Intervalo entre intentos de aparición | Intentos por incapacitación | Tank |
| --- | ---: | ---: | ---: | ---: | --- |
| 4v4 | 4 | +5 | 12 s | 2 | Según el mapa |
| 3v3 | 3 | +5 | 14 s | 2 | Según el mapa |
| 2v2 | 2 | +10 | 16 s | 1 | Según el mapa |
| 1v1 | 1 | +10 | 18 s | 0 | Deshabilitado |

- **Aparición.** WitchParty genera Witches normales. Con ReadyUp, el
  temporizador arranca cuando la ronda entra en vivo. Cada intento requiere
  una posición válida cerca de un superviviente vivo. El temporizador
  elimina Witches que estén a más de 1500 unidades de todos los
  supervivientes vivos y aplica un límite predeterminado de 15 Witches.
- **Incapacitación.** Cuando un superviviente queda incapacitado, el modo
  hace los intentos indicados en la tabla. Esta ruta puede intentar generar
  Witches durante ReadyUp, con un Tank activo o con el límite del
  temporizador alcanzado. En 1v1 también se deshabilitan las
  incapacidades y el agarre de cornisas.
- **Tank.** Al aparecer, elimina las Witches presentes. Mientras esté en
  juego, el temporizador omite los intentos de aparición. El modelo de
  Witch en la mano del Tank es visual. El propio Tank puede alternar su
  visibilidad con `sm_showmelee`.
- **Recompensas.** Crown y chip-crown otorgan el mismo bonus de equipo
  mediante Penalty Bonus. Si el autor sigue en juego y está sin incapacitar,
  también recibe +5 de vida permanente, +10 de vida temporal y, por defecto,
  3 s de efecto de adrenalina.
- **Glow.** Las Witches aparecen con un contorno blanco que se retira cuando
  se alertan contra un jugador o mueren.

Consulta la [referencia técnica](docs/mode/zonemod-baseline.md) para los
ajustes de los perfiles y los casos pendientes de prueba en SRCDS.

## Instalación
1. Witchparty Rework requiere el proyecto base [L4D2-Competitive-Rework](https://github.com/SirPlease/L4D2-Competitive-Rework). Descárgalo e instálalo primero.
2. Con GNU Make y Python 3.10 o posterior, genera el ZIP local con `make deps-smx`, `make build-smx` y `make release`.
3. Copia las rutas `cfg/` y `addons/sourcemod/` declaradas dentro del ZIP a `left4dead2/` en el servidor.
4. Verifica los proveedores indicados en [NOTICES.md](NOTICES.md) y registra el modo como se muestra abajo.

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

## Licencias y autoría

Las configuraciones de Confogl declaran CC BY-SA 3.0. Consulta
[NOTICES.md](NOTICES.md) para la procedencia, licencias y componentes
pendientes de confirmar.

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