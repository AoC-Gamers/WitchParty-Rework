# Base de ZoneMod para WitchParty

| Referencia | Valor |
| --- | --- |
| Base | [SirPlease/L4D2-Competitive-Rework](https://github.com/SirPlease/L4D2-Competitive-Rework) |
| Versión comparada | ZoneMod **v2.9.2b** |
| Revisión comparada | [`85139a242fafc913add3862c7066880b0ed9b991`](https://github.com/SirPlease/L4D2-Competitive-Rework/tree/85139a242fafc913add3862c7066880b0ed9b991/cfg/cfgogl) |
| Modo de destino | WitchParty Rework **v1.0.2**, sobre Versus |

Los perfiles se compararon por tamaño. Los seis ajustes de `mapcvars.txt` coinciden en cada formato reducido. También coinciden los límites generales de comunes, megahordas, píldoras y reaparición de los cuatro pares.

| Formato | WitchParty | ZoneMod | Límite de Hunters | Bonus de equipo por crown o chip-crown | Intervalo entre intentos de aparición | Intentos por incapacitación | Tank |
| --- | --- | --- | ---: | ---: | ---: | ---: | --- |
| 4v4 | [`witchparty`](../../cfg/cfgogl/witchparty/witchparty.cfg) | `zonemod` | 4 | 5 | 12 s | 2 | Según el mapa |
| 3v3 | [`wp3v3`](../../cfg/cfgogl/wp3v3/wp3v3.cfg) | `zm3v3` | 3 | 5 | 14 s | 2 | Según el mapa |
| 2v2 | [`wp2v2`](../../cfg/cfgogl/wp2v2/wp2v2.cfg) | `zm2v2` | 2 | 10 | 16 s | 1 | Según el mapa |
| 1v1 | [`wp1v1`](../../cfg/cfgogl/wp1v1/wp1v1.cfg) | `zm1v1` | 1 | 10 | 18 s | 0 | Deshabilitado |

## Cambios de la base en `85139a24`

Se retiraron `l4d2_steady_boost` y `l4d2_uncommon_adjustment` y sus ajustes de Confogl. [Retirada en la base](https://github.com/SirPlease/L4D2-Competitive-Rework/commit/7d080dac).

El [filtro propio de Death Toll 2](../../cfg/stripper/witchparty/maps/c10m2_drainage.cfg) incorpora el bloqueador bajo la rejilla. [Cambio de ZoneMod](https://github.com/SirPlease/L4D2-Competitive-Rework/commit/59c1b56f).

## Apagado sincronizado

Los cuatro perfiles pasan por el [CFG compartido de apagado](../../cfg/cfgogl/witchparty/confogl_off.cfg). Tras restablecer los ajustes de Confogl, el CFG ejecuta `pm_unload_plugins refresh`. Plugin Manager lo aporta la base. Se verificaron las cuatro cadenas de apagado en el ZIP local.

## Reglas propias de WitchParty

- **Aparición.** Los cuatro perfiles desactivan la Witch de Witch and
  Tankifier con `sm_witch_can_spawn 0`. Stripper filtra las apariciones por
  script que coinciden con sus reglas. `sm_wp_spawn_method 1` crea Witches
  normales. Cada intento requiere un superviviente vivo y una posición de
  aparición válida. Con ReadyUp, el temporizador arranca en `OnRoundIsLive`.
  En ausencia de ReadyUp, arranca en `round_start`. [Stripper global](../../cfg/stripper/witchparty/global_filters.cfg#L6) ·
  [Temporizador y generación](../../addons/sourcemod/scripting/witchparty_rework.sp#L336)
- **Limpieza y límite.** Al revisar el mapa, el temporizador elimina las
  Witches a más de 1500 unidades de todos los supervivientes vivos. Después
  compara el recuento restante con `sm_wp_spawn_limit`, cuyo valor
  predeterminado es 15. [Limpieza en el plugin](../../addons/sourcemod/scripting/witchparty_rework.sp#L708) ·
  [CFG compartido](../../cfg/cfgogl/witchparty/shared_settings.cfg#L268)
- **Incapacitación.** `sm_wp_spawn_incap` fija el número de intentos cuando
  se incapacita un superviviente. El plugin llama directamente a
  `SpawnWitch` desde ese evento, sin las comprobaciones del temporizador
  para Tank activo y límite de Witches ni una comprobación de ReadyUp.
  El valor 0 de 1v1 desactiva esta vía. Ese perfil también fija a 0
  `survivor_max_incapacitated_count` y `survivor_ledge_grab_health`.
  [Evento de incapacitación](../../addons/sourcemod/scripting/witchparty_rework.sp#L402) ·
  [CFG de 1v1](../../cfg/cfgogl/wp1v1/confogl.cfg#L36)
- **Tank.** En 4v4, 3v3 y 2v2, `sm_wp_tank_kill_witch 1` elimina las
  Witches presentes cuando aparece un Tank. Con `sm_wp_tank_spawn_witch 0`,
  el temporizador omite intentos mientras haya un Tank en juego. El modelo
  de Witch en la mano es visual. El propio Tank puede alternar su
  visibilidad con `sm_showmelee`. El perfil 1v1 deshabilita la aparición
  del Tank, la limpieza al aparecer y el modelo. [Evento del Tank](../../addons/sourcemod/scripting/witchparty_rework.sp#L480) ·
  [Modelo y visibilidad](../../addons/sourcemod/scripting/witchparty_rework.sp#L852)
- **Recompensas.** WitchParty omite la puntuación híbrida de ZoneMod. El
  plugin usa Player Skills para detectar crowns y chip-crowns, con Skill
  Detect como alternativa. Si el autor está en juego, Penalty Bonus concede
  el bonus de equipo aunque el autor esté incapacitado. La recompensa
  personal requiere que el autor esté sin incapacitar. El CFG da +5 de
  salud permanente y +10 temporal y desactiva el límite de salud del
  plugin con `sm_wp_health_limit 0`. El efecto de adrenalina dura 3 s por
  defecto. [Detección](../../addons/sourcemod/scripting/witchparty_rework.sp#L269) ·
  [Recompensa](../../addons/sourcemod/scripting/witchparty_rework.sp#L516)
- **Glow.** El plugin aplica un contorno blanco al aparecer la Witch. El
  rango predeterminado va de 10 a 2000 unidades. El contorno se retira al
  alertarse contra un jugador o al morir. Los administradores también
  disponen de `sm_spawnwitch` y `sm_killwitch`. [Ajustes y comandos](../../addons/sourcemod/scripting/witchparty_rework.sp#L124) ·
  [Eventos](../../addons/sourcemod/scripting/witchparty_rework.sp#L383)
- **Hunters.** Cada perfil fija `z_versus_hunter_limit` al tamaño del
  equipo y pone los límites de Boomer, Smoker, Jockey, Charger y Spitter
  en 0. En 1v1, `z_pounce_damage` vale 24 y `hunter_pz_claw_dmg` vale 0.
  En los demás tamaños valen 2 y 6, respectivamente.
  [CFG de 4v4](../../cfg/cfgogl/witchparty/confogl.cfg#L18) ·
  [CFG de 1v1](../../cfg/cfgogl/wp1v1/confogl.cfg#L18)

El [mapa de producto](../../scripts/package/package-map.json) incluye [`witchparty_rework.smx` y su fuente](../../addons/sourcemod/scripting/witchparty_rework.sp), traducciones en español e inglés y los filtros propios de Stripper. [Proveedores y compilación](../build/README.md).

## Pase de píldoras y adrenalina

WitchParty usa `fix_pill_pass` de la base con `fix_pill_pass_reload 1`,
como ZoneMod. El ajuste habilita el pase por recarga. [Carga compartida](../../cfg/cfgogl/witchparty/shared_plugins.cfg) ·
[Ajustes compartidos](../../cfg/cfgogl/witchparty/shared_settings.cfg).

## Diferencias pendientes de revisión

| Área | Configuración vigente y punto pendiente |
| --- | --- |
| Mapas | Cada perfil tiene 200 entradas en `mapinfo.txt`, frente a 222 de ZoneMod 4v4 y 218 de sus variantes reducidas. Faltan entradas de Dead Center 2025, Dead Center Rebirth y otras campañas. En mapas compartidos cambian los rangos de flujo y los ajustes de hordas y píldoras. |
| Stripper | El [árbol de WitchParty](../../cfg/stripper/witchparty) contiene 157 filtros por mapa frente a 175 de ZoneMod. En 82 archivos con el mismo nombre se detectaron diferencias en líneas activas. El filtro global activa el script de skins y cambia reglas de botiquines, armas y objetos físicos. Queda por evaluar qué cambios encajan con las apariciones del modo. |
| Armas y combate | WitchParty omite las cuotas de armas, cambia conversiones de MP5 y Desert Rifle y conserva otros atributos por arma. Omite los rangos de aparición de píldoras de ZoneMod y difiere en godframes, props e infectados poco comunes. Omite el ecualizador de Boomer y los comandos por mapa de bloqueo de spit y cornisas. [Ajustes compartidos](../../cfg/cfgogl/witchparty/shared_settings.cfg). |
| Proveedores y orden de carga | WitchParty carga `l4d2_skill_detect` justo antes de su plugin. Es la única carga común que cambia de posición en 4v4, 3v3 y 2v2. ZoneMod 1v1 omite Skill Detect. [CFG de carga](../../cfg/cfgogl/witchparty/shared_plugins.cfg). |
