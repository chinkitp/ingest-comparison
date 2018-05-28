- NB : MODIFICATIONS NEED TO BE MADE INSIDE THE setup.py TO SUIT YOUR AWS subnet,security group configuration ie.
    - subnetId
    - Groups

```python
    instances = ec2.create_instances(
        ImageId='ami-e0c19f83', 
        MinCount=1, 
        MaxCount=maxMasterInstances,
        KeyName="anisble-ssh-key",
        UserData=data,
        NetworkInterfaces=[
        {
            'DeviceIndex': 0,
            'SubnetId' : 'subnet-9793c0f0',
            'Groups': [
            'sg-072191cf99e0c90d4'],
            'AssociatePublicIpAddress': True            
        } ]   
    )
```

- docker-compose up --build
- ./init.sh `number of instances` `name of the group you want to add to` `AWS_ACCESS_KEY_ID` `AWS_SECRET_ACCESS_KEY` 
    eg. `init.sh 1 test  AKIAJNLASJDALSDKNKLNADCXDA Ad4hTmdi62ALSMDLKASDKASDN3hbu`

- after running the init script, your ansible configuration file is created with the host's public ips.
