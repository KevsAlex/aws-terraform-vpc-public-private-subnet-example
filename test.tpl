    EC2 INSTANCES

    EC2 PUBLIC SUBNET :

        NAME : ${public-ec2-name}
        IP ADDRESS : ${public-ec2-ip}

    Connect to A LA private instance

        chmod 400 ${aws_key_pair-name}.pem

        ssh-add ${aws_key_pair-name}.pem

        ssh -A ec2-user@${public-ec2-ip}

        ssh ec2-user@${private-ec2-ip}

    VPC

    vpc = ${vpc-id}

    PUBLIC_SUBNET_CIDR : ${ cidrsubnet("172.10.0.0/16", 9, 2) }


