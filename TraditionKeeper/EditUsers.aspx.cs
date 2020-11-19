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
	public partial class EditUsers : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			// Check if the user is an admin to access this page
			CheckAdmin();
		}

		// Exit button to exit page and return to Home page
		protected void btnEditUsersExit_Click(object sender, EventArgs e)
		{
			Response.Redirect("Home.aspx");
		}

		// Insert label button to insert new information to database
		protected void lbtnInsert_Click(object sender, EventArgs e)
		{
			SqlDataSource1.InsertParameters["USER_ANumber"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtInsertANumber")).Text;
			SqlDataSource1.InsertParameters["USER_FName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtInsertFName")).Text;
			SqlDataSource1.InsertParameters["USER_LName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtInsertLName")).Text;
			SqlDataSource1.InsertParameters["USER_Username"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtInsertUsername")).Text;
			SqlDataSource1.InsertParameters["USER_Password"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtInsertPassword")).Text;
			SqlDataSource1.InsertParameters["USER_Email"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtInsertEmail")).Text;
			SqlDataSource1.InsertParameters["USER_Class"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtInsertClass")).Text;
			SqlDataSource1.InsertParameters["USER_TraditionCount"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("ddlInsertTradCount")).SelectedValue;
			if (((CheckBox)GridView1.FooterRow.FindControl("ckbInsertAdmin")).Checked)
			{
				SqlDataSource1.InsertParameters["USER_IsAdmin"].DefaultValue = "True";
			}
			else
			{
				SqlDataSource1.InsertParameters["USER_IsAdmin"].DefaultValue = "False";
			}

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