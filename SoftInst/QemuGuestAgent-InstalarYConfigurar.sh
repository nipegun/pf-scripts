#!/bin/sh

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

# ----------
#  Script de NiPeGun para instalar y configurar QEMU Guest Agent en PFSense
#
#  Ejecución remota:
#  curl -s https://raw.githubusercontent.com/nipegun/pf-scripts/main/SoftInst/QemuGuestAgent-InstalarYConfigurar.sh | sh
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
echo "  Ahora deberás hacer algunos cambios en la interfaz gráfica:"
echo ""
echo "  - Ve al gestor de paquetes e instala el paquete Shellcmd."
echo '  - Ve al Menú "Services" >> "Shellcmd" y dale al botón "+Add".'
echo "    Rellena con los siguientes datos:"
echo "    Command: service quemu-guest-agent start"
echo "    Shellcmdtype: earlyshellcmd"
echo "    ...y salva los cambios."
echo '  - Ve al Menú "System" >> "Advanced" >> Pestaña "System Tunables" y dale al botón "+New"'
echo "    Rellena con los siguientes datos:"
echo "      Tunable: virtio_console_load"
echo "      Value: YES"
echo ""
echo "   Salva y aplica los cambios."
echo "   Reinicia pfSense"
echo ""
