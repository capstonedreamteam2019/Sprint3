<%@ Page Language="C#"  CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Brilliature</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="A robust suite of app and landing page templates by Medium Rare"/>
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,400i,500" rel="stylesheet"/>
    <link href="pages/assets/css/socicon.css" rel="stylesheet" type="text/css" media="all" />
    <link href="pages/assets/css/entypo.css" rel="stylesheet" type="text/css" media="all" />
    <link href="pages/assets/css/theme.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
   
    <form runat="server">
    <div class="navbar-container">
    </div>
    <div class="main-container">
      <section class="fullwidth-split">
        <div class="container-fluid">
          <div class="row no-gutters height-100 justify-content-center">
            <div class="col-12 col-lg-6 fullwidth-split-image bg-dark d-flex justify-content-center align-items-center">
              <img alt="Image" src="pages/assets/img/photo-man-diary.jpg" class="bg-image position-absolute opacity-60" />
              <div class="col-12 col-sm-8 col-lg-9 text-center pt-5 pb-5">
                  <a href="Website.aspx">
                    <img alt="Image" src="pages/assets/img/W_logo.svg" class="mb-4 logo-lg" />
                </a>
                
                <span class="h4 mb-5">Creating a brilliant future for all. </span>

                <div class="card text-left">
                  <div class="card-body">
                    <div class="media">
                      <img alt="Image" src="pages/assets/img/woman1.jpg" class="avatar" />
                      <div class="media-body">
                        <p class="mb-1">
                          “Using Brilliature saved my business by opening up new opportunities.”
                        </p>
                        <small>Regina Falange, CEO</small>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
              <!--end of col-->
            </div>
            <!--end of col-->
            <div class="col-12 col-sm-8 col-lg-6 fullwidth-split-text">
              <div class="col-12 col-lg-8 align-self-center">
                <div class="text-center mb-5">
                  <h1 class="h2 mb-2">Login Here</h1>
                  <span>Let's get connected.</span>
                </div>
                <form class="mb-4">
                  <div class="form-group">
                    <label for="signup-email">Email Address</label>
                    <asp:TextBox class="form-control form-control-lg" ID="txtEmail" placeholder="Email Address" runat="server"></asp:TextBox>
                  </div>
                  <div class="form-group">
                    <label for="signup-password">Password</label>
                    <asp:TextBox class="form-control form-control-lg" type="password" ID="txtPassword" placeholder="Password" runat="server"></asp:TextBox>
                    <small>Password is case sensitive.</small>
                      <br />
                      <!-- Show Password option -->
                      <asp:CheckBox id="pwcheckbox" runat="server"
                    AutoPostBack="True"
                    Text="Show password"
                    TextAlign="Right"/>
                      <br />
                      <asp:Label ID="lblStatus" runat="server" Text='' />
                      
                  </div>
                  
                  <div class="text-center mt-4">
                   <a href="LandingPage.aspx" class="btn btn-lg btn-success btn btn-lg" runat="server" onserverclick="LoginButton_Click">Login</a>
                  </div>
                </form>
                <div class="text-center">
                  <span class="text-small">Don't have an account? <a href="Registration.aspx">Sign up here.</a>
                  </span>
                </div>
              </div>
              <!--end of col-->
            </div>
            <!--end of col-->
          </div>
          <!--end of row-->
        </div>
        <!--end of container-->
      </section>
      <!--end of section-->
    </div>
  </form>

    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/popper.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.smartWizard.min.js"></script>
    <script type="text/javascript" src="assets/js/flickity.pkgd.min.js"></script>
    <script type="text/javascript" src="assets/js/scrollMonitor.js"></script>
    <script type="text/javascript" src="assets/js/smooth-scroll.polyfills.js"></script>
    <script type="text/javascript" src="assets/js/prism.js"></script>
    <script type="text/javascript" src="assets/js/zoom.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="assets/js/theme.js"></script>


</body>
</html>


