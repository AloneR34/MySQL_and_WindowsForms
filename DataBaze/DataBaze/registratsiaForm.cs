using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace DataBaze
{
    public partial class registratsiaForm : Form
    {
        public registratsiaForm()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void label2_MouseEnter(object sender, EventArgs e)
        {
            label2.ForeColor = Color.White;
        }

        private void label2_MouseLeave(object sender, EventArgs e)
        {
            label2.ForeColor = Color.Red;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String model = modelpole.Text;
            String stamp = stamppole.Text;
            String color = colorpole.Text;
            String year = yearpole.Text;

            BD db = new BD();
            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter();

            MySqlCommand command = new MySqlCommand("SELECT * FROM `cars` WHERE `model`= @m AND `stamp`= @s AND `color`= @c AND `year`= @y", db.getConnection());
            command.Parameters.Add("@m", MySqlDbType.VarChar).Value = model;
            command.Parameters.Add("@s", MySqlDbType.VarChar).Value = stamp;
            command.Parameters.Add("@c", MySqlDbType.VarChar).Value = color;
            command.Parameters.Add("@y", MySqlDbType.VarChar).Value = year;

            adapter.SelectCommand = command;
            adapter.Fill(table);
            if (table.Rows.Count > 0)
                MessageBox.Show("Найденны сведенья о данном автомобиле");
            else
                MessageBox.Show("Сведенья о данном автомобиле не найдены");

        }

        private void button2_Click(object sender, EventArgs e)
        {
            String model = modelpole.Text;
            String stamp = stamppole.Text;
            String color = colorpole.Text;
            String year = yearpole.Text;

            BD db = new BD();
            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter();

            MySqlCommand command = new MySqlCommand("INSERT INTO `cars` ( `model`,`stamp`,`color`,`year`) VALUES (@mo,@st,@co,@ye)", db.getConnection());
            command.Parameters.Add("@mo", MySqlDbType.VarChar).Value = model;
            command.Parameters.Add("@st", MySqlDbType.VarChar).Value = stamp;
            command.Parameters.Add("@co", MySqlDbType.VarChar).Value = color;
            command.Parameters.Add("@ye", MySqlDbType.VarChar).Value = year;

            db.openConnection();
            if(command.ExecuteNonQuery()==1)
                MessageBox.Show("Данные были добавлены");
            else
                MessageBox.Show("Данные не были добавлены. Попробуйте ещё раз");
            db.closeConnection();
       
        }

        private void button3_Click(object sender, EventArgs e)
        {
            String model = modelpole.Text;
            String stamp = stamppole.Text;
            String color = colorpole.Text;
            String year = yearpole.Text;

            BD db = new BD();

            MySqlCommand command = new MySqlCommand("DELETE FROM `cars` WHERE `cars`.`model` = @mod AND `cars`.`stamp`=@sta AND `cars`.`color`=@col ANd `cars`.`year`=@yea", db.getConnection());
            command.Parameters.Add("@mod", MySqlDbType.VarChar).Value = model;
            command.Parameters.Add("@sta", MySqlDbType.VarChar).Value = stamp;
            command.Parameters.Add("@col", MySqlDbType.VarChar).Value = color;
            command.Parameters.Add("@yea", MySqlDbType.VarChar).Value = year;

            db.openConnection();
            if (command.ExecuteNonQuery() == 1)
                MessageBox.Show("Данные были удалены");
            else
                MessageBox.Show("Такой записи не существует. Попробуйте ещё раз");
            db.closeConnection();
        }
    }
}
