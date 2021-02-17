﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace DataBaze
{
    public partial class DriverForm : Form
    {
        public DriverForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String fio = fiopole.Text;
            String staj = stajpole.Text;
            String city = citypole.Text;

            BD db = new BD();
            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter();

            MySqlCommand command = new MySqlCommand("SELECT * FROM `drivers_in_cities` WHERE `FIO`= @m AND `driving_experience`= @s AND `name_of_the_city`= @c ", db.getConnection());
            command.Parameters.Add("@m", MySqlDbType.VarChar).Value = fio;
            command.Parameters.Add("@s", MySqlDbType.VarChar).Value = staj;
            command.Parameters.Add("@c", MySqlDbType.VarChar).Value = city;

            adapter.SelectCommand = command;
            adapter.Fill(table);
            if (table.Rows.Count > 0)
                MessageBox.Show("Сведенья о данном водителе найдены");
            else
                MessageBox.Show("Сведенья о данном водителе не найдены");
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

        private void button2_Click(object sender, EventArgs e)
        {
            String fio = fiopole.Text;
            String staj = stajpole.Text;
            String city = citypole.Text;

            BD db = new BD();
            MySqlCommand command = new MySqlCommand("INSERT INTO `drivers_in_cities` ( `FIO`,`driving_experience`,`name_of_the_city`) VALUES (@mo,@st,@co)", db.getConnection());
            command.Parameters.Add("@mo", MySqlDbType.VarChar).Value = fio;
            command.Parameters.Add("@st", MySqlDbType.VarChar).Value = staj;
            command.Parameters.Add("@co", MySqlDbType.VarChar).Value = city;

            db.openConnection();
            if (command.ExecuteNonQuery() == 1)
                MessageBox.Show("Данные были добавлены");
            else
                MessageBox.Show("Данные не были добавлены. Попробуйте ещё раз");
            db.closeConnection();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            String fio = fiopole.Text;
            String staj = stajpole.Text;
            String city = citypole.Text;

            BD db = new BD();

            MySqlCommand command = new MySqlCommand("DELETE FROM `drivers_in_cities` WHERE `FIO` = @mod AND `driving_experience`=@sta AND `name_of_the_city`=@col", db.getConnection());
            command.Parameters.Add("@mod", MySqlDbType.VarChar).Value = fio;
            command.Parameters.Add("@sta", MySqlDbType.VarChar).Value = staj;
            command.Parameters.Add("@col", MySqlDbType.VarChar).Value = city;

            db.openConnection();
            if (command.ExecuteNonQuery() == 1)
                MessageBox.Show("Данные были удалены");
            else
                MessageBox.Show("Такой записи не существует. Попробуйте ещё раз");
            db.closeConnection();
        }

        private void label6_Click(object sender, EventArgs e)
        {
            this.Hide();
            registratsiaForm registr = new registratsiaForm();
            registr.Show();
        }
    }
}
