using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DataBaze
{
    public partial class Driver_Table : Form
    {
        public Driver_Table()
        {
            InitializeComponent();

            LoadData();
        }

        private void LoadData()
        {
            MySqlConnection myConnection = new MySqlConnection("server=localhost;port=3306;username=root;password=yujklip777;database=gibdd");

            myConnection.Open();

            string query = "SELECT * FROM driver_in_city ORDER BY the_serial_number_of_the_passport";

            MySqlCommand command = new MySqlCommand(query, myConnection);

            MySqlDataReader reader = command.ExecuteReader();

            List<string[]> data = new List<string[]>();

            while (reader.Read())
            {
                data.Add(new string[4]);

                data[data.Count - 1][0] = reader[0].ToString();
                data[data.Count - 1][1] = reader[1].ToString();
                data[data.Count - 1][2] = reader[2].ToString();
                data[data.Count - 1][3] = reader[3].ToString();
                
            }

            reader.Close();

            myConnection.Close();

            foreach (string[] s in data)
                dataGridView1.Rows.Add(s);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            DriverForm enter_service = new DriverForm();
            enter_service.Show();
        }
    }
}
