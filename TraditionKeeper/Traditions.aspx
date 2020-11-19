<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Traditions.aspx.cs" Inherits="TraditionKeeper.Traditions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Traditions</title>
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
        <div class="container ">
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
                                <h2>List of Traditions</h2>
                            </header>
                            <ul class="link-list">
                                <li><a href="#anchorsaweigh" style="color:#0067C5">Anchors Aweigh</a></li>
                                <li><a href="#artmuseum" style="color:#0067C5">Art Museum</a></li>
                                <li><a href="#artshow" style="color:#0067C5">Art Show</a></li>
                                <li><a href="#athleticsgame" style="color:#0067C5">Athletics Game</a></li>
                                <li><a href="#bigevent" style="color:#0067C5">Big Event</a></li>
                                <li><a href="#birthdayfiesta" style="color:#0067C5">Izzy's Birthday Fiesta</a></li>
                                <li><a href="#blockparty" style="color:#0067C5">Block Party</a></li>
                                <li><a href="#bluesdaytuesday" style="color:#0067C5">Bluesday Tuesday</a></li>
                                <li><a href="#catalley" style="color:#0067C5">Cat Alley</a></li>
                                <li><a href="#dancemarathon" style="color:#0067C5">Dance Marathon</a></li>
                                <li><a href="#deepend" style="color:#0067C5">Deep End</a></li>
                                <li><a href="#fightsong" style="color:#0067C5">Fight Song</a></li>
                                <li><a href="#finalsfoot" style="color:#0067C5">Finals Week</a></li>
                                <li><a href="#heritagemonths" style="color:#0067C5">Heritage Month</a></li>
                                <li><a href="#islanderlights" style="color:#0067C5">Islander Lights</a></li>
                                <li><a href="#izzy" style="color:#0067C5">Picture with Izzy</a></li>
                                <li><a href="#lightingofi" style="color:#0067C5">Lighting of the "I"</a></li>
                                <li><a href="#lnb" style="color:#0067C5">Late Night Breakfast</a></li>
                                <li><a href="#mariachi" style="color:#0067C5">Mariachi</a></li>
                                <li><a href="#momentumwave" style="color:#0067C5">Picture at the Momentum Wave</a></li>
                                <li><a href="#orgfair" style="color:#0067C5">Join a Club or Org</a></li>
                                <li><a href="#pac" style="color:#0067C5">Performing Arts Center</a></li>
                                <li><a href="#paradeofnations" style="color:#0067C5">Parade of Nations</a></li>
                                <li><a href="#patiojam" style="color:#0067C5">Patio Jam</a></li>
                                <li><a href="#presidentpicnic" style="color:#0067C5">President's Picnic</a></li>
                                <li><a href="#ringwish" style="color:#0067C5">Islander Ring Wish</a></li>
                                <li><a href="#scholarship" style="color:#0067C5">Student Scholarship</a></li>
                                <li><a href="#shakaswoosh" style="color:#0067C5">"Shaka Swoosh"</a></li>
                                <li><a href="#theater" style="color:#0067C5">Theater Production</a></li>
                                <li><a href="#trail" style="color:#0067C5">Hike and Bike Trail</a></li>
                                <li><a href="#universitybeach" style="color:#0067C5">Sunrise at University Beach</a></li>

                            </ul>
                        </section>
                        

                    </div>
                    <div class="col-9 col-12-medium imp-medium">

                        <!-- Main Content -->
                        <section>
                            <header>
                                <h2>Traditions</h2>
                                <h3>Information About Traditions here at TAMU-CC</h3>
                            </header>
                            <hr />

                            <a id="anchorsaweigh"></a>
                            <img src="images/traditions/anchorsaweigh.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Anchors Aweigh</h2>
                            <p id="TradDescAA" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="artmuseum"></a>
                            <img src="images/traditions/artmuseum.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Visit the Art Museum of South Texas</h2>
                            <p id="TradDescAM" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="artshow"></a>
                            <img src="images/traditions/artshow.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Attend a Student Art Show</h2>
                            <p id="TradDescAS" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="athleticsgame"></a>
                            <img src="images/traditions/athleticsgame.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Attend an Islander Athletics Game</h2>
                            <p id="TradDescAG" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="bigevent"></a>
                            <img src="images/traditions/bigevent.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Volunteer for BIG Event</h2>
                            <p id="TradDescBE" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="birthdayfiest"></a>
                            <img src="images/traditions/birthdayfiesta.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Party at Izzy's Birthday Fiesta</h2>
                            <p id="TradDescBF" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="blockparty"></a>
                            <img src="images/traditions/blockparty.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Attend the Homecoming Block Party</h2>
                            <p id="TradDescBP" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="bluesdaytuesday"></a>
                            <img src="images/traditions/bluesdaytuesday.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Wear Blue on Bluesday Tuesday</h2>
                            <p id="TradDescBT" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="catalley"></a>
                            <img src="images/traditions/catalley.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Take a Break in Cat Alley</h2>
                            <p id="TradDescCA" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="dancemarathon"></a>
                            <img src="images/traditions/dancemarathon.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Boogie down at Dance Marathon</h2>
                            <p id="TradDescDM" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="deepend"></a>
                            <img src="images/traditions/deepend.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Become a Member of the Deep End</h2>
                            <p id="TradDescDE" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="fightsong"></a>
                            <img src="images/traditions/fightsong.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Learn the Islander Fight Song</h2>
                            <p id="TradDescFS" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="finalsfoot"></a>
                            <img src="images/traditions/finalsfoot.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Rub Hector's P.'s Foot on Finals Week</h2>
                            <p id="TradDescHF" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="heritagemonths"></a>
                            <img src="images/traditions/heritagemonths.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Celebrate a Heritage Month</h2>
                            <p id="TradDescHM" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="islanderlights"></a>
                            <img src="images/traditions/islanderlights.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Get Festive at Islander Lights</h2>
                            <p id="TradDescIL" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="izzy"></a>
                            <img src="images/traditions/izzy.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Pose for a Picture with Izzy</h2>
                            <p id="TradDescI" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="lightingofi"></a>
                            <img src="images/traditions/lightingofi.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Show your Pride at Lighting of the "I"</h2>
                            <p id="TradDescLOI" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="lnb"></a>
                            <img src="images/traditions/lnb.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Have Late Night Breakfast in the UC</h2>
                            <p id="TradDescLNB" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="mariachi"></a>
                            <img src="images/traditions/mariachi.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Let out a <i>Grito</i> with Mariachi de la Isla</h2>
                            <p id="TradDescM" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="momentumwave"></a>
                            <img src="images/traditions/momentumwave.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Take a Picture at the Momentum Wave</h2>
                            <p id="TradDescMW" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="orgfair"></a>
                            <img src="images/traditions/orgfair.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Join a Campus Organization</h2>
                            <p id="TradDescOF" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="pac"></a>
                            <img src="images/traditions/pac.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Go to a Concert at the PAC</h2>
                            <p id="TradDescPAC" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="paradeofnations"></a>
                            <img src="images/traditions/paradeofnations.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Attend ISO's Parade of Nations</h2>
                            <p id="TradDescPON" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="patiojam"></a>
                            <img src="images/traditions/patiojam.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Listen to Music at Patio Jam</h2>
                            <p id="TradDescPJ" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="presidentpicnic"></a>
                            <img src="images/traditions/presidentpicnic.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Enjoy a Lunch at President's Picnic</h2>
                            <p id="TradDescPP" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="ringwish"></a>
                            <img src="images/traditions/ringwish.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Make your Islander Ring Wish</h2>
                            <p id="TradDescRW" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="scholarship"></a>
                            <img src="images/traditions/scholarship.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Donate to a Student Scholarship</h2>
                            <p id="TradDescSCHOLAR" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="shakaswoosh"></a>
                            <img src="images/traditions/shakaswoosh.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>"Shaka Swoosh" at a Basketball Game</h2>
                            <p id="TradDescSS" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="theater"></a>
                            <img src="images/traditions/theater.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Attend a Theater Show</h2>
                            <p id="TradDescTHEATER" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="trail"></a>
                            <img src="images/traditions/trail.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Walk or Run the Hike and Bike Trail</h2>
                            <p id="TradDescHAB" runat="server">
                                Blank
                            </p>
                            <hr />

                            <a id="universitybeach"></a>
                            <img src="images/traditions/universitybeach.jpg" style="position:center; width:400px; height:200px; display:block; margin-left:auto; margin-right:auto; border:1px solid black; border-radius:5px;"/>
                            <br />
                            <h2 style="text-align: center"><a id=""></a>Take in the View at Univeristy Beach</h2>
                            <p id="TradDescUB" runat="server">
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
