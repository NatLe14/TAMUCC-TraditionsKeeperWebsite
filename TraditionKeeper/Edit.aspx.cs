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

		// Edit Users button to redirect to Edit Users page
		protected void btnEditUsers_Click(object sender, EventArgs e)
		{
			Response.Redirect("EditUsers.aspx");
		}

		// Edit Traditions button to redirect to Edit Traditions page
		protected void btnEditTraditions_Click(object sender, EventArgs e)
		{
			Response.Redirect("EditTraditions.aspx");
		}

		// Edit Buildings button to redirect to Edit Buildings page
		protected void btnEditBuildings_Click(object sender, EventArgs e)
		{
			Response.Redirect("EditBuildings.aspx");
		}

		// Edit Prizes button to redirect to Edit Prizes page
		protected void btnEditPrizes_Click(object sender, EventArgs e)
		{
			Response.Redirect("EditPrizes.aspx");
		}

		// Return Home button to redirect to Home page
		protected void btnReturnHome_Click(object sender, EventArgs e)
		{
			Response.Redirect("Home.aspx");
		}
	}
}