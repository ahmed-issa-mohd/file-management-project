using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class changepassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            Account ac = (Account)Session["user"];
            if (txtOldPassword.Text != ac.Password)
            {
                lblResult.ForeColor = System.Drawing.Color.Tomato;
                lblResult.Text = "your old password is incorrect";



                txtNewPassword.ForeColor = System.Drawing.Color.Tomato;
                

            }
            else
            {
                FileSystemEntities db = new FileSystemEntities();
                Account oldac = db.Account.Find(ac.ID);
                oldac.Password = txtNewPassword.Text;

                db.Entry(oldac).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                lblResult.ForeColor = System.Drawing.Color.LimeGreen;
                lblResult.Text = "saved successfully";
            }
        }
    }
}