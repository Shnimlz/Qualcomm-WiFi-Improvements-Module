#!/system/bin/sh

# WiFi Gaming Optimizer - Script de desinstalación
# Restaura automáticamente las configuraciones originales

ui_print "- Desinstalando WiFi Gaming Optimizer"
ui_print "- Restaurando configuraciones WiFi originales..."

BACKUP_DIR="/data/adb/wifi_config_backups"

# Restaurar WCNSS_mot_cfg.ini
if [ -f "$BACKUP_DIR/WCNSS_mot_cfg.ini.backup" ]; then
    # Montar system como escribible si es necesario
    mount -o rw,remount /system 2>/dev/null
    mount -o rw,remount /vendor 2>/dev/null
    
    cp "$BACKUP_DIR/WCNSS_mot_cfg.ini.backup" "/system/vendor/etc/wifi/WCNSS_mot_cfg.ini" 2>/dev/null
    if [ $? -eq 0 ]; then
        ui_print "- WCNSS_mot_cfg.ini restaurado exitosamente"
    else
        ui_print "- Error al restaurar WCNSS_mot_cfg.ini"
    fi
else
    ui_print "- Backup de WCNSS_mot_cfg.ini no encontrado"
fi

# Restaurar WCNSS_qcom_cfg.ini
if [ -f "$BACKUP_DIR/WCNSS_qcom_cfg.ini.backup" ]; then
    cp "$BACKUP_DIR/WCNSS_qcom_cfg.ini.backup" "/system/vendor/etc/wifi/WCNSS_qcom_cfg.ini" 2>/dev/null
    if [ $? -eq 0 ]; then
        ui_print "- WCNSS_qcom_cfg.ini restaurado exitosamente"
    else
        ui_print "- Error al restaurar WCNSS_qcom_cfg.ini"
    fi
else
    ui_print "- Backup de WCNSS_qcom_cfg.ini no encontrado"
fi

# Preguntar si eliminar backups (opcional)
ui_print "- Configuraciones originales restauradas"
ui_print "- Los backups se mantienen en: $BACKUP_DIR"
ui_print "- Para eliminar backups manualmente:"
ui_print "  rm -rf $BACKUP_DIR"
ui_print ""
ui_print "- Desinstalación completada"
ui_print "- Reinicia el dispositivo para aplicar cambios"