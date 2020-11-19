using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.WebControls.Adapters;
using System.Configuration;
using System.Data;
using System.IO;

namespace TraditionKeeper
{
	public partial class Profile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			// Check if the user is logged in
			if (Session["UserID"] == null) // User not logged in, redirect to login page
			{
				Response.Redirect("Login.aspx");
			}
			else // User is logged in, show Logout button instead of Login
			{
				lblLogin.Visible = false;
				btnLogin.Visible = false;

				lblHelloUser.Visible = true;
				btnLogout.Visible = true;

				// Get user information and display on screen
				getUsername();
				DisplayUserInfo();

				// Display any updated information
				if (!IsPostBack)
					DisplayUserInfo();

				/******************************/
				/* Tradition Completion Check */
				/******************************/

				string[] trads = {"Anchors Aweigh", "Art Museum", "Art Show", "Athletics Game", "Big Event", "Block Party", "Bluesday Tuesday", 
					"Cat Alley", "Dance Marathon", "Deep End", "Fight Song", "Hector Foot", "Izzy Picture", "Izzy Birthday Fiesta", "Late Night Breakfast", 
					"Lighting of the I", "Mariachi", "Photo at Momentum", "Join a Club", "Parade of Nations", "Performing Arts Center", "Patio Jam", 
					"President's Picnic", "Islander Ring Wish", "Shakas Up Woosh!", "Theater Production", "Hike and Bike", "Sunrise @ University Beach", 
					"Heritage Month", "Student Scholarships", "Islander Lights"};

				// Check which traditions are already completed
				for (int i = 0; i < trads.Length; i++)
				{
					if (checkCompletedTraditions(Convert.ToInt32(Session["UserID"]), getTraditionID(trads[i]))) // Tradition Complete
					{
						hideUploadButtons(trads[i]);
					}
					else // Tradition Not Complete
					{
						hideViewButtons(trads[i]);
					}
				}
			}
		}

		// Login Button to redirect to login screen
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

		// Get the username of the user from database and display
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

		// Get user information from database and display
		private void DisplayUserInfo()
		{
			SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TKCS"].ConnectionString);
			SqlCommand _cmd = new SqlCommand();
			_cmd.CommandType = System.Data.CommandType.Text;
			_cmd.Connection = con;
			con.Open();

			// Display Username
			try
			{
				string Username;

				_cmd.CommandText = "SELECT (USER_Username) FROM [User] WHERE USER_ID = @ID";
				_cmd.Parameters.AddWithValue("@ID", Session["UserID"]);
				Username = Convert.ToString(_cmd.ExecuteScalar());
				lblProfileUsername.Text = Username;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}

			// Display First Name
			try
			{
				string FName;
		
				_cmd.CommandText = "SELECT (USER_FName) FROM [User] WHERE USER_ID = @ID";
				FName = Convert.ToString(_cmd.ExecuteScalar());
				lblProfileFName.Text = "First Name: " + FName;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}
		
			// Display Last Name
			try
			{
				string LName;
		
				_cmd.CommandText = "SELECT (USER_LName) FROM [User] WHERE USER_ID = @ID";
				LName = Convert.ToString(_cmd.ExecuteScalar());
				lblProfileLName.Text = "Last Name: " + LName;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}
		
			// Display Email
			try
			{
				string Email;
		
				_cmd.CommandText = "SELECT (USER_Email) FROM [User] WHERE USER_ID = @ID";
				Email = Convert.ToString(_cmd.ExecuteScalar());
				lblProfileEmail.Text = "Email: " + Email;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}

			// Display Class
			try
			{
				string Class;

				_cmd.CommandText = "SELECT (USER_Class) FROM [User] WHERE USER_ID = @ID";
				Class = Convert.ToString(_cmd.ExecuteScalar());
				lblProfileClass.Text = "Class: " + Class;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}

			// Display Tradition Count
			try
			{
				string TradCount;
		
				_cmd.CommandText = "SELECT (USER_TraditionCount) FROM [User] WHERE USER_ID = @ID";
				TradCount = Convert.ToString(_cmd.ExecuteScalar());
				lblProfileTradCount.Text = "Tradition Count: " + TradCount;
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}

			con.Close();
		}

		// Check for completed traditions to hide upload feature for completed ones
		private bool checkCompletedTraditions(int UID, int TID)
		{
			byte[] bytes;

			SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TKCS"].ConnectionString);
			SqlCommand cmd = new SqlCommand("SELECT (UT_Image) FROM [User_Tradition] WHERE USER_ID = @UserID AND TRAD_ID = @TradID", con);
			cmd.Parameters.AddWithValue("@UserID", UID);
			cmd.Parameters.AddWithValue("@TradID", TID);

			con.Open();
			try
			{
				// Store image from database
				bytes = (byte[])cmd.ExecuteScalar();

				// Check if there is an uploaded image for that tradition
				if (bytes != null) // Success: Image Data inputted
				{
					return true;
				}
				else // Failed: No Image
				{
					return false;
				}
			}
			catch (Exception ex)
			{
				System.Diagnostics.Debug.WriteLine(ex.ToString());
			}
			finally
			{
				con.Close();
			}

			return false;
		}

		// Return the Tradition ID from the database
		private int getTraditionID(string tradName)
		{
			int TradID = -1;

			SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TKCS"].ConnectionString);
			SqlCommand cmd = new SqlCommand("SELECT (TRAD_ID) FROM [Tradition] WHERE TRAD_Name = @Name", con);
			cmd.Parameters.AddWithValue("@Name", tradName);

			con.Open();
			try
			{
				TradID = Convert.ToInt32(cmd.ExecuteScalar());
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}
			finally
			{
				con.Close();
			}

			return TradID;
		}

		// Upload an image for the specified tradition
		private bool uploadImage(string tradition, HttpPostedFile postedFile)
		{
			string fileName = Path.GetFileName(postedFile.FileName);
			string fileExtention = Path.GetExtension(fileName);
			int fileSize = postedFile.ContentLength;

			// Check if correct file type was uploaded
			if (fileExtention.ToLower() == ".png" || fileExtention.ToLower() == ".jpg" || fileExtention.ToLower() == ".jpeg")
			{
				Stream stream = postedFile.InputStream;
				BinaryReader binaryReader = new BinaryReader(stream);
				byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

				SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TKCS"].ConnectionString);
				SqlCommand cmd = new SqlCommand("spUploadImage", con);
				cmd.CommandType = CommandType.StoredProcedure;

				// User ID
				SqlParameter paramUID = new SqlParameter()
				{
					ParameterName = "@USER_ID",
					Value = Convert.ToInt32(Session["UserID"])
				};
				cmd.Parameters.Add(paramUID);

				// Tradition ID
				SqlParameter paramTID = new SqlParameter()
				{
					ParameterName = "@TRAD_ID",
					Value = getTraditionID(tradition)
				};
				cmd.Parameters.Add(paramTID);

				// Image Data
				SqlParameter paramImageData = new SqlParameter()
				{
					ParameterName = "@ImageData",
					Value = bytes
				};
				cmd.Parameters.Add(paramImageData);

				// Output: NewID
				SqlParameter paramNewID = new SqlParameter()
				{
					ParameterName = "@NewID",
					Value = -1,
					Direction = ParameterDirection.Output
				};
				cmd.Parameters.Add(paramNewID);

				con.Open();
				try
				{
					cmd.ExecuteNonQuery();

					// Upload successful
					return true;
				}
				catch (Exception ex)
				{
					System.Diagnostics.Debug.WriteLine(ex.ToString());
				}
				finally
				{
					con.Close();
				}
			}
			else // Wrong file type was uploaded
			{
				// Upload failed
				return false;
			}

			return false;
		}

		// Update the Users tradition count in the database
		private void updateUserCount()
		{
			int count;

			SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TKCS"].ConnectionString);
			SqlCommand _cmd = new SqlCommand();
			_cmd.CommandType = System.Data.CommandType.Text;
			_cmd.Connection = con;
			con.Open();

			// Get Count and Update it
			try
			{
				_cmd.CommandText = "SELECT USER_TraditionCount FROM [User] WHERE USER_ID = @ID";
				_cmd.Parameters.AddWithValue("@ID", Session["UserID"]);
				count = Convert.ToInt32(_cmd.ExecuteScalar());

				count += 1;

				_cmd.CommandText = "UPDATE [User] SET USER_TraditionCount = @NewCount WHERE USER_ID = @ID";
				_cmd.Parameters.AddWithValue("@NewCount", count);
				_cmd.ExecuteNonQuery();
			}
			catch (Exception ex)
			{
				System.Diagnostics.Debug.WriteLine(ex.ToString());
			}
		}

		// Hide Upload buttons if tradition is completed
		private void hideUploadButtons(string TradName)
		{
			switch (TradName)
			{
				// Tradition 1
				case "Anchors Aweigh":
					FileUpload1.Visible = false;
					btnUploadTrad1.Visible = false;
					ViewTrad1.Visible = true;
					Image1.Visible = true;
					break;

				// Tradition 2
				case "Art Museum":
					FileUpload2.Visible = false;
					btnUploadTrad2.Visible = false;
					ViewTrad2.Visible = true;
					Image2.Visible = true;
					break;

				// Tradition 3
				case "Art Show":
					FileUpload3.Visible = false;
					btnUploadTrad3.Visible = false;
					ViewTrad3.Visible = true;
					Image3.Visible = true;
					break;

				// Tradition 4
				case "Athletics Game":
					FileUpload4.Visible = false;
					btnUploadTrad4.Visible = false;
					ViewTrad4.Visible = true;
					Image4.Visible = true;
					break;

				// Tradition 5
				case "Big Event":
					FileUpload5.Visible = false;
					btnUploadTrad5.Visible = false;
					ViewTrad5.Visible = true;
					Image5.Visible = true;
					break;

				// Tradition 6
				case "Block Party":
					FileUpload6.Visible = false;
					btnUploadTrad6.Visible = false;
					ViewTrad6.Visible = true;
					Image6.Visible = true;
					break;

				// Tradition 7
				case "Bluesday Tuesday":
					FileUpload7.Visible = false;
					btnUploadTrad7.Visible = false;
					ViewTrad7.Visible = true;
					Image7.Visible = true;
					break;

				// Tradition 8
				case "Cat Alley":
					FileUpload8.Visible = false;
					btnUploadTrad8.Visible = false;
					ViewTrad8.Visible = true;
					Image8.Visible = true;
					break;

				// Tradition 9
				case "Dance Marathon":
					FileUpload9.Visible = false;
					btnUploadTrad9.Visible = false;
					ViewTrad9.Visible = true;
					Image9.Visible = true;
					break;

				// Tradition 10
				case "Deep End":
					FileUpload10.Visible = false;
					btnUploadTrad10.Visible = false;
					ViewTrad10.Visible = true;
					Image10.Visible = true;
					break;

				// Tradition 11
				case "Fight Song":
					FileUpload11.Visible = false;
					btnUploadTrad11.Visible = false;
					ViewTrad11.Visible = true;
					Image11.Visible = true;
					break;

				// Tradition 12
				case "Hector Foot":
					FileUpload12.Visible = false;
					btnUploadTrad12.Visible = false;
					ViewTrad12.Visible = true;
					Image12.Visible = true;
					break;

				// Tradition 13
				case "Izzy Picture":
					FileUpload13.Visible = false;
					btnUploadTrad13.Visible = false;
					ViewTrad13.Visible = true;
					Image13.Visible = true;
					break;

				// Tradition 14
				case "Izzy Birthday Fiesta":
					FileUpload14.Visible = false;
					btnUploadTrad14.Visible = false;
					ViewTrad14.Visible = true;
					Image14.Visible = true;
					break;

				// Tradition 15
				case "Late Night Breakfast":
					FileUpload15.Visible = false;
					btnUploadTrad15.Visible = false;
					ViewTrad15.Visible = true;
					Image15.Visible = true;
					break;

				// Tradition 16
				case "Lighting of the I":
					FileUpload16.Visible = false;
					btnUploadTrad16.Visible = false;
					ViewTrad16.Visible = true;
					Image16.Visible = true;
					break;

				// Tradition 17
				case "Mariachi":
					FileUpload17.Visible = false;
					btnUploadTrad17.Visible = false;
					ViewTrad17.Visible = true;
					Image17.Visible = true;
					break;

				// Tradition 18
				case "Photo at Momentum":
					FileUpload18.Visible = false;
					btnUploadTrad18.Visible = false;
					ViewTrad18.Visible = true;
					Image18.Visible = true;
					break;

				// Tradition 19
				case "Join a Club":
					FileUpload19.Visible = false;
					btnUploadTrad19.Visible = false;
					ViewTrad19.Visible = true;
					Image19.Visible = true;
					break;

				// Tradition 20
				case "Parade of Nations":
					FileUpload20.Visible = false;
					btnUploadTrad20.Visible = false;
					ViewTrad20.Visible = true;
					Image20.Visible = true;
					break;

				// Tradition 21
				case "Performing Arts Center":
					FileUpload21.Visible = false;
					btnUploadTrad21.Visible = false;
					ViewTrad21.Visible = true;
					Image21.Visible = true;
					break;

				// Tradition 22
				case "Patio Jam":
					FileUpload22.Visible = false;
					btnUploadTrad22.Visible = false;
					ViewTrad22.Visible = true;
					Image22.Visible = true;
					break;

				// Tradition 23
				case "President's Picnic":
					FileUpload23.Visible = false;
					btnUploadTrad23.Visible = false;
					ViewTrad23.Visible = true;
					Image23.Visible = true;
					break;

				// Tradition 24
				case "Islander Ring Wish":
					FileUpload24.Visible = false;
					btnUploadTrad24.Visible = false;
					ViewTrad24.Visible = true;
					Image24.Visible = true;
					break;

				// Tradition 25
				case "Shakas Up Woosh!":
					FileUpload25.Visible = false;
					btnUploadTrad25.Visible = false;
					ViewTrad25.Visible = true;
					Image25.Visible = true;
					break;

				// Tradition 26
				case "Theater Production":
					FileUpload26.Visible = false;
					btnUploadTrad26.Visible = false;
					ViewTrad26.Visible = true;
					Image26.Visible = true;
					break;

				// Tradition 27
				case "Hike and Bike":
					FileUpload27.Visible = false;
					btnUploadTrad27.Visible = false;
					ViewTrad27.Visible = true;
					Image27.Visible = true;
					break;

				// Tradition 28
				case "Sunrise @ University Beach":
					FileUpload28.Visible = false;
					btnUploadTrad28.Visible = false;
					ViewTrad28.Visible = true;
					Image28.Visible = true;
					break;

				// Tradition 29
				case "Heritage Month":
					FileUpload29.Visible = false;
					btnUploadTrad29.Visible = false;
					ViewTrad29.Visible = true;
					Image29.Visible = true;
					break;

				// Tradition 30
				case "Student Scholarships":
					FileUpload30.Visible = false;
					btnUploadTrad30.Visible = false;
					ViewTrad30.Visible = true;
					Image30.Visible = true;
					break;

				// Tradition 31
				case "Islander Lights":
					FileUpload31.Visible = false;
					btnUploadTrad31.Visible = false;
					ViewTrad31.Visible = true;
					Image31.Visible = true;
					break;

				default:
					break;
			}
		}

		// Hide View buttons if tradition isn't completed
		private void hideViewButtons(string TradName)
		{
			switch (TradName)
			{
				// Tradition 1
				case "Anchors Aweigh":
					FileUpload1.Visible = true;
					btnUploadTrad1.Visible = true;
					ViewTrad1.Visible = false;
					Image1.Visible = false;
					break;

				// Tradition 2
				case "Art Museum":
					FileUpload2.Visible = true;
					btnUploadTrad2.Visible = true;
					ViewTrad2.Visible = false;
					Image2.Visible = false;
					break;

				// Tradition 3
				case "Art Show":
					FileUpload3.Visible = true;
					btnUploadTrad3.Visible = true;
					ViewTrad3.Visible = false;
					Image3.Visible = false;
					break;

				// Tradition 4
				case "Athletics Game":
					FileUpload4.Visible = true;
					btnUploadTrad4.Visible = true;
					ViewTrad4.Visible = false;
					Image4.Visible = false;
					break;

				// Tradition 5
				case "Big Event":
					FileUpload5.Visible = true;
					btnUploadTrad5.Visible = true;
					ViewTrad5.Visible = false;
					Image5.Visible = false;
					break;

				// Tradition 6
				case "Block Party":
					FileUpload6.Visible = true;
					btnUploadTrad6.Visible = true;
					ViewTrad6.Visible = false;
					Image6.Visible = false;
					break;

				// Tradition 7
				case "Bluesday Tuesday":
					FileUpload7.Visible = true;
					btnUploadTrad7.Visible = true;
					ViewTrad7.Visible = false;
					Image7.Visible = false;
					break;

				// Tradition 8
				case "Cat Alley":
					FileUpload8.Visible = true;
					btnUploadTrad8.Visible = true;
					ViewTrad8.Visible = false;
					Image8.Visible = false;
					break;

				// Tradition 9
				case "Dance Marathon":
					FileUpload9.Visible = true;
					btnUploadTrad9.Visible = true;
					ViewTrad9.Visible = false;
					Image9.Visible = false;
					break;

				// Tradition 10
				case "Deep End":
					FileUpload10.Visible = true;
					btnUploadTrad10.Visible = true;
					ViewTrad10.Visible = false;
					Image10.Visible = false;
					break;

				// Tradition 11
				case "Fight Song":
					FileUpload11.Visible = true;
					btnUploadTrad11.Visible = true;
					ViewTrad11.Visible = false;
					Image11.Visible = false;
					break;

				// Tradition 12
				case "Hector Foot":
					FileUpload12.Visible = true;
					btnUploadTrad12.Visible = true;
					ViewTrad12.Visible = false;
					Image12.Visible = false;
					break;

				// Tradition 13
				case "Izzy Picture":
					FileUpload13.Visible = true;
					btnUploadTrad13.Visible = true;
					ViewTrad13.Visible = false;
					Image13.Visible = false;
					break;

				// Tradition 14
				case "Izzy Birthday Fiesta":
					FileUpload14.Visible = true;
					btnUploadTrad14.Visible = true;
					ViewTrad14.Visible = false;
					Image14.Visible = false;
					break;

				// Tradition 15
				case "Late Night Breakfast":
					FileUpload15.Visible = true;
					btnUploadTrad15.Visible = true;
					ViewTrad15.Visible = false;
					Image15.Visible = false;
					break;

				// Tradition 16
				case "Lighting of the I":
					FileUpload16.Visible = true;
					btnUploadTrad16.Visible = true;
					ViewTrad16.Visible = false;
					Image16.Visible = false;
					break;

				// Tradition 17
				case "Mariachi":
					FileUpload17.Visible = true;
					btnUploadTrad17.Visible = true;
					ViewTrad17.Visible = false;
					Image17.Visible = false;
					break;

				// Tradition 18
				case "Photo at Momentum":
					FileUpload18.Visible = true;
					btnUploadTrad18.Visible = true;
					ViewTrad18.Visible = false;
					Image18.Visible = false;
					break;

				// Tradition 19
				case "Join a Club":
					FileUpload19.Visible = true;
					btnUploadTrad19.Visible = true;
					ViewTrad19.Visible = false;
					Image19.Visible = false;
					break;

				// Tradition 20
				case "Parade of Nations":
					FileUpload20.Visible = true;
					btnUploadTrad20.Visible = true;
					ViewTrad20.Visible = false;
					Image20.Visible = false;
					break;

				// Tradition 21
				case "Performing Arts Center":
					FileUpload21.Visible = true;
					btnUploadTrad21.Visible = true;
					ViewTrad21.Visible = false;
					Image21.Visible = false;
					break;

				// Tradition 22
				case "Patio Jam":
					FileUpload22.Visible = true;
					btnUploadTrad22.Visible = true;
					ViewTrad22.Visible = false;
					Image22.Visible = false;
					break;

				// Tradition 23
				case "President's Picnic":
					FileUpload23.Visible = true;
					btnUploadTrad23.Visible = true;
					ViewTrad23.Visible = false;
					Image23.Visible = false;
					break;

				// Tradition 24
				case "Islander Ring Wish":
					FileUpload24.Visible = true;
					btnUploadTrad24.Visible = true;
					ViewTrad24.Visible = false;
					Image24.Visible = false;
					break;

				// Tradition 25
				case "Shakas Up Woosh!":
					FileUpload25.Visible = true;
					btnUploadTrad25.Visible = true;
					ViewTrad25.Visible = false;
					Image25.Visible = false;
					break;

				// Tradition 26
				case "Theater Production":
					FileUpload26.Visible = true;
					btnUploadTrad26.Visible = true;
					ViewTrad26.Visible = false;
					Image26.Visible = false;
					break;

				// Tradition 27
				case "Hike and Bike":
					FileUpload27.Visible = true;
					btnUploadTrad27.Visible = true;
					ViewTrad27.Visible = false;
					Image27.Visible = false;
					break;

				// Tradition 28
				case "Sunrise @ University Beach":
					FileUpload28.Visible = true;
					btnUploadTrad28.Visible = true;
					ViewTrad28.Visible = false;
					Image28.Visible = false;
					break;

				// Tradition 29
				case "Heritage Month":
					FileUpload29.Visible = true;
					btnUploadTrad29.Visible = true;
					ViewTrad29.Visible = false;
					Image29.Visible = false;
					break;

				// Tradition 30
				case "Student Scholarships":
					FileUpload30.Visible = true;
					btnUploadTrad30.Visible = true;
					ViewTrad30.Visible = false;
					Image30.Visible = false;
					break;

				// Tradition 31
				case "Islander Lights":
					FileUpload31.Visible = true;
					btnUploadTrad31.Visible = true;
					ViewTrad31.Visible = false;
					Image31.Visible = false;
					break;

				default:
					break;
			}
		}

		// Display the uploaded image on View Buttons
		protected void viewImage(object sender, EventArgs e)
		{
			Button btn = (Button)sender;
			byte[] image;

			SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TKCS"].ConnectionString);
			SqlCommand _cmd = new SqlCommand();
			_cmd.CommandType = System.Data.CommandType.Text;
			_cmd.Connection = con;

			_cmd.CommandText = "SELECT (UT_Image) FROM [User_Tradition] WHERE USER_ID = @UserID AND TRAD_ID = @TradID";

			con.Open();

			switch (btn.CommandName)
			{
				case "1":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Anchors Aweigh"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "2":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Art Museum"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "3":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Art Show"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "4":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Athletics Game"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "5":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Big Event"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "6":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Block Party"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "7":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Bluesday Tuesday"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "8":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Cat Alley"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "9":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Dance Marathon"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "10":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Deep End"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "11":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Fight Song"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "12":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Hector Foot"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "13":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Izzy Picture"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "14":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Izzy Birthday Fiesta"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "15":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Late Night Breakfast"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "16":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Lighting of the I"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "17":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Mariachi"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "18":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Photo at Momentum"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "19":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Join a Club"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "20":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Parade of Nations"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "21":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Performing Arts Center"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "22":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Patio Jam"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "23":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("President's Picnic"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "24":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Islander Ring Wish"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "25":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Shakas Up Woosh!"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "26":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Theater Production"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "27":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Hike and Bike"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "28":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Sunrise @ University Beach"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "29":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Heritage Month"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "30":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Student Scholarships"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				case "31":
					// Clear previous parameters
					_cmd.Parameters.Clear();
					_cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
					_cmd.Parameters.AddWithValue("@TradID", getTraditionID("Islander Lights"));
					image = (byte[])_cmd.ExecuteScalar();

					// Save image in database
					Session["UploadedImage"] = image;
					break;

				default:
					break;
			}
			con.Close();

			// Open image in a new tab
			Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('ViewImage.aspx','_newtab');", true);
		}

		/******************/
		/* Upload Buttons */
		/******************/

		// Upload Tradition 1
		protected void btnUploadTrad1_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Anchors Aweigh", FileUpload1.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload1.Visible = false;
				btnUploadTrad1.Visible = false;
				ViewTrad1.Visible = true;
				Image1.Visible = true;

				// Indicate Upload Successful
				lblMessage1.Visible = true;
				lblMessage1.ForeColor = System.Drawing.Color.Green;
				lblMessage1.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad1.Visible = false;
				Image1.Visible = false;
				FileUpload1.Visible = true;
				btnUploadTrad1.Visible = true;

				// Indicate Upload Failed
				lblMessage1.Visible = true;
				lblMessage1.ForeColor = System.Drawing.Color.Red;
				lblMessage1.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 2
		protected void btnUploadTrad2_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Art Museum", FileUpload2.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload2.Visible = false;
				btnUploadTrad2.Visible = false;
				ViewTrad2.Visible = true;
				Image2.Visible = true;

				// Indicate Upload Successful
				lblMessage2.Visible = true;
				lblMessage2.ForeColor = System.Drawing.Color.Green;
				lblMessage2.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad2.Visible = false;
				Image2.Visible = false;
				FileUpload2.Visible = true;
				btnUploadTrad2.Visible = true;

				// Indicate Upload Failed
				lblMessage2.Visible = true;
				lblMessage2.ForeColor = System.Drawing.Color.Red;
				lblMessage2.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 3
		protected void btnUploadTrad3_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Art Show", FileUpload3.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload3.Visible = false;
				btnUploadTrad3.Visible = false;
				ViewTrad3.Visible = true;
				Image3.Visible = true;

				// Indicate Upload Successful
				lblMessage3.Visible = true;
				lblMessage3.ForeColor = System.Drawing.Color.Green;
				lblMessage3.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad3.Visible = false;
				Image3.Visible = false;
				FileUpload3.Visible = true;
				btnUploadTrad3.Visible = true;

				// Indicate Upload Failed
				lblMessage3.Visible = true;
				lblMessage3.ForeColor = System.Drawing.Color.Red;
				lblMessage3.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 4
		protected void btnUploadTrad4_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Athletics Game", FileUpload4.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload4.Visible = false;
				btnUploadTrad4.Visible = false;
				ViewTrad4.Visible = true;
				Image4.Visible = true;

				// Indicate Upload Successful
				lblMessage4.Visible = true;
				lblMessage4.ForeColor = System.Drawing.Color.Green;
				lblMessage4.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad4.Visible = false;
				Image4.Visible = false;
				FileUpload4.Visible = true;
				btnUploadTrad4.Visible = true;

				// Indicate Upload Failed
				lblMessage4.Visible = true;
				lblMessage4.ForeColor = System.Drawing.Color.Red;
				lblMessage4.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 5
		protected void btnUploadTrad5_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Big Event", FileUpload5.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload5.Visible = false;
				btnUploadTrad5.Visible = false;
				ViewTrad5.Visible = true;
				Image5.Visible = true;

				// Indicate Upload Successful
				lblMessage5.Visible = true;
				lblMessage5.ForeColor = System.Drawing.Color.Green;
				lblMessage5.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad5.Visible = false;
				Image5.Visible = false;
				FileUpload5.Visible = true;
				btnUploadTrad5.Visible = true;

				// Indicate Upload Failed
				lblMessage5.Visible = true;
				lblMessage5.ForeColor = System.Drawing.Color.Red;
				lblMessage5.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 6
		protected void btnUploadTrad6_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Block Party", FileUpload6.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload6.Visible = false;
				btnUploadTrad6.Visible = false;
				ViewTrad6.Visible = true;
				Image6.Visible = true;

				// Indicate Upload Successful
				lblMessage6.Visible = true;
				lblMessage6.ForeColor = System.Drawing.Color.Green;
				lblMessage6.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad6.Visible = false;
				Image6.Visible = false;
				FileUpload6.Visible = true;
				btnUploadTrad6.Visible = true;

				// Indicate Upload Failed
				lblMessage6.Visible = true;
				lblMessage6.ForeColor = System.Drawing.Color.Red;
				lblMessage6.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 7
		protected void btnUploadTrad7_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Bluesday Tuesday", FileUpload7.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload7.Visible = false;
				btnUploadTrad7.Visible = false;
				ViewTrad7.Visible = true;
				Image7.Visible = true;

				// Indicate Upload Successful
				lblMessage7.Visible = true;
				lblMessage7.ForeColor = System.Drawing.Color.Green;
				lblMessage7.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad7.Visible = false;
				Image7.Visible = false;
				FileUpload7.Visible = true;
				btnUploadTrad7.Visible = true;

				// Indicate Upload Failed
				lblMessage7.Visible = true;
				lblMessage7.ForeColor = System.Drawing.Color.Red;
				lblMessage7.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 8
		protected void btnUploadTrad8_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Cat Alley", FileUpload8.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload8.Visible = false;
				btnUploadTrad8.Visible = false;
				ViewTrad8.Visible = true;
				Image8.Visible = true;

				// Indicate Upload Successful
				lblMessage8.Visible = true;
				lblMessage8.ForeColor = System.Drawing.Color.Green;
				lblMessage8.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad8.Visible = false;
				Image8.Visible = false;
				FileUpload8.Visible = true;
				btnUploadTrad8.Visible = true;

				// Indicate Upload Failed
				lblMessage8.Visible = true;
				lblMessage8.ForeColor = System.Drawing.Color.Red;
				lblMessage8.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 9
		protected void btnUploadTrad9_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Dance Marathon", FileUpload9.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload9.Visible = false;
				btnUploadTrad9.Visible = false;
				ViewTrad9.Visible = true;
				Image9.Visible = true;

				// Indicate Upload Successful
				lblMessage9.Visible = true;
				lblMessage9.ForeColor = System.Drawing.Color.Green;
				lblMessage9.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad9.Visible = false;
				Image9.Visible = false;
				FileUpload9.Visible = true;
				btnUploadTrad9.Visible = true;

				// Indicate Upload Failed
				lblMessage9.Visible = true;
				lblMessage9.ForeColor = System.Drawing.Color.Red;
				lblMessage9.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 10
		protected void btnUploadTrad10_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Deep End", FileUpload10.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload10.Visible = false;
				btnUploadTrad10.Visible = false;
				ViewTrad10.Visible = true;
				Image10.Visible = true;

				// Indicate Upload Successful
				lblMessage10.Visible = true;
				lblMessage10.ForeColor = System.Drawing.Color.Green;
				lblMessage10.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad10.Visible = false;
				Image10.Visible = false;
				FileUpload10.Visible = true;
				btnUploadTrad10.Visible = true;

				// Indicate Upload Failed
				lblMessage10.Visible = true;
				lblMessage10.ForeColor = System.Drawing.Color.Red;
				lblMessage10.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 11
		protected void btnUploadTrad11_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Fight Song", FileUpload11.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload11.Visible = false;
				btnUploadTrad11.Visible = false;
				ViewTrad11.Visible = true;
				Image11.Visible = true;

				// Indicate Upload Successful
				lblMessage11.Visible = true;
				lblMessage11.ForeColor = System.Drawing.Color.Green;
				lblMessage11.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad11.Visible = false;
				Image11.Visible = false;
				FileUpload11.Visible = true;
				btnUploadTrad11.Visible = true;

				// Indicate Upload Failed
				lblMessage11.Visible = true;
				lblMessage11.ForeColor = System.Drawing.Color.Red;
				lblMessage11.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 12
		protected void btnUploadTrad12_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Hector Foot", FileUpload12.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload12.Visible = false;
				btnUploadTrad12.Visible = false;
				ViewTrad12.Visible = true;
				Image12.Visible = true;

				// Indicate Upload Successful
				lblMessage12.Visible = true;
				lblMessage12.ForeColor = System.Drawing.Color.Green;
				lblMessage12.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad12.Visible = false;
				Image12.Visible = false;
				FileUpload12.Visible = true;
				btnUploadTrad12.Visible = true;

				// Indicate Upload Failed
				lblMessage12.Visible = true;
				lblMessage12.ForeColor = System.Drawing.Color.Red;
				lblMessage12.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 13
		protected void btnUploadTrad13_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Izzy Picture", FileUpload13.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload13.Visible = false;
				btnUploadTrad13.Visible = false;
				ViewTrad13.Visible = true;
				Image13.Visible = true;

				// Indicate Upload Successful
				lblMessage13.Visible = true;
				lblMessage13.ForeColor = System.Drawing.Color.Green;
				lblMessage13.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad13.Visible = false;
				Image13.Visible = false;
				FileUpload13.Visible = true;
				btnUploadTrad13.Visible = true;

				// Indicate Upload Failed
				lblMessage13.Visible = true;
				lblMessage13.ForeColor = System.Drawing.Color.Red;
				lblMessage13.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 14
		protected void btnUploadTrad14_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Izzy Birthday Fiesta", FileUpload14.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload14.Visible = false;
				btnUploadTrad14.Visible = false;
				ViewTrad14.Visible = true;
				Image14.Visible = true;

				// Indicate Upload Successful
				lblMessage14.Visible = true;
				lblMessage14.ForeColor = System.Drawing.Color.Green;
				lblMessage14.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad14.Visible = false;
				Image14.Visible = false;
				FileUpload14.Visible = true;
				btnUploadTrad14.Visible = true;

				// Indicate Upload Failed
				lblMessage14.Visible = true;
				lblMessage14.ForeColor = System.Drawing.Color.Red;
				lblMessage14.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 15
		protected void btnUploadTrad15_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Late Night Breakfast", FileUpload15.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload15.Visible = false;
				btnUploadTrad15.Visible = false;
				ViewTrad15.Visible = true;
				Image15.Visible = true;

				// Indicate Upload Successful
				lblMessage15.Visible = true;
				lblMessage15.ForeColor = System.Drawing.Color.Green;
				lblMessage15.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad15.Visible = false;
				Image15.Visible = false;
				FileUpload15.Visible = true;
				btnUploadTrad15.Visible = true;

				// Indicate Upload Failed
				lblMessage15.Visible = true;
				lblMessage15.ForeColor = System.Drawing.Color.Red;
				lblMessage15.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 16
		protected void btnUploadTrad16_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Lighting of the I", FileUpload16.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload16.Visible = false;
				btnUploadTrad16.Visible = false;
				ViewTrad16.Visible = true;
				Image16.Visible = true;

				// Indicate Upload Successful
				lblMessage16.Visible = true;
				lblMessage16.ForeColor = System.Drawing.Color.Green;
				lblMessage16.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad16.Visible = false;
				Image16.Visible = false;
				FileUpload16.Visible = true;
				btnUploadTrad16.Visible = true;

				// Indicate Upload Failed
				lblMessage16.Visible = true;
				lblMessage16.ForeColor = System.Drawing.Color.Red;
				lblMessage16.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 17
		protected void btnUploadTrad17_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Mariachi", FileUpload17.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload17.Visible = false;
				btnUploadTrad17.Visible = false;
				ViewTrad17.Visible = true;
				Image17.Visible = true;

				// Indicate Upload Successful
				lblMessage17.Visible = true;
				lblMessage17.ForeColor = System.Drawing.Color.Green;
				lblMessage17.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad17.Visible = false;
				Image17.Visible = false;
				FileUpload17.Visible = true;
				btnUploadTrad17.Visible = true;

				// Indicate Upload Failed
				lblMessage17.Visible = true;
				lblMessage17.ForeColor = System.Drawing.Color.Red;
				lblMessage17.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 18
		protected void btnUploadTrad18_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Photo at Momentum", FileUpload18.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload18.Visible = false;
				btnUploadTrad18.Visible = false;
				ViewTrad18.Visible = true;
				Image18.Visible = true;

				// Indicate Upload Successful
				lblMessage18.Visible = true;
				lblMessage18.ForeColor = System.Drawing.Color.Green;
				lblMessage18.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad18.Visible = false;
				Image18.Visible = false;
				FileUpload18.Visible = true;
				btnUploadTrad18.Visible = true;

				// Indicate Upload Failed
				lblMessage18.Visible = true;
				lblMessage18.ForeColor = System.Drawing.Color.Red;
				lblMessage18.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 19
		protected void btnUploadTrad19_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Join a Club", FileUpload19.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload19.Visible = false;
				btnUploadTrad19.Visible = false;
				ViewTrad19.Visible = true;
				Image19.Visible = true;

				// Indicate Upload Successful
				lblMessage19.Visible = true;
				lblMessage19.ForeColor = System.Drawing.Color.Green;
				lblMessage19.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad19.Visible = false;
				Image19.Visible = false;
				FileUpload19.Visible = true;
				btnUploadTrad19.Visible = true;

				// Indicate Upload Failed
				lblMessage19.Visible = true;
				lblMessage19.ForeColor = System.Drawing.Color.Red;
				lblMessage19.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 20
		protected void btnUploadTrad20_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Parade of Nations", FileUpload20.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload20.Visible = false;
				btnUploadTrad20.Visible = false;
				ViewTrad20.Visible = true;
				Image20.Visible = true;

				// Indicate Upload Successful
				lblMessage20.Visible = true;
				lblMessage20.ForeColor = System.Drawing.Color.Green;
				lblMessage20.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad20.Visible = false;
				Image20.Visible = false;
				FileUpload20.Visible = true;
				btnUploadTrad20.Visible = true;

				// Indicate Upload Failed
				lblMessage20.Visible = true;
				lblMessage20.ForeColor = System.Drawing.Color.Red;
				lblMessage20.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 21
		protected void btnUploadTrad21_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Performing Arts Center", FileUpload21.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload21.Visible = false;
				btnUploadTrad21.Visible = false;
				ViewTrad21.Visible = true;
				Image21.Visible = true;

				// Indicate Upload Successful
				lblMessage21.Visible = true;
				lblMessage21.ForeColor = System.Drawing.Color.Green;
				lblMessage21.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad21.Visible = false;
				Image21.Visible = false;
				FileUpload21.Visible = true;
				btnUploadTrad21.Visible = true;

				// Indicate Upload Failed
				lblMessage21.Visible = true;
				lblMessage21.ForeColor = System.Drawing.Color.Red;
				lblMessage21.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 22
		protected void btnUploadTrad22_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Patio Jam", FileUpload22.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload22.Visible = false;
				btnUploadTrad22.Visible = false;
				ViewTrad22.Visible = true;
				Image22.Visible = true;

				// Indicate Upload Successful
				lblMessage22.Visible = true;
				lblMessage22.ForeColor = System.Drawing.Color.Green;
				lblMessage22.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad22.Visible = false;
				Image22.Visible = false;
				FileUpload22.Visible = true;
				btnUploadTrad22.Visible = true;

				// Indicate Upload Failed
				lblMessage22.Visible = true;
				lblMessage22.ForeColor = System.Drawing.Color.Red;
				lblMessage22.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 23
		protected void btnUploadTrad23_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("President's Picnic", FileUpload23.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload23.Visible = false;
				btnUploadTrad23.Visible = false;
				ViewTrad23.Visible = true;
				Image23.Visible = true;

				// Indicate Upload Successful
				lblMessage23.Visible = true;
				lblMessage23.ForeColor = System.Drawing.Color.Green;
				lblMessage23.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad23.Visible = false;
				Image23.Visible = false;
				FileUpload23.Visible = true;
				btnUploadTrad23.Visible = true;

				// Indicate Upload Failed
				lblMessage23.Visible = true;
				lblMessage23.ForeColor = System.Drawing.Color.Red;
				lblMessage23.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 24
		protected void btnUploadTrad24_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Islander Ring Wish", FileUpload24.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload24.Visible = false;
				btnUploadTrad24.Visible = false;
				ViewTrad24.Visible = true;
				Image24.Visible = true;

				// Indicate Upload Successful
				lblMessage24.Visible = true;
				lblMessage24.ForeColor = System.Drawing.Color.Green;
				lblMessage24.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad24.Visible = false;
				Image24.Visible = false;
				FileUpload24.Visible = true;
				btnUploadTrad24.Visible = true;

				// Indicate Upload Failed
				lblMessage24.Visible = true;
				lblMessage24.ForeColor = System.Drawing.Color.Red;
				lblMessage24.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 25
		protected void btnUploadTrad25_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Shakas Up Woosh!", FileUpload25.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload25.Visible = false;
				btnUploadTrad25.Visible = false;
				ViewTrad25.Visible = true;
				Image25.Visible = true;

				// Indicate Upload Successful
				lblMessage25.Visible = true;
				lblMessage25.ForeColor = System.Drawing.Color.Green;
				lblMessage25.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad25.Visible = false;
				Image25.Visible = false;
				FileUpload25.Visible = true;
				btnUploadTrad25.Visible = true;

				// Indicate Upload Failed
				lblMessage25.Visible = true;
				lblMessage25.ForeColor = System.Drawing.Color.Red;
				lblMessage25.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 26
		protected void btnUploadTrad26_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Theater Production", FileUpload26.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload26.Visible = false;
				btnUploadTrad26.Visible = false;
				ViewTrad26.Visible = true;
				Image26.Visible = true;

				// Indicate Upload Successful
				lblMessage26.Visible = true;
				lblMessage26.ForeColor = System.Drawing.Color.Green;
				lblMessage26.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad26.Visible = false;
				Image26.Visible = false;
				FileUpload26.Visible = true;
				btnUploadTrad26.Visible = true;

				// Indicate Upload Failed
				lblMessage26.Visible = true;
				lblMessage26.ForeColor = System.Drawing.Color.Red;
				lblMessage26.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 27
		protected void btnUploadTrad27_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Hike and Bike", FileUpload27.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload27.Visible = false;
				btnUploadTrad27.Visible = false;
				ViewTrad27.Visible = true;
				Image27.Visible = true;

				// Indicate Upload Successful
				lblMessage27.Visible = true;
				lblMessage27.ForeColor = System.Drawing.Color.Green;
				lblMessage27.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad27.Visible = false;
				Image27.Visible = false;
				FileUpload27.Visible = true;
				btnUploadTrad27.Visible = true;

				// Indicate Upload Failed
				lblMessage27.Visible = true;
				lblMessage27.ForeColor = System.Drawing.Color.Red;
				lblMessage27.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 28
		protected void btnUploadTrad28_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Sunrise @ University Beach", FileUpload28.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload28.Visible = false;
				btnUploadTrad28.Visible = false;
				ViewTrad28.Visible = true;
				Image28.Visible = true;

				// Indicate Upload Successful
				lblMessage28.Visible = true;
				lblMessage28.ForeColor = System.Drawing.Color.Green;
				lblMessage28.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad28.Visible = false;
				Image28.Visible = false;
				FileUpload28.Visible = true;
				btnUploadTrad28.Visible = true;

				// Indicate Upload Failed
				lblMessage28.Visible = true;
				lblMessage28.ForeColor = System.Drawing.Color.Red;
				lblMessage28.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 29
		protected void btnUploadTrad29_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Heritage Month", FileUpload29.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload29.Visible = false;
				btnUploadTrad29.Visible = false;
				ViewTrad29.Visible = true;
				Image29.Visible = true;

				// Indicate Upload Successful
				lblMessage29.Visible = true;
				lblMessage29.ForeColor = System.Drawing.Color.Green;
				lblMessage29.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad29.Visible = false;
				Image29.Visible = false;
				FileUpload29.Visible = true;
				btnUploadTrad29.Visible = true;

				// Indicate Upload Failed
				lblMessage29.Visible = true;
				lblMessage29.ForeColor = System.Drawing.Color.Red;
				lblMessage29.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 30
		protected void btnUploadTrad30_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Student Scholarships", FileUpload30.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload30.Visible = false;
				btnUploadTrad30.Visible = false;
				ViewTrad30.Visible = true;
				Image30.Visible = true;

				// Indicate Upload Successful
				lblMessage30.Visible = true;
				lblMessage30.ForeColor = System.Drawing.Color.Green;
				lblMessage30.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad30.Visible = false;
				Image30.Visible = false;
				FileUpload30.Visible = true;
				btnUploadTrad30.Visible = true;

				// Indicate Upload Failed
				lblMessage30.Visible = true;
				lblMessage30.ForeColor = System.Drawing.Color.Red;
				lblMessage30.Text = "Only images (.png) can be uploaded";
			}
		}

		// Upload Tradition 31
		protected void btnUploadTrad31_Click(object sender, EventArgs e)
		{
			// Check if file uploads successfully
			if (uploadImage("Islander Lights", FileUpload31.PostedFile)) // Successful
			{
				// Only show the View button to disable multiple uploads
				FileUpload31.Visible = false;
				btnUploadTrad31.Visible = false;
				ViewTrad31.Visible = true;
				Image31.Visible = true;

				// Indicate Upload Successful
				lblMessage31.Visible = true;
				lblMessage31.ForeColor = System.Drawing.Color.Green;
				lblMessage31.Text = "Upload Successful";

				// Increase Tradition Count by 1
				updateUserCount();
			}
			else // Failed
			{
				// Hide View and show Upload buttons and show checkmark image
				ViewTrad31.Visible = false;
				Image31.Visible = false;
				FileUpload31.Visible = true;
				btnUploadTrad31.Visible = true;

				// Indicate Upload Failed
				lblMessage31.Visible = true;
				lblMessage31.ForeColor = System.Drawing.Color.Red;
				lblMessage31.Text = "Only images (.png) can be uploaded";
			}
		}
	}
}