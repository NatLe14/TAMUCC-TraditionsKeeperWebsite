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
	public partial class Traditions : System.Web.UI.Page
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
			/* Tradition Load */
			/******************/

			string[] trads = {"Anchors Aweigh", "Art Museum", "Art Show", "Athletics Game", "Big Event", "Block Party", "Bluesday Tuesday",
					"Cat Alley", "Dance Marathon", "Deep End", "Fight Song", "Hector Foot", "Izzy Picture", "Izzy Birthday Fiesta", "Late Night Breakfast",
					"Lighting of the I", "Mariachi", "Photo at Momentum", "Join a Club", "Parade of Nations", "Performing Arts Center", "Patio Jam",
					"President's Picnic", "Islander Ring Wish", "Shakas Up Woosh!", "Theater Production", "Hike and Bike", "Sunrise @ University Beach",
					"Heritage Month", "Student Scholarships", "Islander Lights"};

			SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TKCS"].ConnectionString);
			SqlCommand _cmd = new SqlCommand();
			_cmd.CommandType = System.Data.CommandType.Text;
			_cmd.Connection = con;

			_cmd.CommandText = "SELECT (TRAD_Description) FROM [Tradition] WHERE TRAD_Name = @Name";

			con.Open();

			// Check which traditions are already completed
			for (int i = 0; i < trads.Length; i++)
			{
				loadInformation(trads[i], _cmd);
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
		private void loadInformation(string tradName, SqlCommand _cmd)
		{
			switch (tradName)
			{
				// Tradition 1
				case "Anchors Aweigh":
					//TradDescAA.InnerHtml = getTradDescriptions(tradName, _cmd);
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescAA.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 2
				case "Art Museum":
					//TradDescAM.InnerHtml = getTradDescriptions(tradName, _cmd);
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescAM.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 3
				case "Art Show":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescAS.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 4
				case "Athletics Game":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescAG.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 5
				case "Big Event":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescBE.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 6
				case "Block Party":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescBP.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 7
				case "Bluesday Tuesday":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescBT.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 8
				case "Cat Alley":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescCA.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 9
				case "Dance Marathon":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescDM.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 10
				case "Deep End":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescDE.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 11
				case "Fight Song":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescFS.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 12
				case "Hector Foot":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescHF.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 13
				case "Izzy Picture":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescI.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 14
				case "Izzy Birthday Fiesta":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescBF.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 15
				case "Late Night Breakfast":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescLNB.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 16
				case "Lighting of the I":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescLOI.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 17
				case "Mariachi":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescM.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 18
				case "Photo at Momentum":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescMW.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 19
				case "Join a Club":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescOF.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 20
				case "Parade of Nations":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescPON.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 21
				case "Performing Arts Center":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescPAC.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 22
				case "Patio Jam":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescPJ.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 23
				case "President's Picnic":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescPP.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 24
				case "Islander Ring Wish":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescRW.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 25
				case "Shakas Up Woosh!":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescSS.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 26
				case "Theater Production":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescTHEATER.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 27
				case "Hike and Bike":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescHAB.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 28
				case "Sunrise @ University Beach":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescUB.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 29
				case "Heritage Month":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescHM.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 30
				case "Student Scholarships":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescSCHOLAR.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
					break;

				// Tradition 31
				case "Islander Lights":
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@Name", tradName);
					TradDescIL.InnerHtml = Convert.ToString(_cmd.ExecuteScalar());
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