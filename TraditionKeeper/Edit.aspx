<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="TraditionKeeper.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit</title>
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
<body style="background-color:#0067C5">
    <form id="form1" runat="server">

        <!-- Body section to house different buttons to edit different tables -->
        <!-- NOTE: For Design, would like the buttons to be the same size and in a 2x2 grid (can be different color if you want) -->
        <div id="header" style="justify-content:center; margin-left:auto; margin-right:auto; display:flex; margin-top:8%;">
            <h1>Admin Hub</h1>
        </div>
        <div id="squareBox" style="background-color:#007F3E; justify-content:center; display: flex; width: 250px; height: 250px; margin: auto; margin-top:0%; align-items:center;">
            <div id="Edit_Body" style="margin-left:7%;">
                <h4>Choose page to edit:</h4>
                <!-- Edit Users Button -->
        	    <asp:Button ID="btnEditUsers" runat="server" Text="Users" OnClick="btnEditUsers_Click" style="width: 100px; height: 30px; margin: 3px;" class="btn-primary" />

                <!-- Edit Traditions Button -->
			    <asp:Button ID="btnEditTraditions" runat="server" Text="Traditions" OnClick="btnEditTraditions_Click" style="width: 100px; height: 30px; margin: 3px;" class="btn-primary" />

			    <br />

                <!-- Edit Buildings Button -->
			    <asp:Button ID="btnEditBuildings" runat="server" Text="Buildings" OnClick="btnEditBuildings_Click" style="width: 100px; height: 30px; margin: 3px;" class="btn-primary" />

                <!-- Edit Prizes Button -->
			    <asp:Button ID="btnEditPrizes" runat="server" Text="Prizes" OnClick="btnEditPrizes_Click" style="width: 100px; height: 30px; margin: 3px;" class="btn-primary" />

                <!-- Return home button -->
                <asp:Button ID="btnReturnHome" runat="server" Text="Return Home" OnClick="btnReturnHome_Click" style="width: 200px; height: 30px; margin-left:8px; margin-top:2px;" class="btn-primary" />
            </div>
        </div>
        
    </form>
</body>
</html>
