using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TraditionKeeper
{
	public partial class Home : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["UserID"] == null)
			{
				lblLogin.Visible = true;
				btnLogin.Visible = true;

				lblHelloUser.Visible = false;
				btnLogout.Visible = false;
			}
			else
			{
				lblLogin.Visible = false;
				btnLogin.Visible = false;

				lblHelloUser.Visible = true;
				btnLogout.Visible = true;

				getUsername();
				checkAdmin();
			}
		}

		private void getUsername()
		{
			SqlConnection con = new SqlConnection("Server=tcp:traditionkeeper.database.windows.net,1433;Initial Catalog=TraditionKeeper;Persist Security Info=False;User ID=TraditionAdmin;Password=IslanderForever!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
			SqlCommand cmd = new SqlCommand("SELECT (USER_Username) FROM [User] WHERE USER_ID = @ID", con);
			cmd.Parameters.AddWithValue("@ID", Session["UserID"]);
			string username;

			con.Open();
			try
			{
				username = Convert.ToString(cmd.ExecuteScalar());
				lblHelloUser.Text = "Hello, " + username;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}
			finally
			{
				con.Close();
			}
		}

		private void checkAdmin()
		{
			SqlConnection con = new SqlConnection("Server=tcp:traditionkeeper.database.windows.net,1433;Initial Catalog=TraditionKeeper;Persist Security Info=False;User ID=TraditionAdmin;Password=IslanderForever!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
			SqlCommand cmd = new SqlCommand("SELECT (USER_IsAdmin) FROM [User] WHERE USER_ID = @ID", con);
			cmd.Parameters.AddWithValue("@ID", Session["UserID"]);
			bool isAdmin;

			con.Open();
			try
			{
				isAdmin = Convert.ToBoolean(cmd.ExecuteScalar());
				
				if (isAdmin == true)
				{
					btnEdit.Visible = true;
				}
				else
				{
					btnEdit.Visible = false;
				}
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}
			finally
			{
				con.Close();
			}
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