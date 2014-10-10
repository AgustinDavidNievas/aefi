namespace FrbaHotel.Vistas.Login
{
    partial class frmLog
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
            this.cmbTipoUser = new System.Windows.Forms.ComboBox();
            this.lblBienvenida = new System.Windows.Forms.Label();
            this.lblElegirUsuario = new System.Windows.Forms.Label();
            this.btnSiguiente = new System.Windows.Forms.Button();
            this.btnSalir = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // cmbTipoUser
            // 
            this.cmbTipoUser.FormattingEnabled = true;
            this.cmbTipoUser.Location = new System.Drawing.Point(131, 99);
            this.cmbTipoUser.Name = "cmbTipoUser";
            this.cmbTipoUser.Size = new System.Drawing.Size(121, 21);
            this.cmbTipoUser.TabIndex = 0;
            this.cmbTipoUser.SelectedIndexChanged += new System.EventHandler(this.cmbTipoUser_SelectedIndexChanged);
            // 
            // lblBienvenida
            // 
            this.lblBienvenida.AutoSize = true;
            this.lblBienvenida.Location = new System.Drawing.Point(61, 47);
            this.lblBienvenida.Name = "lblBienvenida";
            this.lblBienvenida.Size = new System.Drawing.Size(153, 13);
            this.lblBienvenida.TabIndex = 1;
            this.lblBienvenida.Text = "BIENVENIDO A FRBA HOTEL";
            // 
            // lblElegirUsuario
            // 
            this.lblElegirUsuario.AutoSize = true;
            this.lblElegirUsuario.Location = new System.Drawing.Point(12, 102);
            this.lblElegirUsuario.Name = "lblElegirUsuario";
            this.lblElegirUsuario.Size = new System.Drawing.Size(112, 13);
            this.lblElegirUsuario.TabIndex = 2;
            this.lblElegirUsuario.Text = "Elija el tipo de usuario:";
            // 
            // btnSiguiente
            // 
            this.btnSiguiente.Location = new System.Drawing.Point(177, 205);
            this.btnSiguiente.Name = "btnSiguiente";
            this.btnSiguiente.Size = new System.Drawing.Size(75, 23);
            this.btnSiguiente.TabIndex = 3;
            this.btnSiguiente.Text = "SIGUIENTE";
            this.btnSiguiente.UseVisualStyleBackColor = true;
            this.btnSiguiente.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnSalir
            // 
            this.btnSalir.Location = new System.Drawing.Point(31, 205);
            this.btnSalir.Name = "btnSalir";
            this.btnSalir.Size = new System.Drawing.Size(75, 23);
            this.btnSalir.TabIndex = 4;
            this.btnSalir.Text = "SALIR";
            this.btnSalir.UseVisualStyleBackColor = true;
            this.btnSalir.Click += new System.EventHandler(this.btnSalir_Click_1);
            // 
            // frmLog
            // 
            this.AcceptButton = this.btnSiguiente;
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(284, 262);
            this.Controls.Add(this.btnSalir);
            this.Controls.Add(this.btnSiguiente);
            this.Controls.Add(this.lblElegirUsuario);
            this.Controls.Add(this.lblBienvenida);
            this.Controls.Add(this.cmbTipoUser);
            this.Name = "frmLog";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FRBA HOTEL";
            this.Load += new System.EventHandler(this.frmLog_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cmbTipoUser;
        private System.Windows.Forms.Label lblBienvenida;
        private System.Windows.Forms.Label lblElegirUsuario;
        private System.Windows.Forms.Button btnSiguiente;
        private System.Windows.Forms.Button btnSalir;
    }
}