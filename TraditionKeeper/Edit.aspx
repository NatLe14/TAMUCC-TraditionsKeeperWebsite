<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="TraditionKeeper.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit</title>
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
            </nav>
        </div>

        <!-- Body section to house different buttons to edit different tables -->
        <!-- NOTE: For Design, would like the buttons to be the same size and in a 2x2 grid (can be different color if you want) -->
        <div id="Edit_Body">
            <!-- Edit Users Button -->
        	<asp:Button ID="btnEditUsers" runat="server" Text="Users" OnClick="btnEditUsers_Click" />

            <!-- Edit Traditions Button -->
			<asp:Button ID="btnEditTraditions" runat="server" Text="Traditions" OnClick="btnEditTraditions_Click" />

			<br />

            <!-- Edit Buildings Button -->
			<asp:Button ID="btnEditBuildings" runat="server" Text="Buildings" OnClick="btnEditBuildings_Click" />

            <!-- Edit Prizes Button -->
			<asp:Button ID="btnEditPrizes" runat="server" Text="Prizes" OnClick="btnEditPrizes_Click" />
        </div>
    </form>
</body>
</html>
