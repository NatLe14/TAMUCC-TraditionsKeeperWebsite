<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TraditionKeeper.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
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
                                        <!-- Edit Button -->
					                    <asp:Button ID="btnEdit" runat="server" Text="Edit Database" OnClick="btnEdit_Click" Visible="False" CssClass="btn btn-success"/>
                                        <!-- Login Button -->
        	                            <asp:Label ID="lblLogin" runat="server" Text="" ></asp:Label>
			                            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" CssClass="btn btn-success"/>
                            </div>
                    </nav>
                   </div>
            </div>
        
        <!-- Home Title -->
        <section id="body">
            <div class="container">
                <h1><br /><br /><br /></h1>
                <div id="Home_Title" class="row align-items">
                
                    <div class="col-lg-7">
                        <img class="img-fluid rounded mb-4 mb-lg-0" src="images/izzystd.jpg" width="400" height="400" alt="" />
                      </div>
                      <!-- /.col-lg-8 -->
                      <div class="col-lg-5">
                        <h1 class="font-weight-light">Welcome!</h1>
                        <br />
                        <p>This website will serve as your guide for your journey at Texas A&M University of Corpus Christi.</p>
                        <br />
                        <p>Appreciate and uphold the traditions: you are now the keeper of the TAMU-CC legacy! That’s right, 
                            you can become a Tradition Keeper simply by taking part in the traditions listed on this website. 
                            Use this website with pride and heed the call to keep our campus traditions alive. Your Islander 
                            Forever family is counting on you to remember it's story and create one of your own. Use this 
                            website to commemorate your experiences along the way. Your future at the Island University awaits!</p>
                        
                      </div>

                
                </div>
            </div>
                <h1><br /><br /></h1>
            <div class="container-fluid">
                <div class="row">
                
                      <div class="col-md-4 mb-5">
                        <div class="card h-100">
                          <div class="card-body">
                            <h2 class="card-title">Islander Traditions</h2>
                            <img src="images/traditionhome.jpg" style="width:100%; height:150px;"/>
                          </div>
                          <div class="card-footer">
                            <p class="card-text" style="text-align:center">Come look at Islander Traditions here at the University</p>
                            <a href="Traditions.aspx" class="btn btn-primary btn-sm">More Info</a>
                          </div>
                        </div>
                      </div>
                      <!-- /.col-md-4 -->
                      <div class="col-md-4 mb-5">
                        <div class="card h-100">
                          <div class="card-body">
                            <h2 class="card-title">University History</h2>
                              <img src="images/historyhome.jpg" style="width:150px; height:150px; margin-left:auto; margin-right:auto; display:block; border:1px solid black; padding:5px;"/>
                            </div>
                          <div class="card-footer">
                            <p class="card-text" style="text-align:center">Go through the past of the Island</p>
                            <a href="History.aspx" class="btn btn-primary btn-sm">More Info</a>
                          </div>
                        </div>
                      </div>
                      <!-- /.col-md-4 -->
                      <div class="col-md-4 mb-5">
                        <div class="card h-100">
                          <div class="card-body">
                            <h2 class="card-title">Campus Buildings</h2>
                              <img src="images/buildinghome.jpg" style="width:100%; height:150px;"/>
                            </div>
                          <div class="card-footer">
                            <p class="card-text" style="text-align:center">Look at the buildings on Campus</p>
                            <a href="Buildings.aspx" class="btn btn-primary btn-sm">More Info</a>
                          </div>
                        </div>
                      </div>
                      <!-- /.col-md-4 -->

                </div>
            </div>
        </section>

    	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TraditionKeeperConnectionString %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
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
