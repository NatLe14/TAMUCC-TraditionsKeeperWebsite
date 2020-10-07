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
                
                    <nav class="navbar fixed-top justify-content-between" style="background-color:#0067C5">
            
                            <ul class="nav">
                                <li  class="nav-item nav-link active"><a href="Home.aspx" class="text-white"><i class="fa fa-home"></i>Home</a></li>
                                <li  class="nav-item nav-link "><a href="Profile.aspx" class="text-white"><i class="fa fa-user"></i>Profile</a></li>
                                <li  class="nav-item nav-link "><a href="Traditions.aspx"class="text-white">Traditions</a></li>
                                <li  class="nav-item nav-link "><a href="History.aspx"class="text-white">History</a></li>
                                <li  class="nav-item nav-link "><a href="Buildings.aspx"class="text-white">Buildings</a></li>
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
        

        <!-- Header to include the Tradition Keeper Logo and Navigation between pages and User Logout button
        <div id="Home_Header">
            <!-- Tradition Keeper Logo 
            <img src="/images/TK_Logo.png" width="400" height="300" />-->

            <!-- Navigation Bar 
            <nav id="nav">
                <a href="Home.aspx">Home</a>
                <a href="Profile.aspx">Profile</a>
                <a href="Traditions.aspx">Traditions</a>
                <a href="History.aspx">History</a>
                <a href="Buildings.aspx">Buildings</a>
                <a href="Prizes.aspx">Prizes</a>

                
            
        </div>
        
            <!-- Home Title -->
        <section id="body">
            <div class="container">
                <h1><br /><br /><br /></h1>
                <div id="Home_Title" class="row align-items">
                
                    <div class="col-lg-7">
                        <img class="img-fluid rounded mb-4 mb-lg-0" src="images/izzystd.jpg" width="400" height="400" alt="">
                      </div>
                      <!-- /.col-lg-8 -->
                      <div class="col-lg-5">
                        <h1 class="font-weight-light">Welcome!</h1>
                        <p>This is a template that is great for small businesses. It doesn't have too much fancy flare to it, but it makes a great use of the standard Bootstrap core components. Feel free to use this template for any project you want!</p>
                        
                      </div>

                
                </div>
            </div>
                <h1><br /><br /></h1>
            <div class="row">
                
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <div class="card-body">
            <h2 class="card-title">Card One</h2>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary btn-sm">More Info</a>
          </div>
        </div>
      </div>
      <!-- /.col-md-4 -->
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <div class="card-body">
            <h2 class="card-title">Card Two</h2>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod tenetur ex natus at dolorem enim! Nesciunt pariatur voluptatem sunt quam eaque, vel, non in id dolore voluptates quos eligendi labore.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary btn-sm">More Info</a>
          </div>
        </div>
      </div>
      <!-- /.col-md-4 -->
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <div class="card-body">
            <h2 class="card-title">Card Three</h2>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary btn-sm">More Info</a>
          </div>
        </div>
      </div>
      <!-- /.col-md-4 -->

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
                    <a href="http://www.goislanders.com/?utm_source=footer&utm_campaign=tamucc.edu&utm_medium=islander_athletics">Islander Athletics</a>
                  </li>
                  <li>
                    <a href="https://www.tamucc.edu/about/location/?utm_source=footer&utm_campaign=tamucc.edu&utm_medium=campus_map">Campus Map</a>
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
                    <a href="https://bb9.tamucc.edu/?utm_source=footer&utm_campaign=tamucc.edu&utm_medium=blackboard">BlackBoard</a>
                  </li>
                  <li>
                    <a href="http://www.tamucc.edu/about/history.html?utm_source=footer&utm_campaign=tamucc.edu&utm_medium=history_of_the_university">History of the University</a>
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
            <a href="https://www.tamucc.edu/"> https://www.tamucc.edu</a>
          </div>
          <!-- Copyright -->
    </footer>
</body>
</html>
