namespace FrbaHotel.Login
{
    partial class FrmLogIn
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
            this.lblUsuario = new System.Windows.Forms.Label();
            this.txbUsuario = new System.Windows.Forms.TextBox();
            this.lblContraseña = new System.Windows.Forms.Label();
            this.txbContrasena = new System.Windows.Forms.TextBox();
            this.entrarBtn = new System.Windows.Forms.Button();
            this.invitadoBtn = new System.Windows.Forms.Button();
            this.salirBtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lblUsuario
            // 
            this.lblUsuario.AutoSize = true;
            this.lblUsuario.Location = new System.Drawing.Point(25, 52);
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(46, 13);
            this.lblUsuario.TabIndex = 1;
            this.lblUsuario.Text = "Usuario:";
            this.lblUsuario.Click += new System.EventHandler(this.lblElegirRol_Click);
            // 
            // txbUsuario
            // 
            this.txbUsuario.Location = new System.Drawing.Point(93, 52);
            this.txbUsuario.Name = "txbUsuario";
            this.txbUsuario.Size = new System.Drawing.Size(166, 20);
            this.txbUsuario.TabIndex = 2;
            // 
            // lblContraseña
            // 
            this.lblContraseña.AutoSize = true;
            this.lblContraseña.Location = new System.Drawing.Point(25, 103);
            this.lblContraseña.Name = "lblContraseña";
            this.lblContraseña.Size = new System.Drawing.Size(64, 13);
            this.lblContraseña.TabIndex = 3;
            this.lblContraseña.Text = "Contraseña:";
            // 
            // txbContrasena
            // 
            this.txbContrasena.Location = new System.Drawing.Point(93, 103);
            this.txbContrasena.Name = "txbContrasena";
            this.txbContrasena.Size = new System.Drawing.Size(166, 20);
            this.txbContrasena.TabIndex = 4;
            // 
            // entrarBtn
            // 
            this.entrarBtn.Location = new System.Drawing.Point(28, 152);
            this.entrarBtn.Name = "entrarBtn";
            this.entrarBtn.Size = new System.Drawing.Size(95, 34);
            this.entrarBtn.TabIndex = 5;
            this.entrarBtn.Text = "Entrar";
            this.entrarBtn.UseVisualStyleBackColor = true;
            // 
            // invitadoBtn
            // 
            this.invitadoBtn.Location = new System.Drawing.Point(169, 152);
            this.invitadoBtn.Name = "invitadoBtn";
            this.invitadoBtn.Size = new System.Drawing.Size(103, 34);
            this.invitadoBtn.TabIndex = 6;
            this.invitadoBtn.Text = "Entrar Como Invitado";
            this.invitadoBtn.UseVisualStyleBackColor = true;
            // 
            // salirBtn
            // 
            this.salirBtn.Location = new System.Drawing.Point(93, 213);
            this.salirBtn.Name = "salirBtn";
            this.salirBtn.Size = new System.Drawing.Size(116, 36);
            this.salirBtn.TabIndex = 7;
            this.salirBtn.Text = "Salir";
            this.salirBtn.UseVisualStyleBackColor = true;
            this.salirBtn.Click += new System.EventHandler(this.button1_Click);
            // 
            // FrmLogIn
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.salirBtn);
            this.Controls.Add(this.invitadoBtn);
            this.Controls.Add(this.entrarBtn);
            this.Controls.Add(this.txbContrasena);
            this.Controls.Add(this.lblContraseña);
            this.Controls.Add(this.txbUsuario);
            this.Controls.Add(this.lblUsuario);
            this.Name = "FrmLogIn";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FrmLogIn";
            this.Load += new System.EventHandler(this.FrmLogIn_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblUsuario;
        private System.Windows.Forms.TextBox txbUsuario;
        private System.Windows.Forms.Label lblContraseña;
        private System.Windows.Forms.TextBox txbContrasena;
        private System.Windows.Forms.Button entrarBtn;
        private System.Windows.Forms.Button invitadoBtn;
        private System.Windows.Forms.Button salirBtn;
    }
}