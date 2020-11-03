UGID=32011
USER=mycroft

# Unpack mycroft-core-setup-aarch64.tar.gz to user home
tar -xzf /var/tmp/mycroft-core-setup-aarch64.tar.gz -C /home/$USER/
rm /var/tmp/mycroft-core-setup-aarch64.tar.gz
cd /home/$USER/mycroft-core
git pull

mkdir -p /opt/mycroft/skills
mkdir -p /var/log/mycroft
mkdir -p /home/$USER/.mycroft

# Install default skills
#curl "https://raw.githubusercontent.com/MycroftAI/mycroft-skills/19.02/DEFAULT-SKILLS.respeaker" | grep -o '^[^#]*' | while read l; do
#    HOME=/home/pine /home/pine/mycroft-core/.venv/bin/msm install $l
#done

chown -R $UGID:$UGID /home/$USER
chown -R $UGID:$UGID /opt/mycroft
chown -R $UGID:$UGID /var/log/mycroft

echo "Mark-2" > /etc/hostname # Needed for sudo
export CI=true
sudo -E --user=mycroft /home/mycroft/mycroft-core/dev_setup.sh
