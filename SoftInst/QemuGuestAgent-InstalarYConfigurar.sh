#!/bin/sh

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

# ----------
#  Script de NiPeGun para instalar y configurar QEMU Guest Agent en PFSense
#
#  Ejecución remota:
#  curl -s x | bash
# ----------
echo ""
echo "  Actualizando la lista de paquetes..."
echo ""
pkg update

echo ""
echo "  Instalando el paquete qemu-guest-agent..."
echo ""
pkg install -y qemu-guest-agent

echo ""
echo "  Agregando configuraciones de inicio a /etc/rc.conf..."
echo ""
echo 'qemu_guest_agent_enable="YES"'                          >> /etc/rc.conf
echo 'qemu_guest_agent_flags="-d -v -l /var/log/qemu-ga.log"' >> /etc/rc.conf

echo ""
echo "  Iniciando el servicio qemu-guest-agent..."
echo ""
service qemu-guest-agent start

echo ""
echo "  Ejecución del script, finalizada."
echo ""

# System: Settings / Advanced: Tunables -> Add
# Tunable: virtio_console_load, Value: YES
