using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    [WebMethod]
    public void updateSeen(string fileId , string userId)
    {
        
        FileSystemEntities db = new FileSystemEntities();
        int fid = Convert.ToInt32(fileId);
        int uid = Convert.ToInt32(userId);
        int studentId = db.Student.Where(i => i.AccountID ==  uid).SingleOrDefault().ID;
        var fileWho = db.FileWho.Where(i => i.FileID == fid && i.StudentID == studentId).SingleOrDefault();
        fileWho.IsDownloaded = true;
        db.Entry(fileWho).State = System.Data.Entity.EntityState.Modified;
        db.SaveChanges();
    }

}
