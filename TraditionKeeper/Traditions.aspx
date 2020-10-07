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
        <div class="container">
            <div class="navbar-header">
                
                    <nav class="navbar fixed-top justify-content-between" style="background-color:#0067C5">
            
                            <ul class="nav nav-pills">
                                <li  class="nav-item nav-link "><a href="Home.aspx" class="text-white"><i class="fa fa-home"></i>Home</a></li>
                                <li  class="nav-item nav-link "><a href="Profile.aspx" class="text-white"><i class="fa fa-user"></i>Profile</a></li>
                                <li  class="nav-item nav-link active"><a href="Traditions.aspx"class="text-white">Traditions</a></li>
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
                                <li><a href="#Paint_Anchor">Paint the Anchor</a></li>
                                <li><a href="#Ligting_I">Lighting of the I</a></li>
                                <li><a href="#BIG">BIG Event</a></li>
                                <li><a href="#">Take a Picture with Izzy</a></li>
                                <li><a href="#">Recieve your Islander Lei at Graduation</a></li>
                                <li><a href="#">Bluesday Tuesday</a></li>
                                <li><a href="#">Donate to a Student Scholarship</a></li>
                                <li><a href="#">Donate to the Senior Class Gift</a></li>
                                <li><a href="#">Join a Club</a></li>
                                <li><a href="#">Catch a Theater Production</a></li>
                                <li><a href="#">Attend an Art Show</a></li>
                                <li><a href="#">Listen to a performance at the PAC</a></li>
                                <li><a href="#">Attend an Islander Athletics Game</a></li>
                                <li><a href="#">Help a Greek</a></li>
                                <li><a href="#">The Deep End</a></li>
                                <li><a href="#">Cat Alley</a></li>
                                <li><a href="#">Enjoy a sunrise on University Beach</a></li>
                                <li><a href="#">Visit the Art Museum of South Texas</a></li>
                                <li><a href="#">Mariachi De La Isla</a></li>
                                <li><a href="#">TAMUCC Hike and Bike Trail</a></li>
                                <li><a href="#">Momentum Statue</a></li>
                                <li><a href="#">Islander Lights</a></li>
                                <li><a href="#">Late Night Breakfast</a></li>
                                <li><a href="#">Homecoming Block Party</a></li>
                                <li><a href="#">ICA's Culture Fest</a></li>
                                <li><a href="#">Welcome Back Splash!</a></li>
                                <li><a href="#">Islander Music Festival</a></li>
                                <li><a href="#Fight_Song">Learn the Fight Song</a></li>
                                <li><a href="#Shakas_Up">Shakas Up! "Whoosh"</a></li>
                                <li><a href="#Ring_Wish">Participate in the Islander Ring Wish</a></li>
                                <li><a href="#Izzy">Izzy the Islander</a></li>
                                <li><a href="#Hector">Touch Hector P.'s Foot</a></li>
                                <li><a href="#Homecoming">Homecoming</a></li>

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
                            <h2><a id="Paint_Anchor"></a>Paint the Anchor White</h2>
                            <p>
                                Paint the Anchor Story
                            </p>

                            <h2><a id="Lighting_I"></a>Lighting of the I</h2>
                            <p>
                                Lighting of the I info
                            </p>

                            <h2><a id="BIG"></a>BIG event</h2>
                            <p>
                                BIG Event info
                            </p>

                            <h2><a id="Fight_Song"></a>Learn the Fight Song</h2>
                            <p>
                                The song starts as
                                Fight for our A&M, A&M CC
                                Highest Honor Brave and Strong
                                Ever True We’ll Be
                                Onward to Victory, Islanders will Prevail
                                We’ll Fight Fight Fight Forever
                                A&M CC
                                <ul class="link-list">
                                    <li><a href="https://www.tamucc.edu/about/spirit.html">Fight Song</a></li>
                                </ul>
                            </p>

                            <h2><a id="Shakas_Up"></a>Shakas up! "Whoosh"</h2>
                            <p>
                                Blank
                            </p>

                            <h2><a id="Ring_Wish"></a>Participate in the Islander Ring Wish</h2>
                            <p>
                                The Ring Wish is a rite of passage and privilege bestowed only upon those who wear the Islander Ring as a symbol of commitment to their education and Texas A&M University-Corpus Christi. Each ring recipient is given a sand dollar at their ring ceremony. Like a penny in a wishing well, this token is then tossed into the fountain at Woo Sung Lee Plaza.
                                A sand dollar was chosen for this tradition with purpose. It is fragile, yet holds strong form. It is designed to survive storms and rough currents. It teaches us to be gentle in our approach to life, regardless of its conditions. It instills an ideology of flexibility in our thoughts, actions and purpose. Yet, it’s sturdy enough to withstand any challenges and obstacles that emerge.

                            </p>

                            <h2><a id="Izzy"></a>Izzy the Islander</h2>
                            <p>
                                Blank
                            </p>

                            <h2><a id="Hector"></a>Touch Hector P.'s Foot</h2>
                            <p>
                                Blank
                            </p>



                            <h2><a id="Homecoming"></a>Homecoming</h2>
                            <p>

                            </p>



                        </section>

                    </div>
                </div>
            </div>
        </section>

                    
        
        
         
               
    </form>
</body>
</html>
