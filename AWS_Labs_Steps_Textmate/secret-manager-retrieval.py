# Use this code snippet in your app.
# If you need more information about configurations
# or implementing the sample code, visit the AWS docs:
# https://aws.amazon.com/developer/language/python/

import boto3
import json
from botocore.exceptions import ClientError

def get_secret():

    secret_name = "mysql/password"
    region_name = "us-east-1"

    # Create a Secrets Manager client
    session = boto3.session.Session()
    client = session.client(
        service_name='secretsmanager',
        region_name=region_name
    )

    try:
        # Retrieve the secret value
        get_secret_value_response = client.get_secret_value(
            SecretId=secret_name
        )
    except ClientError as e:
        # Handle specific exceptions
        if e.response['Error']['Code'] == 'ResourceNotFoundException':
            print(f"The requested secret {secret_name} was not found.")
        elif e.response['Error']['Code'] == 'AccessDeniedException':
            print(f"Access denied to secret {secret_name}.")
        elif e.response['Error']['Code'] == 'DecryptionFailure':
            print(f"Could not decrypt the secret {secret_name}.")
        else:
            print(f"An error occurred: {e}")
        raise e

    # Parse the secret value
    if 'SecretString' in get_secret_value_response:
        secret = get_secret_value_response['SecretString']
        secret_dict = json.loads(secret)  # Assuming JSON format
    else:
        # Handle binary secrets (if applicable)
        decoded_binary_secret = get_secret_value_response['SecretBinary']
        secret_dict = json.loads(decoded_binary_secret)

    return secret_dict

# Example usage
if __name__ == "__main__":
    try:
        secret = get_secret()
        print("Retrieved secret successfully!")

        # Extract specific values
        username = secret.get("username")
        password = secret.get("password")

        # Use the retrieved secret (e.g., connect to a database)
        print(f"Database Username: {username}")
        print(f"Database Password: {password}")

        # Placeholder: Add your database connection code here
        # For example, use db_username and db_password to connect to MySQL
        # import pymysql
        # connection = pymysql.connect(
        #     host='your-database-host',
        #     user=db_username,
        #     password=db_password,
        #     database='your-database-name'
        # )
        # print("Connected to the database!")

    except Exception as e:
        print(f"Error retrieving or using the secret: {str(e)}")

