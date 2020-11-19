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
	public partial class Buildings : System.Web.UI.Page
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

			/******************/
			/* Buildings Load */
			/******************/

			string[] builds = {"University Center", "Sam's Place", "Michael and Karen O’Connor Building", "Dr. Hector P. Garcia Plaza", 
				"Dr. Jack and Susan Dugan Wellness Center", "Dr. Jack Dugan Family Soccer and Track Stadium", "Lee Plaza", "Woo Sung Lee Alumni Welcome Center", 
				"Mary & Jeff Bell Library", "Performing Arts Center", "Dr. Robert Ferguson Engineering Building"};

			SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TKCS"].ConnectionString);
			SqlCommand _cmd = new SqlCommand();
			_cmd.CommandType = System.Data.CommandType.Text;
			_cmd.Connection = con;

			_cmd.CommandText = "SELECT (BILD_Description) FROM [Building] WHERE BILD_Name = @Name";

			con.Open();

			// Check which traditions are already completed
			for (int i = 0; i < builds.Length; i++)
			{
				loadInformation(builds[i], _cmd);
			}

			con.Close();
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

		// Loads the info from the database
		private void loadInformation(string buildName, SqlCommand _cmd)
		{
			switch (buildName)
			{
				// Building 1
				case "University Center":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", buildName);
					BuildDescUC.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Building 2
				case "Sam's Place":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", buildName);
					BuildDescSP.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Building 3
				case "Michael and Karen O’Connor Building":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", buildName);
					BuildDescOC.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Building 4
				case "Dr. Hector P. Garcia Plaza":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", buildName);
					BuildDescHP.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Building 5
				case "Dr. Jack and Susan Dugan Wellness Center":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", buildName);
					BuildDescDWC.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Building 6
				case "Dr. Jack Dugan Family Soccer and Track Stadium":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", buildName);
					BuildDescDS.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Building 7
				case "Lee Plaza":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", buildName);
					BuildDescLP.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Building 8
				case "Woo Sung Lee Alumni Welcome Center":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", buildName);
					BuildDescAWC.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Building 9
				case "Mary & Jeff Bell Library":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", buildName);
					BuildDescBL.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Building 10
				case "Performing Arts Center":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", buildName);
					BuildDescPAC.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Building 11
				case "Dr. Robert Ferguson Engineering Building":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", buildName);
					BuildDescFB.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				default:
					break;
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
	}
}