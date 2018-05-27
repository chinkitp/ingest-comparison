import boto3
import sys
import time

# boto3.set_stream_logger('botocore')

ec2 = boto3.resource('ec2', region_name="ap-southeast-2")




maxMasterInstances= int(sys.argv[1:][0])
instance_type = sys.argv[1:][1]
all_hosts=[]

with open('user-data.txt', 'r') as myfile:
    data = myfile.read()
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


for idx,instance in enumerate(instances):
    all_hosts.append(instance.private_ip_address)
    with open("hosts", "a") as myfile:
        myfile.write(instance_type + ':'+instance.private_ip_address+'\n')


filters = [
    {
        'Name': 'instance-state-name', 
        'Values': ['running']
    }
    ]
    
    # filter the instances based on filters() above
def getrunning():
    
    filteredinstances = ec2.instances.filter(Filters=filters)

        # instantiate empty array
    RunningInstances = []

    for instance in filteredinstances:
        RunningInstances.append(instance.id)
        print instance.public_ip_address
        print(type(instance.public_ip_address))