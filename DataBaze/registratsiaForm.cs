using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
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
            String Model = modelpole.Text;
            String stamp = stamppole.Text;
            String Color = colorpole.Text;
            String Year = yearpole.Text;
            String probeg = probegpole.Text;
            String country = countrypole.Text;
            BD db = new BD();
            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter();

            MySqlCommand command = new MySqlCommand("SELECT * FROM `cars` WHERE `Model`= @m AND `stamp`= @s AND `Color`= @c AND `Year`= @y AND `probeg`=@pro AND `country`=@cou", db.getConnection());
            command.Parameters.Add("@m", MySqlDbType.VarChar).Value = Model;
            command.Parameters.Add("@s", MySqlDbType.VarChar).Value = stamp;
            command.Parameters.Add("@c", MySqlDbType.VarChar).Value = Color;
            command.Parameters.Add("@y", MySqlDbType.VarChar).Value = Year;
            command.Parameters.Add("@pro", MySqlDbType.VarChar).Value = probeg;
            command.Parameters.Add("@cou", MySqlDbType.VarChar).Value = country;
            adapter.SelectCommand = command;
            adapter.Fill(table);
            if (table.Rows.Count > 0)
                MessageBox.Show("Найденны сведенья о данном автомобиле");
            else
                MessageBox.Show("Сведенья о данном автомобиле не найдены");

        }

        private void button2_Click(object sender, EventArgs e)
        {
            String Model = modelpole.Text;
            String stamp = stamppole.Text;
            String Color = colorpole.Text;
            String Year = yearpole.Text;
            String probeg = probegpole.Text;
            String country = countrypole.Text;
            BD db = new BD();
            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter();

            MySqlCommand command = new MySqlCommand("INSERT INTO `gibdd`.`cars` (`Model`, `stamp`, `Color`, `Year`, `probeg`, `country`) VALUES (@mo,@st,@co,@ye,@pro,@cou)", db.getConnection());
            command.Parameters.Add("@mo", MySqlDbType.VarChar).Value = Model;
            command.Parameters.Add("@st", MySqlDbType.VarChar).Value = stamp;
            command.Parameters.Add("@co", MySqlDbType.VarChar).Value = Color;
            command.Parameters.Add("@ye", MySqlDbType.VarChar).Value = Year;
            command.Parameters.Add("@pro", MySqlDbType.VarChar).Value = probeg;
            command.Parameters.Add("@cou", MySqlDbType.VarChar).Value = country;
            db.openConnection();
            if(command.ExecuteNonQuery()==1)
                MessageBox.Show("Данные были добавлены");
            else
                MessageBox.Show("Данные не были добавлены. Попробуйте ещё раз");
            db.closeConnection();
       
        }

        private void button3_Click(object sender, EventArgs e)
        {
            String Model = modelpole.Text;
            String stamp = stamppole.Text;
            String Color = colorpole.Text;
            String Year = yearpole.Text;
            String probeg = probegpole.Text;
            String country = countrypole.Text;

            BD db = new BD();

            MySqlCommand command = new MySqlCommand("DELETE FROM `gibdd`.`cars` WHERE `cars`.`Model` = @mod AND `cars`.`stamp`=@sta AND `cars`.`Color`=@col ANd `cars`.`Year`=@yea AND `cars`.`probeg`=@prob AND `cars`.`country`=@coun", db.getConnection());
            command.Parameters.Add("@mod", MySqlDbType.VarChar).Value = Model;
            command.Parameters.Add("@sta", MySqlDbType.VarChar).Value = stamp;
            command.Parameters.Add("@col", MySqlDbType.VarChar).Value = Color;
            command.Parameters.Add("@yea", MySqlDbType.VarChar).Value = Year;
            command.Parameters.Add("@prob", MySqlDbType.VarChar).Value = probeg;
            command.Parameters.Add("@coun", MySqlDbType.VarChar).Value = country;

            db.openConnection();
            if (command.ExecuteNonQuery() == 1)
                MessageBox.Show("Данные были удалены");
            else
                MessageBox.Show("Такой записи не существует. Попробуйте ещё раз");
            db.closeConnection();
        }

        
    }
}
