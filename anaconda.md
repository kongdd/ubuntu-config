```bash
conda update --all

# iptables -I INPUT 1 -i eth0 -p tcp --dport 8080 -j ACCEPT
# iptables -I INPUT 1 -i eth0 -p tcp --dport 8888 -j ACCEPT
iptables -A INPUT -p tcp --dport 8888 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 8888 -j ACCEPT

iptables -L INPUT --line-numbers
iptables -D INPUT 1
```

```bash
jupyter notebook --generate-config --allow-root
jupyter notebook password

cat ~/.jupyter/jupyter_notebook_config.json

```

```python
c.NotebookApp.ip='*'
c.NotebookApp.password = u'sha1:038e5f37c449:5634b0618253b8088d553478b09296c112a79053'
c.NotebookApp.open_browser = False
c.NotebookApp.port =8888
```

fix ubuntu-desktop error
```bash
sudo /etc/init.d/acpid stop
sudo apt-get purge acpid
```

```bash
# update packages
pip freeze — local | grep -v ‘^\-e’ | cut -d = -f 1 | xargs -n1 pip install -U
```