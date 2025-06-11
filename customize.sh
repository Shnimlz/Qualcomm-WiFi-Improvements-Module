#!/system/bin/sh

# Log de instalación
ui_print "- Instalando WiFi Gaming Optimizer"
ui_print "- Creando backups de configuraciones originales..."

# Crear directorio de backup
BACKUP_DIR="/data/adb/wifi_config_backups"
mkdir -p "$BACKUP_DIR"

# Hacer backup de WCNSS_mot_cfg.ini
if [ -f "/system/vendor/etc/wifi/WCNSS_mot_cfg.ini" ]; then
    cp "/system/vendor/etc/wifi/WCNSS_mot_cfg.ini" "$BACKUP_DIR/WCNSS_mot_cfg.ini.backup"
    ui_print "- Backup de WCNSS_mot_cfg.ini creado"
else
    ui_print "- WCNSS_mot_cfg.ini no encontrado en sistema"
fi

# Hacer backup de WCNSS_qcom_cfg.ini
if [ -f "/system/vendor/etc/wifi/WCNSS_qcom_cfg.ini" ]; then
    cp "/system/vendor/etc/wifi/WCNSS_qcom_cfg.ini" "$BACKUP_DIR/WCNSS_qcom_cfg.ini.backup"
    ui_print "- Backup de WCNSS_qcom_cfg.ini creado"
else
    ui_print "- WCNSS_qcom_cfg.ini no encontrado en sistema"
fi

ui_print "- Backups guardados en: $BACKUP_DIR"
ui_print "- Aplicando configuraciones para gaming"
ui_print "- Optimizando latencia y estabilidad"
ui_print "- Reduciendo roaming agresivo para gaming"
ui_print "- Configuración gaming aplicada exitosamente"
ui_print "- Reinicia el dispositivo para aplicar cambios"