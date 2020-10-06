<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TraditionKeeper.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Div to hold the Login functionality -->
        <!-- NOTE: For design, would like the login to be centered on screen and white with a blue or pictured main background -->
        <div>

            <!-- Header to include the Tradition Keeper Logo -->
            <div id="Login_Header">
                <img src="/images/TK_Logo.png" width="400" height="300" />
            </div>

            <!-- Body to include the textboxes and buttons -->
            <!-- TODO: Add Validation to inputs -->
            <!-- TODO: Add SQL Database Source -->
            <div id="Login_Body">

                <!-- Username -->
            	<asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label>
				<asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

				<br />

                <!-- Password -->
				<asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
				<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

            	<br />
				<asp:Label ID="lblLoginFailed" runat="server" ForeColor="#CC0000" Text="Login Failed" Visible="False"></asp:Label>

            	<br />

                <!-- Buttons -->
				<asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
				<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />

            </div>
        </div>
    	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TraditionKeeperConnectionString %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
    </form>
</body>
</html>
