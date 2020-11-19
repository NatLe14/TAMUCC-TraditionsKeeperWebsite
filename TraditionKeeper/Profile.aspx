<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TraditionKeeper.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
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
    <style type="text/css">
        .modalPopup
        {
            background-color: #FFFFFF;
            width: 800px;
            border: 3px solid #0DA9D0;
            height: 450px;

        }
        .modalPopup .header
        {
            background-color: #2FBDF1;
            height: 30px;
            color: white;
            line-height: 30px;
            text-align: center;
            font-weight: bold;
        }
        .modalPopup .footer
        {
            padding: 3px;
        }
        .modalPopup .button
        {
            height: 23px;
            color: white;
            line-height: 23px;
            text-align: center;
            font-weight: bold;
            cursor: pointer;
            background-color: red;
            border: 1px solid #5C5C5C;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
        
       

        <!-- Header to include the Tradition Keeper Logo and Navigation between pages -->
        <div class="container">
            <div class="navbar-header">
                
                   <nav class="navbar fixed-top " style="background-color:#0067C5">
                                <a class="" href="Home.aspx">
                                    <img src="images/TK_Logo_Transparent.png" class="" style="position:center; display:block; margin-left:10px;" width="150"  />
                                </a>
                            <ul class="nav align-content-end" style="position:absolute; left:12%;">
                                <li  class="nav-item nav-link "><a href="Home.aspx" class="text-white"><i class="fa fa-home"></i>Home</a></li>
                                <li  class="nav-item nav-link "><a href="Profile.aspx" class="text-white"><i class="fa fa-user"></i>Profile</a></li>
                                <li  class="nav-item nav-link active"><a href="Traditions.aspx"class="text-white">Traditions</a></li>
                                <li  class="nav-item nav-link "><a href="History.aspx"class="text-white">History</a></li>
                                <li  class="nav-item nav-link "><a href="Buildings.aspx"class="text-white">Buildings</a></li>
                                <li  class="nav-item nav-link "><a href="Prizes.aspx"class="text-white">Prizes</a></li>
                                
                            </ul>
                            <ul class="nav">
                                
                            </ul>
                            
                            <div style="position:absolute; left:90%; top:15%;" >
                                <asp:Label ID="lblHelloUser" runat="server" Text="Hello, " ForeColor="White"></asp:Label>
                            </div>
                            
                            <div class="btn-group" style="position:absolute; left:90%; top:35%;">
                                        <!-- Logout Button -->
				                        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-success"/>
                                        <!-- Login Button -->
        	                            <asp:Label ID="lblLogin" runat="server" Text="" ></asp:Label>
			                            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" CssClass="btn btn-success"/>
                            </div>
                    </nav>
                   </div>
            </div>
        <h1><br /><br /><br /><br /></h1>

        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <img src="/images/Default_Profile.png" width="300" />
                    <br />
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
                <div class="col-md-8">
                    <h1>Your Profile</h1>
                    <asp:Label ID="lblProfileUsername" runat="server" Text="[Username]" style="font-size: 24px; font-weight:bold;"></asp:Label>
                    <p class="lead">
                        Information<br />
                        This is where you can view your profile and track your list of tasks to do.
                        Have fun!
                    </p>
                    <hr />
                    <h4>Islander Bucket List</h4>
                    <div class="custom-control custom-checkbox">
                        <!-- Tradition 1 -->
						<asp:Image ID="Image1" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image1">Anchors Aweigh</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Button ID="btnUploadTrad1" runat="server" Height="33px" OnClick="btnUploadTrad1_Click" Text="Upload" />
						<asp:Button ID="ViewTrad1" runat="server" Text="View" class="btn btn-success" CommandName="1" OnClick="viewImage" />
						<asp:Label ID="lblMessage1" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 2 -->
                        <asp:Image ID="Image2" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image2">Art Museum</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<asp:FileUpload ID="FileUpload2" runat="server" />
                        <asp:Button ID="btnUploadTrad2" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad2_Click" />
                        <asp:Button ID="ViewTrad2" runat="server" Text="View" class="btn btn-success" CommandName="2" OnClick="viewImage" />
                        <asp:Label ID="lblMessage2" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 3 -->
                        <asp:Image ID="Image3" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image3">Art Show</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload3" runat="server" />
                        <asp:Button ID="btnUploadTrad3" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad3_Click" />
                        <asp:Button ID="ViewTrad3" runat="server" Text="View" class="btn btn-success" CommandName="3" OnClick="viewImage" />
                        <asp:Label ID="lblMessage3" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 4 -->
                        <asp:Image ID="Image4" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image4">Athletics Game</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload4" runat="server" />
                        <asp:Button ID="btnUploadTrad4" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad4_Click" />
                        <asp:Button ID="ViewTrad4" runat="server" Text="View" class="btn btn-success" CommandName="4" OnClick="viewImage" />
                        <asp:Label ID="lblMessage4" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 5 -->
                        <asp:Image ID="Image5" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image5">The Big Event</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<asp:FileUpload ID="FileUpload5" runat="server" />
                        <asp:Button ID="btnUploadTrad5" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad5_Click" />
                        <asp:Button ID="ViewTrad5" runat="server" Text="View" class="btn btn-success" CommandName="5" OnClick="viewImage" />
                        <asp:Label ID="lblMessage5" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 6 -->
                        <asp:Image ID="Image6" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image6">Block Party</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<asp:FileUpload ID="FileUpload6" runat="server" />
                        <asp:Button ID="btnUploadTrad6" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad6_Click" />
                        <asp:Button ID="ViewTrad6" runat="server" Text="View" class="btn btn-success" CommandName="6" OnClick="viewImage" />
                        <asp:Label ID="lblMessage6" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 7 -->
                        <asp:Image ID="Image7" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image7">Bluesday Tuesday</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<asp:FileUpload ID="FileUpload7" runat="server" />
                        <asp:Button ID="btnUploadTrad7" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad7_Click" />
                        <asp:Button ID="ViewTrad7" runat="server" Text="View" class="btn btn-success" CommandName="7" OnClick="viewImage" />
                        <asp:Label ID="lblMessage7" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 8 -->
                        <asp:Image ID="Image8" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image8">Cat Alley</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload8" runat="server" />
                        <asp:Button ID="btnUploadTrad8" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad8_Click" />
                        <asp:Button ID="ViewTrad8" runat="server" Text="View" class="btn btn-success" CommandName="8" OnClick="viewImage" />
                        <asp:Label ID="lblMessage8" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 9 -->
                        <asp:Image ID="Image9" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image9">Dance Marathon</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload9" runat="server" />
                        <asp:Button ID="btnUploadTrad9" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad9_Click" />
                        <asp:Button ID="ViewTrad9" runat="server" Text="View" class="btn btn-success" CommandName="9" OnClick="viewImage" />
                        <asp:Label ID="lblMessage9" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 10 -->
                        <asp:Image ID="Image10" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image10">Deep End</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload10" runat="server" />
                        <asp:Button ID="btnUploadTrad10" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad10_Click" />
                        <asp:Button ID="ViewTrad10" runat="server" Text="View" class="btn btn-success" CommandName="10" OnClick="viewImage" />
                        <asp:Label ID="lblMessage10" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 11 -->
                        <asp:Image ID="Image11" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image11">Fight Song</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<asp:FileUpload ID="FileUpload11" runat="server" />
                        <asp:Button ID="btnUploadTrad11" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad11_Click" />
                        <asp:Button ID="ViewTrad11" runat="server" Text="View" class="btn btn-success" CommandName="11" OnClick="viewImage" />
                        <asp:Label ID="lblMessage11" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 12 -->
                        <asp:Image ID="Image12" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image12">Hector Foot</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload12" runat="server" />
                        <asp:Button ID="btnUploadTrad12" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad12_Click" />
                        <asp:Button ID="ViewTrad12" runat="server" Text="View" class="btn btn-success" CommandName="12" OnClick="viewImage" />
                        <asp:Label ID="lblMessage12" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 13 -->
                        <asp:Image ID="Image13" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image13">Photo with Izzy</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<asp:FileUpload ID="FileUpload13" runat="server" />
                        <asp:Button ID="btnUploadTrad13" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad13_Click" />
                        <asp:Button ID="ViewTrad13" runat="server" Text="View" class="btn btn-success" CommandName="13" OnClick="viewImage" />
                        <asp:Label ID="lblMessage13" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 14 -->
                        <asp:Image ID="Image14" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image14">Izzy Birthday Fiesta</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<asp:FileUpload ID="FileUpload14" runat="server" />
                        <asp:Button ID="btnUploadTrad14" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad14_Click" />
                        <asp:Button ID="ViewTrad14" runat="server" Text="View" class="btn btn-success" CommandName="14" OnClick="viewImage" />
                        <asp:Label ID="lblMessage14" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 15 -->
                        <asp:Image ID="Image15" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image15">Late Night Breakfast</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload15" runat="server" />
                        <asp:Button ID="btnUploadTrad15" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad15_Click" />
                        <asp:Button ID="ViewTrad15" runat="server" Text="View" class="btn btn-success" CommandName="15" OnClick="viewImage" />
                        <asp:Label ID="lblMessage15" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 16 -->
                        <asp:Image ID="Image16" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image16">Lighting of the "I"</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<asp:FileUpload ID="FileUpload16" runat="server" />
                        <asp:Button ID="btnUploadTrad16" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad16_Click" />
                        <asp:Button ID="ViewTrad16" runat="server" Text="View" class="btn btn-success" CommandName="16" OnClick="viewImage" />
                        <asp:Label ID="lblMessage16" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 17 -->
                        <asp:Image ID="Image17" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image17">Mariachi</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload17" runat="server" />
                        <asp:Button ID="btnUploadTrad17" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad17_Click" />
                        <asp:Button ID="ViewTrad17" runat="server" Text="View" class="btn btn-success" CommandName="17" OnClick="viewImage" />
                        <asp:Label ID="lblMessage17" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 18 -->
                        <asp:Image ID="Image18" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image18">Photo at Momentum</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<asp:FileUpload ID="FileUpload18" runat="server" />
                        <asp:Button ID="btnUploadTrad18" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad18_Click" />
                        <asp:Button ID="ViewTrad18" runat="server" Text="View" class="btn btn-success" CommandName="18" OnClick="viewImage" />
                        <asp:Label ID="lblMessage18" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 19 -->
                        <asp:Image ID="Image19" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image19">Join a Club</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<asp:FileUpload ID="FileUpload19" runat="server" />
                        <asp:Button ID="btnUploadTrad19" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad19_Click" />
                        <asp:Button ID="ViewTrad19" runat="server" Text="View" class="btn btn-success" CommandName="19" OnClick="viewImage" />
                        <asp:Label ID="lblMessage19" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 20 -->
                        <asp:Image ID="Image20" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image20">Parade of Nations</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload20" runat="server" />
                        <asp:Button ID="btnUploadTrad20" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad20_Click" />
                        <asp:Button ID="ViewTrad20" runat="server" Text="View" class="btn btn-success" CommandName="20" OnClick="viewImage" />
                        <asp:Label ID="lblMessage20" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 21 -->
                        <asp:Image ID="Image21" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image21">Performing Arts Center</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload21" runat="server" />
                        <asp:Button ID="btnUploadTrad21" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad21_Click" />
                        <asp:Button ID="ViewTrad21" runat="server" Text="View" class="btn btn-success" CommandName="21" OnClick="viewImage" />
                        <asp:Label ID="lblMessage21" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 22 -->
                        <asp:Image ID="Image22" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image22">Patio Jam</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload22" runat="server" />
                        <asp:Button ID="btnUploadTrad22" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad22_Click" />
                        <asp:Button ID="ViewTrad22" runat="server" Text="View" class="btn btn-success" CommandName="22" OnClick="viewImage" />
                        <asp:Label ID="lblMessage22" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 23 -->
                        <asp:Image ID="Image23" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image23">President's Picnic</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<asp:FileUpload ID="FileUpload23" runat="server" />
                        <asp:Button ID="btnUploadTrad23" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad23_Click" />
                        <asp:Button ID="ViewTrad23" runat="server" Text="View" class="btn btn-success" CommandName="23" OnClick="viewImage" />
                        <asp:Label ID="lblMessage23" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 24 -->
                        <asp:Image ID="Image24" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image24">Islander Ring Wish</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<asp:FileUpload ID="FileUpload24" runat="server" />
                        <asp:Button ID="btnUploadTrad24" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad24_Click" />
                        <asp:Button ID="ViewTrad24" runat="server" Text="View" class="btn btn-success" CommandName="24" OnClick="viewImage" />
                        <asp:Label ID="lblMessage24" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 25 -->
                        <asp:Image ID="Image25" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image25">Shakas Up Woosh!</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload25" runat="server" />
                        <asp:Button ID="btnUploadTrad25" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad25_Click" />
                        <asp:Button ID="ViewTrad25" runat="server" Text="View" class="btn btn-success" CommandName="25" OnClick="viewImage" />
                        <asp:Label ID="lblMessage25" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 26 -->
                        <asp:Image ID="Image26" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image26">Theater Production</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload26" runat="server" />
                        <asp:Button ID="btnUploadTrad26" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad26_Click" />
                        <asp:Button ID="ViewTrad26" runat="server" Text="View" class="btn btn-success" CommandName="26" OnClick="viewImage" />
                        <asp:Label ID="lblMessage26" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 27 -->
                        <asp:Image ID="Image27" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image27">Hike and Bike</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload27" runat="server" />
                        <asp:Button ID="btnUploadTrad27" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad27_Click" />
                        <asp:Button ID="ViewTrad27" runat="server" Text="View" class="btn btn-success" CommandName="27" OnClick="viewImage" />
                        <asp:Label ID="lblMessage27" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 28 -->
                        <asp:Image ID="Image28" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image28">Sunrise @ University Beach</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload28" runat="server" />
                        <asp:Button ID="btnUploadTrad28" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad28_Click" />
                        <asp:Button ID="ViewTrad28" runat="server" Text="View" class="btn btn-success" CommandName="28" OnClick="viewImage" />
                        <asp:Label ID="lblMessage28" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 29 -->
                        <asp:Image ID="Image29" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image29">Heritage Month</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<asp:FileUpload ID="FileUpload29" runat="server" />
                        <asp:Button ID="btnUploadTrad29" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad29_Click" />
                        <asp:Button ID="ViewTrad29" runat="server" Text="View" class="btn btn-success" CommandName="29" OnClick="viewImage" />
                        <asp:Label ID="lblMessage29" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 30 -->
                        <asp:Image ID="Image30" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image30">Student Scholarships Donation</label>&nbsp;
						<asp:FileUpload ID="FileUpload30" runat="server" />
                        <asp:Button ID="btnUploadTrad30" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad30_Click" />
                        <asp:Button ID="ViewTrad30" runat="server" Text="View" class="btn btn-success" CommandName="30" OnClick="viewImage" />
                        <asp:Label ID="lblMessage30" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />

                        <!-- Tradition 31 -->
                        <asp:Image ID="Image31" runat="server" Height="15px" Visible="False" Width="15px" ImageUrl="images/checkmark.png" />
                        <label for="Image31">Islander Lights</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:FileUpload ID="FileUpload31" runat="server" />
                        <asp:Button ID="btnUploadTrad31" runat="server" Height="33px" Text="Upload" OnClick="btnUploadTrad31_Click" />
                        <asp:Button ID="ViewTrad31" runat="server" Text="View" class="btn btn-success" CommandName="31" OnClick="viewImage" />
                        <asp:Label ID="lblMessage31" runat="server" Text="[Message]" Visible="False"></asp:Label>
                        <br /><br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </div>
                </div>
            </div>
            
        </div>

        

        <div class="modal fade" id="myModal" visible="True" >
            <div class="modal-dialog modal-lg" >
                <div class="modal-content" >
                    <div class="modal-header">
                        <h2 class="modal-title">Viewing Image</h2>
                        <a href="#" class="close" data-dismiss="modal">&times;</a>
                    </div>
                    <div class="modal-body">
                        <img id="imgShow" runat="server" src="/images/Default_Profile.png" style="display:block; margin-left:auto; margin-right:auto;"/>
                    </div>
                    <div class="modal-footer"></div>
                </div>
            </div>
        </div>
        
    </form>
    <footer class="page-footer font-small white pt-4" style="background-color:#0067C5">
        <div class="container text-center text-md-left">
            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <h5 class="text-uppercase">Other Content</h5>
                    <p>Links related to TAMUCC</p>
                </div>
                <hr class="clearfix w-100 d-md-none pb-3">

              <!-- Grid column -->
              <div class="col-md-3 mb-md-0 mb-3">

                <!-- Links -->
                <h5 class="text-uppercase">Links</h5>

                <ul class="list-unstyled">
                  <li>
                    <a href="http://www.goislanders.com/?utm_source=footer&utm_campaign=tamucc.edu&utm_medium=islander_athletics" style="color:white">Islander Athletics</a>
                  </li>
                  <li>
                    <a href="https://www.tamucc.edu/about/location/?utm_source=footer&utm_campaign=tamucc.edu&utm_medium=campus_map" style="color:white">Campus Map</a>
                  </li>
                </ul>
                 
              </div>
              <!-- Grid column -->

              <!-- Grid column -->
              <div class="col-md-3 mb-md-0 mb-3">

                <!-- Links -->
                <h5 class="text-uppercase">Links</h5>

                <ul class="list-unstyled">
                  <li>
                    <a href="https://bb9.tamucc.edu/?utm_source=footer&utm_campaign=tamucc.edu&utm_medium=blackboard" style="color:white">BlackBoard</a>
                  </li>
                  <li>
                    <a href="https://sail.tamucc.edu/" style="color:white">TAMUCC SAIL</a>
                  </li>
                </ul>
                  

              </div>
              <!-- Grid column -->

            </div>
            <!-- Grid row -->

          </div>
          <!-- Footer Links -->

          <!-- Copyright -->
          <div class="footer-copyright text-center py-3" style="background-color:#0257a6">© 2020 Copyright:
            <a href="https://www.tamucc.edu/" style="color:white"> https://www.tamucc.edu</a>
          </div>
          <!-- Copyright -->
    </footer>
</body>
</html>
