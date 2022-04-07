#!/bin/bash
filebrowser config import '/config/export.json'
filebrowser users add 'admin' 'admin' --perm.admin --perm.delete --perm.modify --perm.execute --perm.rename
filebrowser users update 'admin' --scope '.' --commands 'sudo'


pm2 start filebrowser
pm2 logs