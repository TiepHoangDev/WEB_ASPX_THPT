using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site.controls
{
    public partial class ucLienKetWebsite : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dtLienKetWebsite.DataSource = new BUS.BUS_TrangLienKet().GetAll();
                dtLienKetWebsite.DataBind();
            }
        }
    }
}