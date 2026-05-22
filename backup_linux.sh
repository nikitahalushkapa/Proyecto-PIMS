#!/bin/bash
ORIGEN="/home/nikita/empresa"
DESTINO_LOCAL="/home/nikita/backups/empresa"
LOG="/var/log/backup.log"
FECHA=$(date '+%Y-%m-%d %H:%M:%S')
echo "============================================" >> "$LOG"
echo "[$FECHA] INICIO DEL BACKUP" >> "$LOG"
mkdir -p "$DESTINO_LOCAL"
rsync -avz --delete "$ORIGEN/" "$DESTINO_LOCAL/" >> "$LOG" 2>&1
EXIT_CODE=$?
TOTAL=$(find "$DESTINO_LOCAL" -type f 2>/dev/null | wc -l)
TAMANO=$(du -sh "$DESTINO_LOCAL" 2>/dev/null | cut -f1)
if [ $EXIT_CODE -eq 0 ]; then
    echo "[$FECHA] RESULTADO: EXITO | Archivos: $TOTAL | Tamano: $TAMANO" >> "$LOG"
else
    echo "[$FECHA] RESULTADO: ERROR (codigo $EXIT_CODE)" >> "$LOG"
fi
echo "============================================" >> "$LOG"


