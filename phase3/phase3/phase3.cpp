//pahse3-code
#include <iostream>
#include <mysql_driver.h>
#include <mysql_connection.h>

using namespace std;
using namespace sql;

int main() {
    string server = "localhost";
    string username = "root";
    string password = "1234";
    string database = "project";

    Driver* driver = get_driver_instance();
    Connection* connection = driver->connect(localhost, root, 1234);
    connection->setSchema(project);

//elaheh_rezapanah

//fatemeh_aalami

//somayeh_ghorbani

//zahra_rostami
