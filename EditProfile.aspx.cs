using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        
        txtEmail.BackColor = System.Drawing.Color.LawnGreen;
        txtUserName.BackColor = System.Drawing.Color.LawnGreen;


        if (!IsPostBack)
        {
            if (Session["user"] != null)
            {
                Account ac = (Account)Session["user"];
                txtEmail.Text = ac.Email;
                txtUserName.Text = ac.UserName;
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        FileSystemEntities db = new FileSystemEntities();
        if(Session["user"] != null )
        {


                    //  Account ac = db.Account
                    //  .Where(i => i.Email == email && i.Password == password)
                    
                    //  .SingleOrDefault();


            Account ac = (Account)Session["user"];


            Account oldac = db.Account.Find(ac.ID);

            
            
                
            oldac.UserName = txtUserName.Text;
            oldac.Email = txtEmail.Text;



            db.Entry(oldac).State = System.Data.Entity.EntityState.Modified;
            
            db.SaveChanges();
           
            lblResult.ForeColor = System.Drawing.Color.LimeGreen;
            lblResult.Text = "Saved Successfully";
            Session["user"] = oldac;

        } 
        else
        {
            lblResult.ForeColor = System.Drawing.Color.Tomato;
            lblResult.Text = "sorry can not edit your info please try again later";
        }
    }

    protected void get()
    {

        
    }
}