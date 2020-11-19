using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services.Description;
using System.Configuration;

namespace TraditionKeeper
{
	public partial class Prizes : System.Web.UI.Page
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
			}

			// Display Prize Information
			getPrizes();
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

		// Get prizes from database and display them
		private void getPrizes()
		{
			SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TKCS"].ConnectionString);
			SqlCommand _cmd = new SqlCommand();
			_cmd.CommandType = System.Data.CommandType.Text;
			_cmd.Connection = con;
			con.Open();

			/***********/
			/* Prize 1 */
			/***********/
			
			// Name
			try
			{
				string prizeName;

				_cmd.CommandText = "SELECT (PRIZ_Name) FROM [Prize] WHERE PRIZ_ID = @ID";
				_cmd.Parameters.AddWithValue("@ID", 1);
				prizeName = Convert.ToString(_cmd.ExecuteScalar());
				prize1Name.InnerHtml = prizeName;
				prize1Sidebar.InnerHtml = prizeName;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}

			// Description
			try
			{
				string prizeDescription;

				_cmd.CommandText = "SELECT (PRIZ_Description) FROM [Prize] WHERE PRIZ_ID = @ID";
				prizeDescription = Convert.ToString(_cmd.ExecuteScalar());
				prize1Description.InnerHtml = prizeDescription;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}

			/***********/
			/* Prize 2 */
			/***********/

			// Name
			try
			{
				string prizeName;

				_cmd.CommandText = "SELECT (PRIZ_Name) FROM [Prize] WHERE PRIZ_ID = @ID2";
				_cmd.Parameters.AddWithValue("@ID2", 2);
				prizeName = Convert.ToString(_cmd.ExecuteScalar());
				prize2Name.InnerHtml = prizeName;
				prize2Sidebar.InnerHtml = prizeName;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}

			// Description
			try
			{
				string prizeDescription;

				_cmd.CommandText = "SELECT (PRIZ_Description) FROM [Prize] WHERE PRIZ_ID = @ID2";
				prizeDescription = Convert.ToString(_cmd.ExecuteScalar());
				prize2Description.InnerHtml = prizeDescription;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}

			/***********/
			/* Prize 3 */
			/***********/

			// Name
			try
			{
				string prizeName;

				_cmd.CommandText = "SELECT (PRIZ_Name) FROM [Prize] WHERE PRIZ_ID = @ID3";
				_cmd.Parameters.AddWithValue("@ID3", 3);
				prizeName = Convert.ToString(_cmd.ExecuteScalar());
				prize3Name.InnerHtml = prizeName;
				prize3Sidebar.InnerHtml = prizeName;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}

			// Description
			try
			{
				string prizeDescription;

				_cmd.CommandText = "SELECT (PRIZ_Description) FROM [Prize] WHERE PRIZ_ID = @ID3";
				prizeDescription = Convert.ToString(_cmd.ExecuteScalar());
				prize3Description.InnerHtml = prizeDescription;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}

			/***********/
			/* Prize 4 */
			/***********/

			// Name
			try
			{
				string prizeName;

				_cmd.CommandText = "SELECT (PRIZ_Name) FROM [Prize] WHERE PRIZ_ID = @ID4";
				_cmd.Parameters.AddWithValue("@ID4", 4);
				prizeName = Convert.ToString(_cmd.ExecuteScalar());
				prize4Name.InnerHtml = prizeName;
				prize4Sidebar.InnerHtml = prizeName;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}

			// Description
			try
			{
				string prizeDescription;

				_cmd.CommandText = "SELECT (PRIZ_Description) FROM [Prize] WHERE PRIZ_ID = @ID4";
				prizeDescription = Convert.ToString(_cmd.ExecuteScalar());
				prize4Description.InnerHtml = prizeDescription;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}

			/***********/
			/* Prize 5 */
			/***********/

			// Name
			try
			{
				string prizeName;

				_cmd.CommandText = "SELECT (PRIZ_Name) FROM [Prize] WHERE PRIZ_ID = @ID5";
				_cmd.Parameters.AddWithValue("@ID5", 5);
				prizeName = Convert.ToString(_cmd.ExecuteScalar());
				prize5Name.InnerHtml = prizeName;
				prize5Sidebar.InnerHtml = prizeName;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}

			// Description
			try
			{
				string prizeDescription;

				_cmd.CommandText = "SELECT (PRIZ_Description) FROM [Prize] WHERE PRIZ_ID = @ID5";
				prizeDescription = Convert.ToString(_cmd.ExecuteScalar());
				prize5Description.InnerHtml = prizeDescription;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}

			con.Close();
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
	}
}