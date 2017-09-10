using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site
{
    public partial class tintuc : System.Web.UI.Page
    {
        public string sPage { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            int index = 1;
            if (Request.QueryString["page"] != null) int.TryParse(Request.QueryString["page"].ToString(), out index);
            var data = new BUS.BUS_BaiViet().LayDSBaiViet("", 3);
            SetPage(index - 1, data.Rows.Count);
            data = data.Rows.Cast<DataRow>().Skip(10 * (index - 1)).Take(10).CopyToDataTable();
            rptTinTuc.DataSource = data;
            DataBind();
        }

        string SetPage(int index, int cout)
        {
            if (cout > 0)
            {
                sPage = "<ul class='pages'>";
                for (int i = 0; i < cout; i += 10)
                {
                    sPage += string.Format("<a href='/tintuc.aspx?page={1}'><li {0}>{1}</li></a>", i / 10 == index ? "class='active'" : "", i / 10 + 1);
                }
                sPage += "</ul>";
            }
            return sPage;
        }
    }
}