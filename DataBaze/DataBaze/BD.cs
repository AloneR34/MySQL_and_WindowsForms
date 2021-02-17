using MySql.Data.MySqlClient;

namespace DataBaze
{
    class BD
    {
        MySqlConnection connection = new MySqlConnection("server=localhost; port=3307; username=root; password=root;database=gibdd2");

        public void openConnection()
        {
            if (connection.State == System.Data.ConnectionState.Closed)
                connection.Open();
        }
        public void closeConnection()
        {
            if (connection.State == System.Data.ConnectionState.Open)
                connection.Close();
        }

        public MySqlConnection getConnection ()
        {
            return connection;
        }

    }
}