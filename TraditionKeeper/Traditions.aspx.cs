using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TraditionKeeper
{
	public partial class Traditions : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		protected void btnLogin_Click(object sender, EventArgs e)
		{
			Response.Redirect("Login.aspx");
		}
		protected void btnLogout_Click(object sender, EventArgs e)
		{
			Session["UserID"] = null;
			Response.Redirect("Home.aspx");
		}

		protected void btnEdit_Click(object sender, EventArgs e)
		{
			Response.Redirect("Edit.aspx");
		}
	}
}