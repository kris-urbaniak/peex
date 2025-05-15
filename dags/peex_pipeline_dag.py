from airflow import DAG
from airflow.providers.amazon.aws.operators.lambda_function import AwsLambdaInvokeFunctionOperator
from airflow.providers.amazon.aws.operators.glue import GlueJobOperator
from airflow.operators.bash import BashOperator
from airflow.operators.email import EmailOperator
from airflow.utils.dates import days_ago
from datetime import timedelta

default_args = {
    'owner': 'peex',
    'depends_on_past': False,
    'email': ['krurba@softserveinc.com'],
    'email_on_failure': True,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    dag_id='peex_data_pipeline',
    default_args=default_args,
    description='Orchestrates Peex data collection and processing',
    schedule_interval='@daily',
    start_date=days_ago(1),
    catchup=False,
    tags=['peex', 'space'],
) as dag:

    # Step 1: Run Lambda 1
    lambda_1 = AwsLambdaInvokeFunctionOperator(
        task_id='run_lambda_1',
        function_name='ImportAll',
        aws_conn_id='aws_default',
        invocation_type='RequestResponse',
    )

    # Step 2: Run Lambda 2
    lambda_2 = AwsLambdaInvokeFunctionOperator(
        task_id='run_lambda_2',
        function_name='ImportFull',
        aws_conn_id='aws_default',
        invocation_type='RequestResponse',
    )

    # Step 3: Run Glue Job
    glue_job = GlueJobOperator(
        task_id='run_glue_job',
        job_name='astronauts',
        script_location='s3://your-bucket/scripts/glue_script.py',  # optional
        aws_conn_id='aws_default',
        region_name='us-east-1'
    )

    # Step 4: Run dbt Models
    dbt_run = BashOperator(
        task_id='run_dbt',
        bash_command='cd /usr/local/airflow/dags/peex/transform/peex && dbt run',
        env={'DBT_PROFILES_DIR': '.'},  # to be chngd
    )

    # Step 5: Send Email
    notify = EmailOperator(
        task_id='send_email',
        to='krurba@softserveinc.com',
        subject='[Peex] DAG completed successfully',
        html_content='The PEEX data pipeline has completed successfully.',
    )

    # DAG Flow
    lambda_1 >> lambda_2 >> glue_job >> dbt_run >> notify
