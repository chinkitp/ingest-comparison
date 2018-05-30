import boto3
import sys
import re
import time


ec2 = boto3.resource('ec2', region_name="ap-southeast-2")

instance_type = sys.argv[1:][0]

def remove(sub, s):
    return re.sub(re.escape(sub), '', s)


groupname = ""
filename=""
with open(instance_type) as f:
    content = f.readlines()
arr = []
for line in content:
    arr.append(remove('\n', line.split(":")[1]))
    groupname = (remove('\n', line.split(":")[0]))
    filename=groupname+'.tmp'

filters = [
    {
        'Name': 'instance-state-name',
        'Values': ['running']
    }
]


def getrunning():
    print "please wait"
    time.sleep(3)
    RunningInstances = []
    filteredinstances = ec2.instances.filter(Filters=filters)
    for instance in filteredinstances:
        RunningInstances.append(instance.private_ip_address)
    exist = False
    with open(filename, "w") as myfile:
        myfile.write('['+groupname+']'+'\n')
    for item in arr:
        if item in RunningInstances:
            exist = True
        else:
            exist = False
        if exist == False:
            getrunning()
        elif exist == True:
            for instance in filteredinstances:
                RunningInstances.append(instance.private_ip_address)
                if instance.private_ip_address == item:
                    with open(filename, "a") as myfile:
                        print("the instance ip address is " + instance.public_ip_address)
                        myfile.write(instance.public_dns_name+'\n')


getrunning()
