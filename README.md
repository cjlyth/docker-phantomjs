
# try this sed snippet to pull code blocks out of this readme: 
sed -nf - <<-"EOF" 
	/^```/,/^```/ {
		/^```/ d
		/^[[:blank:]]*\(#.*\)*$/ d
		p
	}
EOF

# You can make a script of it then run something like this:
. <(/usr/local/bin/md-code README.md )



# This docker image will start the a phantom container with a bash shell
docker run -it --rm phantomjs ls -lsa

```
docker build -t "phantomjs_shell" - <<-"EOF"
	FROM cjlyth/docker-phantomjs
	# allow any cmd available in the container env (e.g. bash, ls, etc)
	ENTRYPOINT ["/usr/bin/env"]
	CMD ["bash"]
EOF
```

# This docker image will start the a phantom container with the executable as the entrypoint
docker run -it --rm phantomjs --help

```
docker build -t "phantomjs" - <<-"EOF"
	FROM cjlyth/docker-phantomjs
	WORKDIR /opt/phantomjs/examples
EOF
```
```
docker run -it --rm phantomjs loadspeed.coffee http://www.example.com/
```



ONBUILD ENV PATH $PATH:/opt/phantomjs/bin
ONBUILD RUN cp -rs /opt/phantomjs/bin /usr/local/
ONBUILD WORKDIR /data

ONBUILD RUN bzcat /tmp/phantomjs-1.9.7-linux-x86_64.tar.bz2 | tar xf -
ONBUILD RUN find / -type d -name "*phantom*" -prune -exec cp -rs {}/bin / \;
ONBUILD RUN ["cp", "-rs", "/bin", "/usr/local/"]


docker run \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8181:8080 \
  --detach=true \
  --name=cadvisor \
  google/cadvisor:latest









