using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    FileSystemEntities db;
    List<Section> TrainerSections;
    
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
        int trainerID = db.Trainer.Where(c => c.AccountID == user.ID).SingleOrDefault().ID;
       
        TrainerSections  = db.Section.Where(c => c.TrainerID == trainerID).ToList();

        dgTrainers.DataSource = TrainerSections;
        dgTrainers.DataBind();
        lblTotalSection.Text = TrainerSections.Count.ToString();
    }

    protected string GetTotalStudent(string sectionId)
    {

        int sid = int.Parse(sectionId);
        db = new FileSystemEntities();

        return db.StudentSection.Where(c => c.SectionID == sid).Count().ToString();
       // return db.StudentSection.Where(c => c.SectionID == sid).Count().ToString();
    }

    protected string GetTotalFiles(string sectionId)
    {
         
        int sid = int.Parse(sectionId);
        db = new FileSystemEntities();

        return db.Files.Where(c => c.SectionID == sid).Count().ToString();
    }


    protected void dgTrainers_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int sectionid = Convert.ToInt32(((LinkButton)e.Item.FindControl("lbSend")).CommandArgument.ToString());
        if (e.CommandName == "sendfile")
        {
            Response.Redirect("sendfile.aspx?sectionid=" + sectionid);
        }
        else
        {
            Response.Redirect("mysentfile.aspx?sectionid=" + sectionid);

        }

    }
}