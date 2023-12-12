from RPA.Database import Database
from robocorp.tasks import task
import numpy

@task
def get_test_data_from_database(test_case_name):
    
    # Create a Database object and connect to the database
    db = Database()
    # Oracle DB example
    # db.connect_to_database('cx_Oracle',
    #                        "DB_NAME",
    #                        "DB_USER",
    #                        "DB_PASSWORD",
    #                        'DB_SERVER',
    #                        'DB_PORT')
    
    # SqLite example
    db.connect_to_database('sqlite3', 'resources/sqlite.db')

    # Execute a query and store the results
    test_data = db.query(f"SELECT * from login_test_data where test_case_name='{test_case_name}'")
    
    # Disconnect from the database
    db.disconnect_from_database()
    
    return test_data

def table_to_dict(data_table):
    data_dict = {}
    columns = data_table.columns
    i = 0
    for column in columns:
        print(column)
        data_dict[column] = data_table[0][i]
        i = i + 1
    return data_dict
