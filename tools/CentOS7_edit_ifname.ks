#platform=x86, AMD64, or Intel EM64T
#version=DEVEL
# Firewall configuration
firewall --disabled
# Install OS instead of upgrade
install
# Use HTTP installation media
url --url="http://$http_server/cblr/links/$distro_name/"

# Root password
rootpw --iscrypted $1$mTEGIfvw$YodZf1ilLvn4E4FM7nfNn0
# Network information
network --bootproto=dhcp --device=eth0 --onboot=on
network --bootproto=dhcp --device=eth1 --onboot=on
network --bootproto=dhcp --device=eth2 --onboot=on
# Reboot after installation
reboot

# System authorization information
auth useshadow passalgo=sha512

# Use graphical install
graphical

firstboot disable

# System keyboard
keyboard us

# System language
lang en_US

# SELinux configuration
selinux disabled

# Installation logging level
logging level=info

# System timezone
timezone Asia/Ho_Chi_Minh

# System bootloader configuration
bootloader location=mbr --append="biosdevname=0 net.ifnames=0" 

clearpart --all --initlabel
part swap --asprimary --fstype="swap" --size=1024 --ondrive=vda
part /boot --fstype xfs --size=500 --ondrive=vda
part pv.01 --size=1 --grow --ondrive=vda
volgroup root_vg01 pv.01
logvol / --fstype xfs --name=lv_01 --vgname=root_vg01 --size=1 --grow

%packages
@^minimal

@core
%end
%addon com_redhat_kdump --disable --reserve-mb='auto'
%end
%post
mkdir -p /root/testOS/
%end
