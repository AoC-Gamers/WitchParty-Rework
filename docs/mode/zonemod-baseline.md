# Base de ZoneMod para WitchParty

| Referencia | Valor |
| --- | --- |
| Base | [SirPlease/L4D2-Competitive-Rework](https://github.com/SirPlease/L4D2-Competitive-Rework) |
| Versión comparada | ZoneMod **v2.9.2b** |
| Revisión comparada | [`0390482d48ee87ba16ecb39490dc6f235dbdc1e0`](https://github.com/SirPlease/L4D2-Competitive-Rework/tree/0390482d48ee87ba16ecb39490dc6f235dbdc1e0/cfg/cfgogl) |
| Modo de destino | WitchParty Rework **v1.0.0**, sobre Versus |

Los perfiles se compararon por tamaño. Los seis ajustes de `mapcvars.txt` coinciden en cada formato reducido. También coinciden los límites generales de comunes, megahordas, píldoras y reaparición de los cuatro pares.

| Formato | WitchParty | ZoneMod | Bonus por crown o chip-crown | Intervalo de aparición | Intentos por incapacitación |
| --- | --- | --- | --- | --- | --- |
| 4v4 | [`witchparty`](../../cfg/cfgogl/witchparty/witchparty.cfg) | `zonemod` | 5 | 12 s | 2 |
| 3v3 | [`wp3v3`](../../cfg/cfgogl/wp3v3/wp3v3.cfg) | `zm3v3` | 5 | 14 s | 2 |
| 2v2 | [`wp2v2`](../../cfg/cfgogl/wp2v2/wp2v2.cfg) | `zm2v2` | 10 | 16 s | 1 |
| 1v1 | [`wp1v1`](../../cfg/cfgogl/wp1v1/wp1v1.cfg) | `zm1v1` | 10 | 18 s | 0 |

## Apagado sincronizado

Los cuatro perfiles pasan por el [CFG compartido de apagado](../../cfg/cfgogl/witchparty/confogl_off.cfg). Tras restablecer los ajustes de Confogl, el CFG ejecuta `pm_unload_plugins refresh`. Plugin Manager lo aporta la base. Se verificaron las cuatro cadenas de apagado en el ZIP local.

## Reglas propias de WitchParty

| Área | Comportamiento del modo |
| --- | --- |
| Puntuación y salud | Omite la puntuación híbrida de ZoneMod. El plugin usa Player Skills si está disponible y Skill Detect como alternativa. Penalty Bonus concede los puntos de equipo. Si el autor del crown está en juego y sin incapacitar, recibe 5 puntos de salud permanente, 10 de salud temporal y, por defecto, 3 s de efecto de adrenalina. |
| Aparición de Witches | Los perfiles desactivan la Witch de Witch and Tankifier. El Stripper global filtra las apariciones de Witch por script. El modo crea Witches normales con `sm_wp_spawn_method 1`. Con ReadyUp, el inicio en vivo activa el temporizador. |
| Limpieza y límites | La comprobación periódica elimina Witches a más de 1500 unidades de todos los supervivientes vivos y aplica el límite de 15 por defecto. Las apariciones por incapacitación llaman directamente a la función de generación. |
| Tank | En 4v4, 3v3 y 2v2, la aparición del Tank retira las Witches y los intentos periódicos se omiten mientras el Tank esté en juego. El modelo de Witch en su mano es visual. En 1v1 se desactivan la limpieza por Tank y el modelo. |
| Contorno y comandos | El plugin aplica un contorno blanco a la Witch cuando aparece y lo retira cuando se alerta o muere. Los administradores disponen de `sm_spawnwitch` y `sm_killwitch`. `sm_showmelee` alterna la visibilidad del modelo del Tank para el jugador que lo ejecuta. |

El [mapa de producto](../../scripts/package/package-map.json) incluye [`witchparty_rework.smx` y su fuente](../../addons/sourcemod/scripting/witchparty_rework.sp), traducciones en español e inglés y los filtros propios de Stripper. [Proveedores y compilación](../build/README.md).

## Diferencias pendientes de revisión

| Área | Configuración vigente y punto pendiente |
| --- | --- |
| Mapas | Cada perfil tiene 200 entradas en `mapinfo.txt`, frente a 222 de ZoneMod 4v4 y 218 de sus variantes reducidas. Faltan entradas de Dead Center 2025, Dead Center Rebirth y otras campañas. En mapas compartidos cambian los rangos de flujo y los ajustes de hordas y píldoras. |
| Stripper | El [árbol de WitchParty](../../cfg/stripper/witchparty) contiene 157 filtros por mapa frente a 175 de ZoneMod. En 82 archivos con el mismo nombre se detectaron diferencias en líneas activas. El filtro global activa el script de skins y cambia reglas de botiquines, armas y objetos físicos. Queda por evaluar qué cambios encajan con las apariciones del modo. |
| Armas y combate | WitchParty omite las cuotas de armas, cambia conversiones de MP5 y Desert Rifle y conserva otros atributos por arma. Usa `pill_passer`, omite los rangos de aparición de píldoras de ZoneMod y difiere en godframes, props e infectados poco comunes. Omite el ecualizador de Boomer y los comandos por mapa de bloqueo de spit y cornisas. [Ajustes compartidos](../../cfg/cfgogl/witchparty/shared_settings.cfg). |
| Proveedores y orden de carga | WitchParty carga `l4d2_skill_detect` justo antes de su plugin. Es la única carga común que cambia de posición en 4v4, 3v3 y 2v2. ZoneMod 1v1 omite Skill Detect. Queda por probar el bonus con Player Skills presente y con Skill Detect como alternativa. [CFG de carga](../../cfg/cfgogl/witchparty/shared_plugins.cfg). |

La aceptación en SRCDS queda pendiente. Debe cubrir la generación al iniciar la ronda y por incapacitación, las recompensas de crown y chip-crown, la aparición del Tank y la descarga del modo. También debe confirmar el comportamiento cuando una incapacitación coincide con un Tank activo o con el límite de Witches del temporizador.
