
namespace DataBaze
{
    partial class Driver_Table
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.the_serial_number_of_the_passport = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.FIO = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.driving_experience = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.name_of_the_city = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.button1 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.the_serial_number_of_the_passport,
            this.FIO,
            this.driving_experience,
            this.name_of_the_city});
            this.dataGridView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView1.Location = new System.Drawing.Point(0, 0);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(800, 450);
            this.dataGridView1.TabIndex = 0;
            // 
            // the_serial_number_of_the_passport
            // 
            this.the_serial_number_of_the_passport.HeaderText = "the_serial_number_of_the_passport";
            this.the_serial_number_of_the_passport.Name = "the_serial_number_of_the_passport";
            // 
            // FIO
            // 
            this.FIO.HeaderText = "FIO";
            this.FIO.Name = "FIO";
            // 
            // driving_experience
            // 
            this.driving_experience.HeaderText = "driving_experience";
            this.driving_experience.Name = "driving_experience";
            // 
            // name_of_the_city
            // 
            this.name_of_the_city.HeaderText = "name_of_the_city";
            this.name_of_the_city.Name = "name_of_the_city";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(28, 415);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 1;
            this.button1.Text = "Вернуться";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Driver_Table
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Driver_Table";
            this.Text = "Driver_Table";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn the_serial_number_of_the_passport;
        private System.Windows.Forms.DataGridViewTextBoxColumn FIO;
        private System.Windows.Forms.DataGridViewTextBoxColumn driving_experience;
        private System.Windows.Forms.DataGridViewTextBoxColumn name_of_the_city;
        private System.Windows.Forms.Button button1;
    }
}