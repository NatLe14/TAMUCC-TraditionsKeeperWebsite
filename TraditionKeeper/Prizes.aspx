<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prizes.aspx.cs" Inherits="TraditionKeeper.Prizes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Prizes</title>
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
				                        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-success"/>
                                        <!-- Login Button -->
        	                            <asp:Label ID="lblLogin" runat="server" Text="" ></asp:Label>
			                            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" CssClass="btn btn-success"/>
                            </div>
                    </nav>
                   </div>
            </div>
        <h1><br /><br /><br /><br /></h1>

         <section id="content">
            <div class="container">
                <div class="row">
                    <div class="col-3 col-12-medium">

                        <!-- Sidebar -->
                        <section>
                            <header>
                                <h2>Prizes List</h2>
                            </header>
                            <ul class="link-list">
                                <li><a id="prize1Sidebar" runat="server" href="#P1" style="color:#0067C5">Prize #1</a></li>
                                <li><a id="prize2Sidebar" runat="server" href="#P2" style="color:#0067C5">Prize #2</a></li>
                                <li><a id="prize3Sidebar" runat="server" href="#P3" style="color:#0067C5">Prize #3</a></li>
                                <li><a id="prize4Sidebar" runat="server" href="#P4" style="color:#0067C5">Prize #4</a></li>
                                <li><a id="prize5Sidebar" runat="server" href="#P5" style="color:#0067C5">Prize #5</a></li>
                            </ul>
                        </section>
                    </div>
                    
                    <div class="col-9 col-12-medium imp-medium">

                        <!-- Main Content -->
                        <section class="align-content-center">
                            <header>
                                <h2>Islander Prizes</h2>
                                <h3>Information About Prizes<br />Prizes can be redeemed with Student Alumni Association<br /> At UC or Alumni Welcome Center</h3>
                            </header>
                            
                            <hr />
                            <hr />
                            <br />
                            <!-- Prize 1 -->
                            <div style ="margin-top:15px; margin-bottom:75px;">
                                <a id="P1"></a><img src="images/prizes/prize1_banner.png" style="width:200px; height:200px; display:flex; float:left; border:1px solid black; border-radius:5px; margin-right: 50px;"/>
                                <h2>Prize #1</h2>
                                <h3 id="prize1Name" runat="server">Prize Name</h3>
                                <p id="prize1Description" runat="server">
                                    To redeem do # traditions.
                                </p>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </div>
                            <!-- Prize 2 -->
                            <div style ="margin-top:75px; margin-bottom:50px;">
                                <a id="P2"></a>
                                <img src="images/prizes/prize2_waterbottle.png" style="width:200px; height:200px; display:flex; float:left; border:1px solid black; border-radius:5px; margin-right:50px;"/>
                                <h2>Prize #2</h2>
                                <h3 id="prize2Name" runat="server">Prize Name</h3>
                                <p id="prize2Description" runat="server">
                                    To redeem do # traditions.
                                </p>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </div>
                            <!-- Prize 3 -->
                            <div style ="margin-top:75px; margin-bottom:50px;">
                                <a id="P3"></a>
                                <img src="images/prizes/prize3_flag.png" style="width:200px; height:200px; display:flex; float:left; border:1px solid black; border-radius:5px; margin-right:50px;"/>
                                <h2>Prize #3</h2>
                                <h3 id="prize3Name" runat="server">Prize Name</h3>
                                <p id="prize3Description" runat="server">
                                    To redeem do # traditions.
                                </p>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </div>
                            <!-- Prize 4 -->
                            <div style ="margin-top:75px; margin-bottom:50px;">
                                <a id="P4"></a>
                                <img src="images/prizes/prize4_hoodie.png" style="width:200px; height:200px; display:flex; float:left; border:1px solid black; border-radius:5px; margin-right:50px;"/>
                                <h2>Prize #4</h2>
                                <h3 id="prize4Name" runat="server">Prize Name</h3>
                                <p id="prize4Description" runat="server">
                                    To redeem do # traditions.
                                </p>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </div>
                            <!-- Prize 5 -->
                            <div style ="margin-top:75px; margin-bottom:50px;">
                                <a id="P5"></a>
                                <img src="images/prizes/prize5_medal.png" style="width:200px; height:200px; display:flex; float:left; border:1px solid black; border-radius:5px; margin-right:50px;"/>
                                <h2>Prize #5</h2>
                                <h3 id="prize5Name" runat="server">Prize Name</h3>
                                <p id="prize5Description" runat="server">
                                    To redeem do # traditions.
                                </p>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </div>
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
