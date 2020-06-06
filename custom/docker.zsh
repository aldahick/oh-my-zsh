function clean-docker-images() {
	node -p "'docker rmi ' + child_process.execSync(\"docker images --format '{{.ID}} {{.Tag}}'\").toString().split('\n').filter(l=>l.includes('<none>')).map(l=>l.split(' ')[0]).join(' ')"
}
