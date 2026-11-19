# Trabajo en WitchParty-Rework

Consulta [el índice de documentación](docs/README.md) y
[la guía de compilación](docs/build/README.md) antes de editar.

- Conserva los IDs de Confogl, el orden de carga y descarga, los nombres de
  plugins y las rutas de Stripper, fuentes y recursos de SourceMod.
- Compila con el Makefile raíz. El mapa de producto en
  `scripts/package/package-map.json` declara los entrypoints. Genera y valida el ZIP con
  `make release` y `make validate-artifact`. Las salidas quedan en
  `.deps/`, `.build/` y `dist/`.
- Conserva autoría y licencias. Los cambios remotos y el despliegue requieren autorización.

## Actualizar la base de ZoneMod

1. Toma la versión, el SHA y los pares de perfiles de la
   [referencia técnica](docs/mode/zonemod-baseline.md). Compara la revisión
   registrada con la candidata y sigue los `exec` de cada tamaño hasta los CFG
   compartidos. Revisa los cambios en Plugin Manager, ReadyUp, Left4DHooks,
   Penalty Bonus y los proveedores de detección de crowns.
2. Aplica los cambios acordados conservando las reglas de WitchParty para
   generación, bonus, salud e interacción con Tank. Antes de incorporar
   `mapinfo.txt` o filtros de Stripper, revisa su efecto en las apariciones
   de Witch por script y en las reglas de jefes. Comprueba el orden de carga,
   las mayúsculas de las rutas y el mapa de producto.
3. Ejecuta `make validate-modes`, `make release` y `make validate-artifact`.
   Si falta una compilación válida o cambian fuentes o includes, sigue la
   guía de compilación y ejecuta `make build-smx` antes de empaquetar.
   Actualiza la referencia
   técnica con la revisión, el alcance y los pendientes, y registra los
   cambios de comportamiento en el changelog.
