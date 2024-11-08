using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Phu_NET.Chuong5
{
    public partial class Ex2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblSend.Text = "The page is valid";
            }
            else
            {
                lblSend.Text = "Please fix the errors above.";
                lblSend.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}