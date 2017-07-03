using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sectionDetails : System.Web.UI.Page
{
    FileSystemEntities db = new FileSystemEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["sectionid"] != null)
            {
                int sid = Convert.ToInt32(Request.QueryString["sectionid"]);
                var section = db.Section.Find(sid);
                lblTrainerName.Text = section.Trainer.First_Name + " " + section.Trainer.Last_Name;
                lblCourse.Text = section.Courses.Name;
                string days = "";
                if (section.Sunday)
                {
                    days += " sun";
                }
                if (section.Monday)
                {
                    days += " mod";
                }
                if (section.Tuesday)
                {
                    days += " tue";
                }
                if (section.Wednesday)
                {
                    days += " wed";
                }
                if (section.Thursday)
                {
                    days += " thu";
                }
                if (section.Friday)
                {
                    days += " fri";
                }
                if (section.Saturday)
                {
                    days += " sat";
                }

                lblDays.Text = days;
                lblTime.Text = section.TimeFrom + " - " + section.TimeTo;
                // all files to this section
                var sectionFiles = db.Files.Where(i => i.SectionID == sid).ToList();
                // get studentd from login
                var ac = (Account)Session["user"];
                int studentid =  db.Student.Where(i => i.AccountID == ac.ID).SingleOrDefault().ID;
                var allowedFiles = db.FileWho.Where(i => i.StudentID == studentid).ToList();
                List<Files> allowed = new List<Files>(); 
                // filter section files
                foreach(var item in sectionFiles)
                {
                    if(allowedFiles.Where(i=>i.FileID == item.ID).Count() > 0)
                    {
                        allowed.Add(item);
                    }
                }
                repFiles.DataSource = allowed;
                repFiles.DataBind();
            }
            else
            {
                Response.Redirect("studentprofile.aspx");
            }
        }
    }
}