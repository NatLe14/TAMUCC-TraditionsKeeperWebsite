using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TraditionKeeper
{
	public partial class Profile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["UserID"] == null)
			{
				Response.Redirect("Login.aspx");
			}
			else
			{
				DisplayUserInfo();
			}
		}

		private void DisplayUserInfo()
		{
			SqlConnection con = new SqlConnection("Server=tcp:traditionkeeper.database.windows.net,1433;Initial Catalog=TraditionKeeper;Persist Security Info=False;User ID=TraditionAdmin;Password=IslanderForever!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
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
	}
}