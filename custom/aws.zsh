function aws-ecr() {
	echo $(aws ecr get-login-password) | docker login -u AWS --password-stdin $AWS_DOCKER_REGISTRY
}

function aws-mfa() {
	if [ "$1" -eq "" ]; then
		echo "Usage: aws-mfa <mfa-code>";
		return;
	fi;
	unset AWS_ACCESS_KEY_ID;
	unset AWS_SECRET_ACCESS_KEY;
	unset AWS_SESSION_TOKEN;
	tokenpayload=$(aws sts get-session-token --serial-number arn:aws:iam::244249143763:mfa/alex.hicks@ns8.com --token $1);
	export AWS_ACCESS_KEY_ID=$(echo "$tokenpayload" | jq -r ".Credentials.AccessKeyId");
	export AWS_SECRET_ACCESS_KEY=$(echo "$tokenpayload" | jq -r ".Credentials.SecretAccessKey");
	export AWS_SESSION_TOKEN=$(echo "$tokenpayload" | jq -r ".Credentials.SessionToken");
	echo "Authenticated";
}
