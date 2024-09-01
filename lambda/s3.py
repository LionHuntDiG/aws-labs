import json
import boto3

def lambda_handler(event, context):
    # Initialize S3 client
    s3_client = boto3.client('s3')
    
    # Extract bucket name and file key from the event
    for record in event['Records']:
        bucket_name = record['s3']['bucket']['name']
        file_key = record['s3']['object']['key']
        
        # Get the file object from S3
        response = s3_client.get_object(Bucket=bucket_name, Key=file_key)
        
        # Log the details of the file
        file_size = response['ContentLength']
        print(f"New file uploaded: {file_key} with size {file_size} bytes")

    return {
        'statusCode': 200,
        'body': json.dumps('Successfully processed S3 object.')
    }
