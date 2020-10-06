<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Traditions.aspx.cs" Inherits="TraditionKeeper.Traditions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Traditions</title>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Header to include the Tradition Keeper Logo and Navigation between pages -->
        <div id="Traditions_Header">
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

        <!-- Traditions Title -->
        <div id="Traditions_Title">
            <header>
                <h2>Traditions</h2>
                <h3>Tradition List for Texas A&M University Corpus Christi</h3>
            </header>
        </div>

        <div>

        </div>
    </form>
</body>
</html>
