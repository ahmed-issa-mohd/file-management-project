using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentProfile : System.Web.UI.Page
{
    FileSystemEntities db;
    List<StudentSection> StudentSections;

    protected void Page_Load(object sender, EventArgs e)
    {
        Search();
        if (!IsPostBack)
        {
            //FillMajors();
        }
    }

    private void Search()
    {
        
        var user = (Account)Session["user"]; //
        db = new FileSystemEntities();
        int studentID = db.Student.Where(c => c.AccountID == user.ID).SingleOrDefault().ID;

        StudentSections = db.StudentSection.Where(c => c.StudenID == studentID).ToList();
           
        dgSection.DataSource = StudentSections;
        dgSection.DataBind();
        //lblTotalSection.Text = "10";


        lblTotalSection.Text = StudentSections.Count.ToString();
    }

    protected string GetTotalFiles(string sectionId)
    {

        int sid = int.Parse(sectionId);
        db = new FileSystemEntities();
        var sectionFiles = db.Files.Where(i => i.SectionID == sid).ToList();
        // get studentd from login
        var ac = (Account)Session["user"];
        int studentid = db.Student.Where(i => i.AccountID == ac.ID).SingleOrDefault().ID;
        var allowedFiles = db.FileWho.Where(i => i.StudentID == studentid).ToList();
        List<Files> allowed = new List<Files>();
        // filter section files
        foreach (var item in sectionFiles)
        {
            if (allowedFiles.Where(i => i.FileID == item.ID).Count() > 0)
            {
                allowed.Add(item);
            }
        }
        return allowed.Count().ToString();
    }
}