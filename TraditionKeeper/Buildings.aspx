<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Buildings.aspx.cs" Inherits="TraditionKeeper.Buildings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Buildings</title>
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

        <!-- Header to include the Tradition Keeper Logo and Navigation between pages -->
        <div class="container">
            <div class="navbar-header">
                
                    <nav class="navbar fixed-top justify-content-between" style="background-color:#0067C5">
            
                            <ul class="nav nav-pills">
                                <li  class="nav-item nav-link "><a href="Home.aspx" class="text-white"><i class="fa fa-home"></i>Home</a></li>
                                <li  class="nav-item nav-link "><a href="Profile.aspx" class="text-white"><i class="fa fa-user"></i>Profile</a></li>
                                <li  class="nav-item nav-link "><a href="Traditions.aspx"class="text-white">Traditions</a></li>
                                <li  class="nav-item nav-link "><a href="History.aspx"class="text-white">History</a></li>
                                <li  class="nav-item nav-link active"><a href="Buildings.aspx"class="text-white">Buildings</a></li>
                                <li  class="nav-item nav-link "><a href="Prizes.aspx"class="text-white">Prizes</a></li>
                            </ul>

                            <ul class="navbar-nav" >
                                <li class="nav-item">
                                    <a class="navbar-brand px-lg-4 " href="Home.aspx">
                                        <img src="images/TK_Logo.png" class="img-thumbnail" style="align-content:center" width="150" height="75" />
                                    </a>
                                </li>
                            </ul>

                            <ul class="navbar-nav justify-content-end">
                                    <!-- Login area to have the Login Button and Logout Button and Edit Button for Admin use -->
                                    <li class="nav-item"> 
                                        <!-- Login Button -->
        	                            <asp:Label ID="lblLogin" runat="server" Text="Click here to Login!" ></asp:Label>
			                            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" CssClass="btn btn-success"/>
                                    </li>
                                    <li class="nav-item">
                                        <!-- Edit Button -->
					                    <asp:Button ID="btnEdit" runat="server" Text="Edit Database" OnClick="btnEdit_Click" Visible="False"  CssClass="btn btn-info" />
                                        <!-- Logout Button -->
                                        <asp:Label ID="lblHelloUser" runat="server" Text="Hello, "></asp:Label>
				                        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"  CssClass="btn btn-success" />
                                    </li>
                            </ul>
                    
                    </nav>
                   </div>
                

            </div>
        <h1><br /><br /><br /><br /></h1>

        <!-- Traditions Title -->
        <section id="content">
            <div class="container">
                <div class="row">
                    <div class="col-3 col-12-medium">

                        <!-- Sidebar -->
                        <section>
                            <header>
                                <h2>List of Traditions</h2>
                            </header>
                            <ul class="link-list">
                                <li><a href="UC">University Center</a></li>
                                <li><a href="SP"></a>Sam's Place</li>
                                <li><a href="OC"></a>O'Connor</li>
                                <li><a href="HectorPlaza"></a>Hector P. Garcia Plaze</li>
                                <li><a href="DWC"></a>Dugan Wellness Center</li>
                                <li><a href="DS"></a>Dugan Stadium</li>
                                <li><a href="LP"></a>Lee Place</li>
                                <li><a href="AWC"></a>Alumni Welcome Center</li>
                                <li><a href="BL"></a>Bell Library</li>
                                <li><a href="PAC"></a>Performing Arts Center</li>
                                <li><a href="FB"></a>Ferguson Engineering Buidling</li>

                            </ul>
                        </section>
                        

                    </div>
                    <div class="col-9 col-12-medium imp-medium">

                        <!-- Main Content -->
                        <section>
                            <header>
                                <h2>Buildings</h2>
                                <h3>Information About Buildings here at TAMU-CC</h3>
                            </header>
                            <h2><a id="UC"></a>University Center</h2>
                            <p>
                                Test
                            </p>

                            <h2><a id="SP"></a>Sam's Place</h2>
                            <p>
                                Blank
                            </p>

                            <h2><a id="OC"></a>O'Connor Building</h2>
                            <p>
                                Blank
                            </p>

                            <h2><a id="HectorPlaza"></a>Hector P. Garcia Plaza</h2>
                            <p>
                                Blank
                            </p>
                            <h2><a id="DWC"></a>Dugan Wellness Center</h2>
                            <p>
                                Blank
                            </p>
                            <h2><a id="DS"></a>Dugan Stadium</h2>
                            <p>
                                Blank
                            </p>
                            <h2><a id="LP"></a>Lee Place</h2>
                            <p>
                                Blank
                            </p>
                            <h2><a id="AWC"></a>Alumni Welcome Center</h2>
                            <p>
                                Blank
                            </p>
                            <h2><a id="BL"></a>Bell Library</h2>
                            <p>
                                Blank
                            </p><h2><a id="PAC"></a>Performing Arts Center</h2>
                            <p>
                                Blank
                            </p>
                            <h2><a id="FB"></a>Ferguson Engineering Building</h2>
                            <p>
                                Blank
                            </p>
                            



                        </section>

                    </div>
                </div>
            </div>
        </section>

                    
        
        
         
               
    </form>
</body>
</html>
