using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MySentFile : System.Web.UI.Page
{
    FileSystemEntities db;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            db = new FileSystemEntities();
            if (Request.QueryString["sectionid"] != null)
            {
                Search();
            }
            else
            {
                Response.Redirect("trainerprofile.aspx");
            }
        }
    }

    private void Search()
    {
        int sectionid = Convert.ToInt32(Request.QueryString["sectionid"]);
        var section = db.Section.Where(i => i.SectionID == sectionid).SingleOrDefault();
        lblSectionTitle.Text = section.Courses.Name + "[ " + section.TimeFrom + "-" + section.TimeTo + " ]";
        // returns files that belong to section
        repFiles.DataSource = db.Files.Where(i => i.SectionID == sectionid && i.IsDeleted == false).ToList();
        repFiles.DataBind();
    }

    protected string GetReceipients(string fid)
    {
        db = new FileSystemEntities();
        int fileid = Convert.ToInt32(fid);
        var recepients = db.FileWho.Where(i => i.FileID == fileid).ToList();

        

        string result = "";

        foreach(var item in recepients)
        {
           

            string studentName = item.Student.First_Name + " " + item.Student.Last_Name;

            
               result += " <span class='btn btn-default btn-xs inline' data-studentid='" + item.StudentID + "' style='width:90px; margin-bottom:6px;' >" + studentName + "</span> ";
            
        }


        return result;
        


    }


    protected void repFiles_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        db = new FileSystemEntities();
        int fileid = Convert.ToInt32(e.CommandArgument.ToString());
        var f = db.Files.Where(i => i.ID == fileid).SingleOrDefault();

        if (e.CommandName == "edit")
        {
            Response.Redirect("sendfile.aspx?sectionid="+f.SectionID+"&fileid=" + fileid + "&mode=edit");

       
        }
        else
        {

             var filewho = db.FileWho.Where(i => i.FileID == fileid).ToList();
             db.FileWho.RemoveRange(filewho);
             db.SaveChanges();
             var file = db.Files.Find(fileid);
             db.Files.Remove(file);
             db.SaveChanges();
             Search();

              //// Do Edit to IsDeleted Instead of delete
              // var file = db.Files.Find(fileid);
              // file.IsDeleted = true;
              // db.Entry(file).State = System.Data.Entity.EntityState.Modified;
              // db.SaveChanges();
              // Search();
              
        }
    }




    protected string GetReceipientsDown(string fid)
    {
        db = new FileSystemEntities();
       int fileid = Convert.ToInt32(fid);
        var recepients = db.FileWho.Where(i => i.IsDownloaded== true && i.FileID == fileid).ToList();



        string result = "";

        foreach (var item in recepients)   
        {

            string studentName = item.Student.First_Name + " " + item.Student.Last_Name;


            result += "<span   class='btn btn-primary btn-xs inline '   data-studentid='" + item.StudentID + "' style='width:80px; margin-bottom:6px; ' >" + studentName + "</span>";


        }

        return result;





    }






}