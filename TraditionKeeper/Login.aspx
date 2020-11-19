<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TraditionKeeper.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="/assets/StyleSheet1.css" />
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="/assets/main.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Div to hold the Login functionality -->
        <!-- NOTE: For design, would like the login to be centered on screen and white with a blue or pictured main background -->
        <div>

            <!-- Header to include the Tradition Keeper Logo -->
            <div id="Login_Header">
                <img src="/images/TK_Logo.png" width="400" height="300" style="display:block; margin-left:auto; margin-right:auto;" />
            </div>

            <!-- Body to include the textboxes and buttons -->
            <!-- TODO: Add Validation to inputs -->
            <!-- TODO: Add SQL Database Source -->
            <div id="Login_Body" style="margin: 0 auto; width:400px; height:400px;">

                <!-- Username -->
            	<asp:Label ID="lblUsername" runat="server" Text="Username:" style="margin: 10px auto; margin-left: 65px; margin-top:15px;"></asp:Label>
				<asp:TextBox ID="txtUsername" runat="server" style=" margin-top:15px;"></asp:TextBox>

				<br />

                <!-- Password -->
				<asp:Label ID="lblPassword" runat="server" Text="Password:" style="margin: 10px auto; margin-left: 65px; margin-top:2px;"></asp:Label>
				<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" style="margin-left:4px; margin-top:2px;"></asp:TextBox>

            	<br />
				<asp:Label ID="lblLoginFailed" runat="server" ForeColor="#CC0000" Text="Login Failed" Visible="False" style="margin: 10px auto; margin-left: 65px;"></asp:Label>

            	<br />

                <!-- Buttons -->
				<asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn-danger" style="margin-left: 35%"/>
				<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" class="btn-success" style="margin: 10px auto;"/>

            </div>
        </div>
    	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TraditionKeeperConnectionString %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
    </form>
    <footer>
    <!-- Copyright -->
          <div class="footer-copyright text-center py-3" style="background-color:#0257a6">© 2020 Copyright:
            <a href="https://www.tamucc.edu/" style="color:white"> https://www.tamucc.edu</a>
          </div>
          <!-- Copyright -->
    </footer>
</body>
</html>
