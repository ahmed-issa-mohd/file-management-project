using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {


            Account user = (Account)Session["user"];// convert session to object
            lbLogin.Text = "logout";
            lblUserName.Text = user.UserName;



        }
        else
        {
            lblUserName.Text = "annonymous";
            lbLogin.Text = "login";
        }
    }

    protected void lbLogin_Click(object sender, EventArgs e)
    {
        if (lbLogin.Text != "login")
        {
            Session["user"] = null;
            Response.Redirect("HomePage.aspx");
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }

    protected string GetLink()
    { 
        if(Session["user"] != null)
        {
            Account ac = (Account)Session["user"];
            if(ac.UserType == 1)
            {
                return "Studentprofile.aspx";

            } 
            else
            {
                return "trainerprofile.aspx";
            }
        }
        else
        {
            return "login.aspx";



        }
    }









    protected string GetLinkEdit()
    {
        if (Session["user"] != null)
        {
            Account ac = (Account)Session["user"];
            if (ac.UserType == 1)
            {
                return "EditProfile.aspx";
            }
            else
            {
                return "EditProfile.aspx";
            }
        }
        else
        {
            return "login.aspx";
        }
    }


}
