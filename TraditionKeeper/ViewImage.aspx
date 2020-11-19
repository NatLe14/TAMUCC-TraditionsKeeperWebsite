<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewImage.aspx.cs" Inherits="TraditionKeeper.ViewImage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Viewing Image</title>
</head>
<body style="background-color:dimgray">
    <form id="form1" runat="server">
        <div style="margin-top:5%;">
        	<asp:Image ID="Image1" runat="server" style="position:center; display:block; margin-left:auto; margin-right:auto; margin-top:auto; margin-bottom:auto; border:1px solid black; border-radius:5px;" />
        </div>
    </form>
</body>
</html>
