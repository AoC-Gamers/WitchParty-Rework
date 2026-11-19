# Autoría y licencias

| Componente | Procedencia y licencia documentada |
|---|---|
| `cfg/cfgogl/witchparty/`, `wp1v1/`, `wp2v2/` y `wp3v3/` | Adaptación por Lechuga. Las cabeceras declaran CC BY-SA 3.0 y acreditan a Visor, Jahze, ProdigySim, Vintik, CanadaRox, Blade, Tabun, Jacob, Forgetest, A1m y Sir. La revisión `8a04590` incorpora ajustes de ZoneMod 2.8.9e. Los `mapcvars.txt` coinciden con sus variantes de ZoneMod en la copia comparada. |
| `cfg/stripper/witchparty/` | Importado en `0d8a49a`. Coincidencia byte a byte con 71 archivos de la misma ruta en ZoneMod de la base revisada. Se conservan los avisos de ProMod, Wicket y otros autores incluidos en las reglas. Falta comprobar el origen preciso y el alcance de licencia del árbol completo. |
| `witchparty_rework.sp` y traducciones | Lechuga. El punto de partida figura en `0d8a49a` y la fuente actual incorpora cambios de `d0c37f2`. El código y las traducciones de autoría propia del plugin se ofrecen bajo GPL-3.0-only. El texto completo está en [LICENSE](LICENSE). La fuente cita Witch Glow, MultiWitches, Healer Witch y Multiwitch de CanadaRox. Las fuentes de CanadaRox consultadas en `5a70db01` carecen de licencia explícita. La comparación de texto encontró coincidencias en directivas comunes. Queda por determinar qué porciones, si las hay, se adaptaron de esas referencias antes de publicar. |

El ZIP de validación local incluye el texto GPLv3 en `LICENSE` y CC BY-SA 3.0
en `LICENSES/`. La base provee Confogl, Stripper, ReadyUp, Penalty Bonus y
Skill Detect. Left4DHooks provee los natives de juego. Player Skills es un
proveedor alternativo para el evento de crown. Los includes de esos proveedores,
Colors y el archivo histórico `wp 2.2 Original.zip` quedan fuera del instalador.

- [Filtros de ZoneMod comparados](https://github.com/SirPlease/L4D2-Competitive-Rework/tree/0390482d48ee87ba16ecb39490dc6f235dbdc1e0/cfg/stripper/zonemod)
- [Witch Glow](https://forums.alliedmods.net/showthread.php?p=2656053)
- [MultiWitches](https://forums.alliedmods.net/showthread.php?t=138553)
- [Healer Witch de CanadaRox](https://github.com/MatthewClair/sourcemod-plugins/blob/5a70db01be64ef4a34504625b15fa9201006f199/healer_witch/healer_witch.sp)
- [Multiwitch de CanadaRox](https://github.com/MatthewClair/sourcemod-plugins/blob/5a70db01be64ef4a34504625b15fa9201006f199/mutliwitch/l4d_multiwitch.sp)
- [Player Skills, revisión cuyo include coincide con el del modo](https://github.com/AoC-Gamers/L4D2-Player-Skills/tree/dfbd6ac5752b31c61c53d05728d698dc0b8d614f)
