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
            
                            <ul class="nav nav-pills">
                                <li  class="nav-item nav-link active"><a href="Home.aspx" class="text-white"><i class="fa fa-home"></i>Home</a></li>
                                <li  class="nav-item nav-link "><a href="Home.aspx" class="text-white"><i class="fa fa-user"></i>Profile</a></li>
                                <li  class="nav-item nav-link "><a href="Home.aspx"class="text-white">Traditions</a></li>
                                <li  class="nav-item nav-link "><a href="Home.aspx"class="text-white">History</a></li>
                                <li  class="nav-item nav-link "><a href="Home.aspx"class="text-white">Buildings</a></li>
                                <li  class="nav-item nav-link "><a href="Home.aspx"class="text-white">Prizes</a></li>
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
					                    <asp:Button ID="btnEdit" runat="server" Text="Edit Database" OnClick="btnEdit_Click" Visible="False" />
                                        <!-- Logout Button -->
                                        <asp:Label ID="lblHelloUser" runat="server" Text="Hello, "></asp:Label>
				                        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
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
            <div id="Home_Title">
                <h2><br /><br /><br /><br /><br /></h2>
                <div id="banner">
						<div class="container">
							<div class="row row-no-gutters">
								<div class="col-sm-8" >

									<!-- Banner Copy -->
									<h1>Welcome!</h1>	
                                    <p>This book will serve as your guide for your journey at Texas A&M University of Corpus Christi. Appreciate and uphold the traditions: you are now the keeper of the TAMU-CC legacy! That’s right, you can become a Tradition Keeper simply by taking part in the traditions listed in this book. Carry your book with pride and heed the call to keep our traditions alive. Your Islander Forever family is counting on you to remember its story and create one of your own. Use this book to commemorate your experiences along the way. Your future at the university by the sea awaits!</p>
										
							    </div>

								
								<div class="col-sm-4">

									<!-- Banner Image -->
										<a  class="rounded"><img src="images/izzystd.jpg" alt="" height="400" /></a>

								</div>
							</div>
						</div>
					</div>
            </div>
        </section>

        <!-- Body section to have highlights of different sections -->
        <!-- NOTE: For design, would like the divs to be side by side horizontal -->
        <div id="Home_Body" class="container-fluid">
            
            <!-- Highlight Section 1 -->
            <div id="Home_Body_Section1" class="text-body">
                <img src="/images/IslanderLights.png" />
				<asp:Label ID="lblHighlight1" runat="server" Text="[Text about first highlight]"></asp:Label>
            </div>

            <!-- Highlight Section 2 -->
            <div id="Home_Body_Section2">
                <img src="/images/IslanderLights.png" />
				<asp:Label ID="lblHighlight2" runat="server" Text="[Text about second highlight]"></asp:Label>
            </div>

            <!-- Highlight Section 3 -->
            <div id="Home_Body_Section3">
                <img src="/images/IslanderLights.png" />
				<asp:Label ID="lblHighlight3" runat="server" Text="[Text about third highlight]"></asp:Label>
            </div>

            <!-- Highlight Section 4 -->
            <div id="Home_Body_Section4">
                <img src="/images/IslanderLights.png" />
				<asp:Label ID="lblHighlight4" runat="server" Text="[Text about fourth highlight]"></asp:Label>
            </div>
        </div>
    	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TraditionKeeperConnectionString %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
    </form>
    <footer class="page-footer font-small white pt-4" style="background-color:#0067C5">
        <div class="container text-center text-md-left">
            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <h5 class="text-uppercase">Footer Content</h5>
                    <p>Use rows and columns</p>
                </div>
                <hr class="clearfix w-100 d-md-none pb-3">

              <!-- Grid column -->
              <div class="col-md-3 mb-md-0 mb-3">

                <!-- Links -->
                <h5 class="text-uppercase">Links</h5>

                <ul class="list-unstyled">
                  <li>
                    <a href="#!">Link 1</a>
                  </li>
                  <li>
                    <a href="#!">Link 2</a>
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
                    <a href="#!">Link 3</a>
                  </li>
                  <li>
                    <a href="#!">Link 4</a>
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
