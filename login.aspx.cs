using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        FileSystemEntities db = new FileSystemEntities();


    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        FileSystemEntities db = new FileSystemEntities();
         
        string email = txtEmail.Text;
        string password = txtPassword.Text;

        
        Account user = db.Account
                       .Where(i => i.Email == email && i.Password == password)
                       
                       .SingleOrDefault(); 
        if (user != null)
        {
            
            Session["user"] = user;

            if (user.UserType == 2)
            {
                Response.Redirect("TrainerProfile.aspx");
            }
            else
            {
                Response.Redirect("StudentProfile.aspx");
            }
        }


        else
        {
            lblErrorMsg.Text = "invalid Email and / or password";

            // display error message
        }


    }
}



