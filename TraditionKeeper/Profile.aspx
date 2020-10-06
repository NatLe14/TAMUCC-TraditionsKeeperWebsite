<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TraditionKeeper.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Header to include the Tradition Keeper Logo and Navigation between pages -->
        <div id="Profile_Header">
            <img src="/images/TK_Logo.png" width="400" height="300" />

            <nav id="nav">
                <a href="Home.aspx">Home</a>
                <a href="Profile.aspx">Profile</a>
                <a href="Traditions.aspx">Traditions</a>
                <a href="History.aspx">History</a>
                <a href="Buildings.aspx">Buildings</a>
                <a href="Prizes.aspx">Prizes</a>
            </nav>
        </div>

        <!-- Profile Title -->
        <div id="Profile_Title">
            <header>
                <h2>Profile</h2>
            </header>
        </div>
        
        <div id="User_Details">
            <!-- User Profile Image (Default blank person currently) -->
            <div id="User_Image">
                <img src="/images/Default_Profile.png" width="200" height="200" />
            </div>

            <!-- User Username -->
            <!-- NOTE: For design, would like large bolded letters to emphasize the username -->
            <!-- NOTE: For design, can maybe put username under default profile image -->
            <div id="User_Username">

            	<asp:Label ID="lblProfileUsername" runat="server" Text="[Username]"></asp:Label>

            </div>

            <!-- User Information from Database -->
            <div id="User_Info">

            	<asp:Label ID="lblProfileFName" runat="server" Text="First Name:"></asp:Label>
				<br />
				<asp:Label ID="lblProfileLName" runat="server" Text="Last Name:"></asp:Label>
				<br />
				<asp:Label ID="lblProfileEmail" runat="server" Text="Email:"></asp:Label>
				<br />
				<asp:Label ID="lblProfileClass" runat="server" Text="Class:"></asp:Label>
				<br />
				<asp:Label ID="lblProfileTradCount" runat="server" Text="Tradition Count:"></asp:Label>

            </div>
        </div>
    </form>
</body>
</html>
