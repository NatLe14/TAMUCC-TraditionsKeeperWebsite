<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TraditionKeeper.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Header to include the Tradition Keeper Logo and Navigation between pages and User Logout button -->
        <div id="Home_Header">
            <!-- Tradition Keeper Logo -->
            <img src="/images/TK_Logo.png" width="400" height="300" />

            <!-- Navigation Bar -->
            <nav id="nav">
                <a href="Home.aspx">Home</a>
                <a href="Profile.aspx">Profile</a>
                <a href="Traditions.aspx">Traditions</a>
                <a href="History.aspx">History</a>
                <a href="Buildings.aspx">Buildings</a>
                <a href="Prizes.aspx">Prizes</a>

                <!-- Login area to have the Login Button and Logout Button and Edit Button for Admin use -->
                <div id="Home_Login_Area">
                    <!-- Login Button -->
        	        <asp:Label ID="lblLogin" runat="server" Text="Click here to Login!"></asp:Label>
			        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
                    <!-- Edit Button -->
					<asp:Button ID="btnEdit" runat="server" Text="Edit Database" OnClick="btnEdit_Click" Visible="False" />
                    <!-- Logout Button -->
                    <asp:Label ID="lblHelloUser" runat="server" Text="Hello, "></asp:Label>
				    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
                </div>
            </nav>
        </div>

        <!-- Home Title -->
        <div id="Home_Title">
            <header>
                <h2>Home</h2>
            </header>
        </div>

        <!-- Body section to have highlights of different sections -->
        <!-- NOTE: For design, would like the divs to be side by side horizontal -->
        <div id="Home_Body">
            <!-- Highlight Section 1 -->
            <div id="Home_Body_Section1">
                <img src="/images/IslanderLights.png" />
				<asp:Label ID="lblHighlight1" runat="server" Text="[Text about first highlight]"></asp:Label>
            </div>

            <!-- Highlight Section 2 -->
            <div id="Home_Body_Section2">
                <img src="/images/IslanderLights.png" />
				<asp:Label ID="lblHighlight2" runat="server" Text="[Text about second highlight]"></asp:Label>
            </div>

            <!-- Highlight Section 3 -->
            <div id="Home_Body_Section3">
                <img src="/images/IslanderLights.png" />
				<asp:Label ID="lblHighlight3" runat="server" Text="[Text about third highlight]"></asp:Label>
            </div>

            <!-- Highlight Section 4 -->
            <div id="Home_Body_Section4">
                <img src="/images/IslanderLights.png" />
				<asp:Label ID="lblHighlight4" runat="server" Text="[Text about fourth highlight]"></asp:Label>
            </div>
        </div>
    	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TraditionKeeperConnectionString %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
    </form>
</body>
</html>
