<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="TraditionKeeper.History" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>History</title>
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
				                        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-success"/>
                                        <!-- Login Button -->
        	                            <asp:Label ID="lblLogin" runat="server" Text="" ></asp:Label>
			                            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" CssClass="btn btn-success"/>
                            </div>
                    
                    </nav>
                   </div>
                

            </div>

        <!-- History Title -->
        <div id="History_Title" class="container-fluid">
            <header>
                <h2><br /><br /><br /><br />History Timeline of Texas A&M University Corpus Christi</h2>
                <hr />
                
            </header>
        </div>

        <!-- Paragraph of School History -->
        <div id="History_Body" class="container-fluid">
            <p>Prior to becoming a university, Ward Island operated as a military training center throughout World War II, specializing in training highly qualified aviation mechanics.</p>
            <p>The U.S. military would seize operations in 1947 resulting in the opening of the University of Corpus Christi. Upon its opening, UCC serviced 312 students and operated under the Baptist General Convention of Texas.</p>
            <p>Since then, our university has gone through multiple name transitions including Texas A&I University-Corpus Christi and, notably, Corpus Christi State University.</p>
            <p>The A&M University System would adopt Corpus Christi State University in 1994, bringing Texas A&M University-Corpus Christi into its current life.</p>
            <br />
            
            <p>
                <span style ="color:green">1947</span> - Ward Island become UCC
                <br /><br /><span style ="color:green">1970</span> - Hurricane Celia causes $1 million worth of damage to the campus
                <br /><br /><span style ="color:green">1971</span> - Legislature authorizes the Texas A&I University System to establish a state-supported upper-level institution of higher education in Corpus Christi
                <br /><br /><span style ="color:green">1973</span> - Texas A&I University at Corpus Christi opens its doors on Sept. 4, 1973 as an upper-level institution
                <br /><br /><span style ="color:green">1977</span> - The school’s name is changed from University of Corpus Christi to Corpus Christi State University
                <br /><br /><span style ="color:green">1989</span> - Corpus Christi State University joins the Texas A&M University System
                <br /><br /><span style ="color:green">1992</span> - TAMU-CC’s first doctoral degree program becomes authorized by the Texas Higher Education Coordinating Board
                <br /><br /><span style ="color:green">1993</span> - The Texas A&M University System Board of Regents renames the institution Texas A&M University-Corpus Christi, and becomes a four-year comprehensive university which increases enrollment to 5,000 students
                <br /><br /><span style ="color:green">1995</span> - The Legislature of the State of Texas appropriates special funding to have the Art Museum of South Texas affiliated with Texas A&M University-Corpus Christi
                <br /><br /><span style ="color:green">1997</span> - The University revives its intercollegiate athletics program
                <br /><br /><span style ="color:green">2004</span> - The Board of Regents approves the University’s College of Nursing and Health Sciences
                <br /><br /><span style ="color:green">2005</span> - Dr. Flavius Killebrew becomes the University’s President/CEO and initiates a 10-year plan to establish Texas A&M University-Corpus Christi as the flagship university for South Texas known as Momentum 2015
                <br /><br /><span style ="color:green">2007</span> - The City of Corpus Christi donates 156 acres for the expansion of Texas A&M University-Corpus Christi
                <br /><br /><span style ="color:green">2009</span> - The first group of mechanical engineering students begin classes
                <br /><br /><span style ="color:green">2011</span> - Thomas J. Henry Tennis Center is dedicated at the Momentum Campus at Nile Drive and Ennis Joslin Road
                <br /><br /><span style ="color:green">2013</span> - The University celebrates the opening of the Dr. Jack A. Dugan Family Soccer and Track Stadium on the Momentum Campus at Nile Drive
                <br /><br /><span style ="color:green">December 2013</span> - The Federal Aviation Administration names A&M-Corpus Christi one of seven test sites for unmanned aircraft systems (UAS.)
                <br /><br /><span style ="color:green">2014</span> - The University announces Momentum 20/20, a five-year strategic plan that looks forward to 2020
                <br /><br /><span style ="color:green">September 2014</span> - The Islander Dining Hall opens, becoming the eighth dining facility on campus
                <br /><br /><span style ="color:green">January 2015</span> - The Harte Research Institute (HRI) for Gulf of Mexico Studies at Texas A&M University-Corpus Christi was named as a lead organization of the state’s RESTORE Research Centers of Excellence. This center will guide research and restoration efforts in the Gulf of Mexico.
                <br /><br /><span style ="color:green">April 2015</span> - An expanded, remodeled University Center is celebrated during a grand re-opening event
                <br /><br /><span style ="color:green">June 2015</span> - Sand volleyball announced as an intercollegiate athletics program for the spring 2016 season, which allows for a new sand volleyball court to open on Momentum Campus
                <br /><br /><span style ="color:green">August 2015</span> - Momentum Village opens, which houses 482 students
                <br /><br /><span style ="color:green">July 2016</span> - The University holds a groundbreaking ceremony for the second phase of Momentum Village, with the expected opening of 2017
                <br /><br /><span style ="color:green">August 2016</span> - Fall enrollment hits an all-time high of 12,000 students
                <br /><br /><span style ="color:green">September 2016</span> - The University holds a groundbreaking ceremony for the new Life Sciences Research and Engineering Building, named Tidal Hall, which is expected to open summer 2018
                <br /><br /><span style ="color:green">December 2016</span> - Dr Flavius Killebrew retires as President and CEO of Texas A&M University - Corpus Christi
                <br /><br /><span style ="color:green">January 2017</span> - Dr. Kelly M. Miller named Interim President of Texas A&M University - Corpus Christi
                <br /><br /><span style ="color:green">February 2017</span> - Former president of TAMUCC, Dr. Flavius Killebrew, is granted the status of President Emeritus
                <br /><br /><span style ="color:green">August 2017</span> - Dr. Kelly M. Miller named Interim president of Texas A&M University - Corpus Christi
                <br /><br /><span style ="color:green">December 2018</span> - The University is classified as an “R2 Doctoral University - High Research Activity” campus for the first time in history
                <br /><br /><span style ="color:green">April 2019</span> - Tidal Hall Life Science Research Building opens up to the students; the island University establishes a presence in downtown Corpus Christi with new Islander pavilions and courts
                <br /><br /><span style ="color:green">August 2019</span> - NASA’s Unmanned Aircraft Systems Traffic Management (UTM) project teamed up with the Lone Star UAS Center of Excellence & Innovation to test drone traffic management in downtown Corpus Christi
                <br /><br /><span style ="color:green">January 2020</span> - Administrators from the Lone Star UAS Center of Excellence & Innovation signed a memorandum of understanding to develop an airspace management plan and to create a flight operations cell to support aeronautics research at the A&M System’s RELLIS Campus in Bryan, Texas
                <br /><br /><span style ="color:green">January 2020</span> - Texas A&M University-Corpus Christi and the Corpus Christi Regional Transportation Authority unveiled “SURGE,” the only autonomous vehicle in Corpus Christi used for public transportation
            </p>
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
