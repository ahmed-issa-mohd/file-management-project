using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        FileSystemEntities db = new FileSystemEntities();
        if (!IsPostBack)
        {
            if (Session["user"] != null)
            {
               Account ac = (Account)Session["user"];
               txtName.Text = ac.Email;
               txtPass.Text = ac.UserName;
            }
        }

    }





    protected void btnSave_Click(object sender, EventArgs e)
    {

        FileSystemEntities db = new FileSystemEntities();
        if (Session["user"] !=null)
        {
            
            Account ac = (Account)Session["user"];
                     
                     Account old = db.Account.Find(ac.ID);
            //Account f = db.Account(ac);
            
                       
                       old.UserName = txtName.Text;




        }
    }
}


