using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace BusinessService
{
    public partial class DocManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFiles)
            {
                string fileName = FileUpload1.FileName;
                FileUpload1.PostedFile
                    .SaveAs(Server.MapPath("~/Data/") + fileName);
            }

            DataTable dt = new DataTable();
            dt.Columns.Add("File");
            dt.Columns.Add("Size");
            dt.Columns.Add("Type");

            foreach (string strfile in Directory.GetFiles(Server.MapPath("~/Data")))
            {
                FileInfo fi = new FileInfo(strfile);
                dt.Rows.Add(fi.Name, fi.Length.ToString(),
                    GetFileTypeByExtension(fi.Extension));
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private string GetFileTypeByExtension(string fileExtension)
        {
            switch (fileExtension.ToLower())
            {
                case ".docx":
                case ".doc":
                    return "Word File";
                case ".xlsx":
                case ".xls":
                    return "Excel File";
                default:
                    return "Unknown";
            }
        }

        protected void GridView1_RowCommand(object sender,
            GridViewCommandEventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "filename="
                + e.CommandArgument);
            Response.TransmitFile(Server.MapPath("~/Data/")
                + e.CommandArgument);
            Response.End();
        }

    }

}