using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TraditionKeeper
{
	public partial class EditUsers : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			CheckAdmin();
		}

		protected void btnEditUsersExit_Click(object sender, EventArgs e)
		{
			Response.Redirect("Home.aspx");
		}

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

		private void CheckAdmin()
		{
			if (Session["UserID"] == null)
			{
				Response.Redirect("Login.aspx");
			}
			else
			{
				SqlConnection con = new SqlConnection("Server=tcp:traditionkeeper.database.windows.net,1433;Initial Catalog=TraditionKeeper;Persist Security Info=False;User ID=TraditionAdmin;Password=IslanderForever!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
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