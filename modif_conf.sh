echo "<------------------> STOPED <------------------>"
docker exec file-browser bash -c 'pm2 stop filebrowser'

echo "<------------------> APPLY CMDS <------------------>"
docker exec file-browser bash -c """
filebrowser config --help;
"""

docker exec file-browser bash -c 'pm2 start filebrowser'
echo "<------------------> FINISH <------------------>"


# USADOS BASICOS:
# filebrowser config set --branding.name 'Leafnoise' --branding.files '/visuals';


### Example Docker
## Adding user on a running container called "filebrowser"
# docker exec file-browser bash -c 'pm2 stop filebrowser && filebrowser users add john secret --perm.execute=false; pm2 start filebrowser'

## Removing user
# docker exec file-browser bash -c 'pm2 stop filebrowser && filebrowser users rm john; pm2 start filebrowser'