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
				                        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-success" Visible="False"/>
                                        <!-- Login Button -->
        	                            <asp:Label ID="lblLogin" runat="server" Visible="False" ></asp:Label>
			                            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" CssClass="btn btn-success"/>
                            </div>
                    
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
                                <h2>List of Buildings</h2>
                            </header>
                            <ul class="link-list">
                                <li><a href="#UC" style="color:#0067C5">University Center</a></li>
                                <li><a href="#SP" style="color:#0067C5">Sam's Place</a></li>
                                <li><a href="#OC" style="color:#0067C5">O'Connor</a></li>
                                <li><a href="#HectorPlaza" style="color:#0067C5">Hector P. Garcia Plaza</a></li>
                                <li><a href="#DWC" style="color:#0067C5">Dugan Wellness Center</a></li>
                                <li><a href="#DS" style="color:#0067C5">Dugan Stadium</a></li>
                                <li><a href="#LP" style="color:#0067C5">Lee Place</a></li>
                                <li><a href="#AWC" style="color:#0067C5">Alumni Welcome Center</a></li>
                                <li><a href="#BL" style="color:#0067C5">Bell Library</a></li>
                                <li><a href="#PAC" style="color:#0067C5">Performing Arts Center</a></li>
                                <li><a href="#FB" style="color:#0067C5">Ferguson Engineering Buidling</a></li>

                            </ul>
                        </section>
                        

                    </div>
                    
                    <div class="col-9 col-12-medium imp-medium">

                        <!-- Main Content -->
                        <section class="align-content-center">
                            <header>
                                <h2><br />Buildings</h2>
                                <h3>Information About Buildings here at TAMU-CC<br /></h3>
                            </header>
                            <hr />
                            <hr />
                            <br />

                            <a id="UC"></a><img src="images/buildings/universitycenter.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center">University Center</h2>
                            <p id="BuildDescUC" runat="server">
                                Test
                            </p>
                            <hr />

                            <a id="SP"></a><img src="images/buildings/samsplace.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center">Sam's Place</h2>
                            <p id="BuildDescSP" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="OC"></a><img src="images/buildings/oconnorbuilding.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center">O'Connor Building</h2>
                            <p id="BuildDescOC" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="HectorPlaza"></a><img src="images/buildings/garciaplaza.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center">Hector P. Garcia Plaza</h2>
                            <p id="BuildDescHP" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="DWC"></a><img src="images/buildings/duganwellness.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center">Dugan Wellness Center</h2>
                            <p id="BuildDescDWC" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="DS"></a><img src="images/buildings/duganstadium.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center">Dugan Stadium</h2>
                            <p id="BuildDescDS" runat="server">
                                Blank
                            </p>
                            <hr />

                             <a id="LP"></a><img src="images/buildings/leeplaza.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center">Lee Place</h2>
                            <p id="BuildDescLP" runat="server">
                                Blank
                            </p>
                            <hr />

                             <a id="AWC"></a><img src="images/buildings/leehouse.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center">Alumni Welcome Center</h2>
                            <p id="BuildDescAWC" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="BL"></a><img src="images/buildings/bellLibrary.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center">Bell Library</h2>
                            <p id="BuildDescBL" runat="server">
                                Blank
                            </p>
                            <hr />

                             <a id="PAC"></a><img src="images/buildings/pac.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center">Performing Arts Center</h2>
                            <p id="BuildDescPAC" runat="server">
                                Blank
                            </p>
                            <hr />

                             <a id="FB"></a><img src="images/buildings/fergusonbuilding.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center">Ferguson Engineering Building</h2>
                            <p id="BuildDescFB" runat="server">
                                Blank
                            </p>
                            
                        </section>
                    </div>
                </div>
            </div>
        </section>

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
