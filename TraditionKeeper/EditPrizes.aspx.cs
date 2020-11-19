using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace TraditionKeeper
{
	public partial class EditPrizes : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			// Check if the user is an admin to access this page
			CheckAdmin();
		}

		// Exit button to exit page and return to Home page
		protected void btnEditPrizesExit_Click(object sender, EventArgs e)
		{
			Response.Redirect("Home.aspx");
		}

		// Insert label button to insert new information to database
		protected void lbtnInsert_Click(object sender, EventArgs e)
		{
			SqlDataSource1.InsertParameters["PRIZ_Name"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtInsertPrizeName")).Text;
			SqlDataSource1.InsertParameters["PRIZ_Description"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtInsertPrizeDescription")).Text;

			SqlDataSource1.Insert();
		}

		// Check if the user is an admin, if not, redirect the user to Login page to login or Home page if logged in
		private void CheckAdmin()
		{
			if (Session["UserID"] == null)
			{
				Response.Redirect("Login.aspx");
			}
			else
			{
				SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TKCS"].ConnectionString);
				SqlCommand cmd = new SqlCommand("SELECT (USER_IsAdmin) FROM [User] WHERE USER_ID = @ID", con);
				cmd.Parameters.AddWithValue("@ID", Session["UserID"]);
				bool isAdmin;

				con.Open();
				try
				{
					isAdmin = Convert.ToBoolean(cmd.ExecuteScalar());

					if (!isAdmin)
					{
						Response.Redirect("Home.aspx");
					}
				}
				catch
				{
					Response.Redirect("Home.aspx");
				}
				con.Close();
			}
		}
	}
}