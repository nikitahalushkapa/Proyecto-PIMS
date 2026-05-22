#!/bin/bash
BACKUP_LOCAL="/home/nikita/backups"
REMOTE_RCLONE="gdrive-nikita:backups-servidor"
LOG="/var/log/rclone.log"
FECHA=$(date '+%Y-%m-%d %H:%M:%S')
echo "============================================" >> "$LOG"
echo "[$FECHA] INICIO SYNC NUBE" >> "$LOG"
rclone sync "$BACKUP_LOCAL" "$REMOTE_RCLONE" --progress --transfers 4 --log-file="$LOG" --log-level INFO
if [ $? -eq 0 ]; then
    echo "[$FECHA] SYNC COMPLETADO CON EXITO" >> "$LOG"
else
    echo "[$FECHA] ERROR EN SYNC" >> "$LOG"
fi
echo "============================================" >> "$LOG"
