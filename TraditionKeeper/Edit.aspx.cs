using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TraditionKeeper
{
	public partial class Edit : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void btnEditUsers_Click(object sender, EventArgs e)
		{
			Response.Redirect("EditUsers.aspx");
		}

		protected void btnEditTraditions_Click(object sender, EventArgs e)
		{
			Response.Redirect("EditTraditions.aspx");
		}

		protected void btnEditBuildings_Click(object sender, EventArgs e)
		{
			Response.Redirect("EditBuildings.aspx");
		}

		protected void btnEditPrizes_Click(object sender, EventArgs e)
		{
			Response.Redirect("EditPrizes.aspx");
		}
	}
}