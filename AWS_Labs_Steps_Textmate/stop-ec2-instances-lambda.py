import boto3

def lambda_handler(event, context):
    # Create an EC2 client
    ec2 = boto3.client('ec2')
    
    try:
        # Describe all running instances using filters
        response = ec2.describe_instances(
            Filters=[
                {
                    'Name': 'instance-state-name',
                    'Values': ['running']
                }
            ]
        )
        
        # Extract instance IDs from the response
        instance_ids = []
        for reservation in response['Reservations']:
            for instance in reservation['Instances']:
                instance_ids.append(instance['InstanceId'])
        
        if instance_ids:
            # Stop the running instances
            stop_response = ec2.stop_instances(InstanceIds=instance_ids)
            message = f"Initiated stop for instances: {instance_ids}"
            print(message)
            return {
                'statusCode': 200,
                'body': message,
                'details': stop_response
            }
        else:
            message = "No running instances found."
            print(message)
            return {
                'statusCode': 200,
                'body': message
            }
    except Exception as e:
        error_message = f"Error stopping instances: {str(e)}"
        print(error_message)
        return {
            'statusCode': 500,
            'body': error_message
        }
