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
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			
		}

		// Get the username and Password entered and check if that user is in the database for logging in
		protected void btnSubmit_Click(object sender, EventArgs e)
		{
			string username = txtUsername.Text;
			string password = txtPassword.Text;
			int UserID;

			SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TKCS"].ConnectionString);
			SqlCommand cmd = new SqlCommand("SELECT (USER_ID) FROM [User] WHERE (USER_Username) = (@Username) AND (USER_Password) = (@Password)", con);
			cmd.Parameters.AddWithValue("@Username", username);
			cmd.Parameters.AddWithValue("@Password", password);

			con.Open();
			try // Check to see if the username exists in the database
			{
				if (cmd.ExecuteScalar() != null) // Try login, see if it's good
				{
					UserID = Convert.ToInt32(cmd.ExecuteScalar());
					Session["UserID"] = UserID;
					lblLoginFailed.Visible = false;
					Response.Redirect("Home.aspx");
				}
				else // Wrong information was entered
				{
					lblLoginFailed.Visible = true;
					lblLoginFailed.Text = "Incorrect Username or Password!";
				}

			}
			catch // Error
			{
				lblLoginFailed.Visible = true;
				lblLoginFailed.Text = "An Error Occured!";
			}
			finally
			{
				con.Close();
			}
		}

		// Cancel Button to cancel login and redirect to Home page
		protected void btnCancel_Click(object sender, EventArgs e)
		{
			Response.Redirect("Home.aspx");
		}
	}
}