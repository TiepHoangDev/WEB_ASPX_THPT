using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site.admin.qllk
{
    public partial class dslienket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Showdata();
            }
            Label1.Text = "";
        }


        private void Showdata(string search = "")
        {
            var lst = new BUS.BUS_TrangLienKet().GetAll();
            if (!string.IsNullOrWhiteSpace(search)) lst = lst.Where(q => q.TenSite.ToLower().Contains(search)).ToList();
            GridView1.DataSource = lst;
            GridView1.DataBind();

        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            Showdata(TextBox1.Text);
        }

        protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Showdata();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            Response.Redirect("lienket.aspx");
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "xoa")
            {
                Label1.Text = new BUS.BUS_TrangLienKet().Delete(Convert.ToInt32(e.CommandArgument.ToString()))
                    ? "<img style='vertical-align:middle' src='/admin/images/tick.png'/> Xóa thành công"
                    : "<img style='vertical-align:middle' src='/admin/images/error.png'/> Xóa thất bại";
                Showdata();
            }
        }
    }
}