using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public class StudentModel
{
    public int ID { get; set; }
    public string Name { get; set; }
}

public partial class SendFile : System.Web.UI.Page
{
    FileSystemEntities db = new FileSystemEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["sectionid"] != null)
            {

                int sectionID = Convert.ToInt32(Request.QueryString["sectionid"]);
                FillStudent(sectionID);
             }
            if(Request.QueryString["sectionid"] != null &&  Request.QueryString["mode"] != null && Request.QueryString["fileid"]!= null )
            {
                int fileid = Convert.ToInt32(Request.QueryString["fileid"]);
                var filewho = db.FileWho.Where(i => i.FileID == fileid).ToList();
                foreach(ListItem item in cblStudent.Items)
                {
                    if( filewho.Where(i=>i.StudentID == int.Parse(item.Value)).Count() > 0)
                    {
                        item.Selected = true;
                    }
                }
                txtDescription.Text = db.Files.Where(i => i.ID == fileid).SingleOrDefault().Description;
            }
        }
    }

    private void FillStudent(int sectionID)
    {

        List<StudentModel> Students = new List<StudentModel>();
        List<StudentSection> enSt = db.StudentSection.Where(i => i.SectionID == sectionID).ToList();

        foreach(var item in enSt)
        {
          var student = db.Student.Find(item.StudenID);
            Students.Add(
                new StudentModel
                      {
                         ID = student.ID,
                         Name = student.First_Name + " " + student.Last_Name
                      }
                );
        }
        cblStudent.DataSource = Students;
        cblStudent.DataTextField = "Name";
        cblStudent.DataValueField = "ID";
        cblStudent.DataBind();
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        // save file into file table
        // generate file name
        if (Request.QueryString["mode"] != null && Request.QueryString["fileid"] != null)
        {
            db = new FileSystemEntities();
            int fileid = Convert.ToInt32(Request.QueryString["fileid"]);
            var f = db.Files.Where(i => i.ID == fileid ).SingleOrDefault();

            var filewho = db.FileWho.Where(i => i.FileID == fileid).ToList();
            db.FileWho.RemoveRange(filewho);
            foreach (ListItem item in cblStudent.Items)
            {
                if (item.Selected)
                {

                    FileWho fw = new FileWho();
                    fw.FileID = f.ID;
                    fw.StudentID = Convert.ToInt32(item.Value);
                    fw.IsDownloaded = false;
                    db.FileWho.Add(fw);
                    f.Description = txtDescription.Text;
                 
                    db.SaveChanges();
                }
            }

            Response.Redirect("mysentfile.aspx?sectionid=" + f.SectionID);
        }
        else
        {
            Account a = (Account)Session["user"];
            string filename = a.ID.ToString() + "_" + new Random().Next(10000, 10000000).ToString() + "_" + DateTime.Now.Millisecond.ToString() + System.IO.Path.GetExtension(fuURL.FileName);
            // save to who file is sent
            Files f = new Files();
            f.URL = filename;
            f.Description = txtDescription.Text;
            f.SectionID = Convert.ToInt32(Request.QueryString["sectionid"]);
            f.IsDeleted = false;
            f.DateAdded = DateTime.Now;
            // save on server
            fuURL.SaveAs(Server.MapPath("~/Contents/Uploads/" + filename));
            db.Files.Add(f);
            db.SaveChanges();


            // send to who this file is sent
            db = new FileSystemEntities();

            foreach (ListItem item in cblStudent.Items)
            {
                if (item.Selected)
                {

                    FileWho fw = new FileWho();
                    fw.FileID = f.ID;
                    fw.StudentID = Convert.ToInt32(item.Value);
                    fw.IsDownloaded = false;
                    db.FileWho.Add(fw);
                    db.SaveChanges();
                }
            }

            Response.Redirect("trainerProfile.aspx");
        }
    }

    // protected void btn1_Click(object sender, EventArgs e)
    // {
    //     for (int i = 0; i < cblStudent.Items.Count; i++)
    //     {
    //         //CheckBoxList1.Items[i].Selected = true;
    //     }
    // }

    protected void btn1_Click(object sender, EventArgs e)
    {

        for (int i = 0; i < cblStudent.Items.Count; i++)
        {
            cblStudent.Items[i].Selected = true;
        }
    }
}