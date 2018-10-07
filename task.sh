#!/bin/sh

aws_profile=intercreate
public_dir=public
aws_path=www.intercreate.io

function usage() {
  echo 1>&2 "Usage: $0 CMD"
  echo 1>&2 "  CMD:"
  echo 1>&2 "    pull - Get latest code from S3"
  echo 1>&2 "    push - Push modified files to S3 (deploy to production)"
}

if [ $# -lt 1 ]; then
  usage
  exit 1
fi

cmd=$1

case $cmd in
  pull)
    aws --profile ${aws_profile} s3 sync s3://${aws_path}/ ${public_dir}
    ;;
  push)
    aws --profile ${aws_profile} s3 sync ${public_dir}/ s3://${aws_path}/
    ;;
  *)
    echo "Error: Unknown command '$cmd'."
    usage
    exit 1
esac
