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
	public partial class Home : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			// Check if user is logged in
			if (Session["UserID"] == null) // User not logged in, display Login Button
			{
				lblLogin.Visible = true;
				btnLogin.Visible = true;

				lblHelloUser.Visible = false;
				btnLogout.Visible = false;
			}
			else // User logged in, display Logout Button
			{
				lblLogin.Visible = false;
				btnLogin.Visible = false;

				lblHelloUser.Visible = true;
				btnLogout.Visible = true;

				// Get username and display
				getUsername();
				// Check if user is an admin to display Edit Databases Button
				checkAdmin();
			}
		}

		// Get user's username from database and display
		private void getUsername()
		{
			SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TKCS"].ConnectionString);
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

		// Check if the user is an admin and display the Edit Databases Button if true
		private void checkAdmin()
		{
			SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TKCS"].ConnectionString);
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

		// Login Button to redirect to Login screen
		protected void btnLogin_Click(object sender, EventArgs e)
		{
			Response.Redirect("Login.aspx");
		}

		// Logout Button for user to logout
		protected void btnLogout_Click(object sender, EventArgs e)
		{
			Session["UserID"] = null;
			Response.Redirect("Home.aspx");
		}

		// Edit Databases Button to redirect admins to edit hub
		protected void btnEdit_Click(object sender, EventArgs e)
		{
			Response.Redirect("Edit.aspx");
		}
	}
}