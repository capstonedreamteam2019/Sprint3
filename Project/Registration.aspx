<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!doctype html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <title>Employee Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A robust suite of app and landing page templates by Medium Rare">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,400i,500" rel="stylesheet">
    <link href="pages/assets/css/socicon.css" rel="stylesheet" type="text/css" media="all" />
    <link href="pages/assets/css/entypo.css" rel="stylesheet" type="text/css" media="all" />
    <link href="pages/assets/css/theme.css" rel="stylesheet" type="text/css" media="all" />

  </head>

  <body>
<form runat="server">
    
  <div class="navbar-container">
      <div class="bg-white navbar-light" data-sticky="top">
        <div class="container">
          <nav class="navbar navbar-expand-lg">
            <a class="navbar-brand" href="pages/WebsiteHome.html">
              <img alt="Brilliature" src="pages/assets/img/mini-logo.svg" />
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <i class="icon-menu h4"></i>
            </button>
           
            </div>
            <!--end nav collapse-->
          </nav>
        </div>
        <!--end of container-->
      </div>
    </div>
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-12 col-lg-10">
              <div class="card card-lg">
                <div class="card-body">
                    <ul class="nav nav-tabs text-center row justify-content-center">
                      <li class="col-3 col-md-2"><a href="#first" class="step-circle step-circle-sm">1</a>
                      </li>
                      <li class="col-3 col-md-2"><a href="#second" class="step-circle step-circle-sm">2</a>
                      </li>
                      <li class="col-3 col-md-2"><a href="#third" class="step-circle step-circle-sm">3</a>
                      </li>
                      <li class="col-3 col-md-2"><a href="#fourth" class="step-circle step-circle-sm">4</a>
                      </li>
                    </ul>
                   
                      <div id="first">
                        <div class="row justify-content-around align-items-center">
                          <div class="col-8 col-md-6 col-lg-4 mb-4">
                            <img alt="Image" src="pages/assets/img/ID.svg" class="w-100" />
                          </div>
                          <!--end of col-->
                          <div class="col-12 col-md-6 col-lg-5 mb-4">
                            <div>
                              <h6 class="title-decorative mb-2">Step 1.</h6>
                              <h4 class="mb-2">Choose your identification</h4>                              
    
                              <div class="form-check">
  						<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
 						 <label class="form-check-label" for="exampleRadios1">Student</label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
 							 <label class="form-check-label" for="exampleRadios2">Parent</label>
						</div>
						<div class="form-check disabled">
 						 <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
  							<label class="form-check-label" for="exampleRadios3">Teacher</label>
							</div>
							<div class="form-check disabled">
 						 <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
  							<label class="form-check-label" for="exampleRadios3">School</label>
							</div>
							<div class="form-check disabled">
 						 <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
  							<label class="form-check-label" for="exampleRadios3">Employer</label>
							</div>
                            </div>
                          </div>
                          <!--end of col-->
                        </div>
                        <!--end of row-->
                      </div>
                      <div id="second">
                        <div class="row justify-content-around align-items-center">
                          <div class="col-8 col-md-6 col-lg-4 mb-4">
                            <img alt="Image" src="pages/assets/img/Complete.svg" class="w-100" />
                          </div>
                          <!--end of col-->
                          <div class="col-12 col-md-6 col-lg-5 mb-4">
                            <div>
                              <h6 class="title-decorative mb-2">Step 2.</h6>
                             <h4 class="mb-2">Create your account</h4>
                              <p>Let's begin by creating your account. You can always change these details later.</p>
          					  <div class="form-group">
                              <p>Email</p>
          		              <asp:TextBox ID="txtEmail" runat="server" class="form-control form-control-lg" placeholder="Email Address"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="group1" ControlToValidate="txtEmail" runat="server" ErrorMessage="Required" ForeColor="red"></asp:RequiredFieldValidator>
                              <p>Password</p>
                              <asp:TextBox ID="txtPassword" class="form-control form-control-lg" placeholder="Password" runat="server"></asp:TextBox>                                                   
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="group1" ControlToValidate="txtPassword" runat="server" ErrorMessage="Required" ForeColor="red"></asp:RequiredFieldValidator>                             
                              <p>First Name</p>
                              <asp:TextBox ID="txtFirstName" class="form-control form-control-lg" placeholder="FirstName" runat="server"></asp:TextBox>   
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="group1" ControlToValidate="txtFirstName" runat="server" ErrorMessage="Required" ForeColor="red"></asp:RequiredFieldValidator>
                              <p>Last Name</p>
                              <asp:TextBox ID="txtLastName" class="form-control form-control-lg" placeholder="LastName" runat="server"></asp:TextBox>   
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="group1" ControlToValidate="txtLastName" runat="server" ErrorMessage="Required" ForeColor="red"></asp:RequiredFieldValidator>
                              <p>Company Name</p>
                              <asp:TextBox ID="txtCompanyName" CssClass="form-control form-control-lg"  placeholder="Company Name" runat="server" />
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="group1" runat="server" ControlToValidate="txtCompanyName" ErrorMessage="Required" ForeColor="red"></asp:RequiredFieldValidator>                           
                                  <asp:Label ID="lblError" runat="server" forecoloe="red" Text=""></asp:Label>
                              </div>
                            </div>
                          </div>
                          <!--end of col-->
                        </div>
                        <!--end of row-->
                      </div>
                      
                      
                        <div id="third">
                          <div class="col-12 mb-4">
                            <div>
                              <h6 class="title-decorative mb-2">Step 3.</h6>
                             <h4 class="mb-2">Select your subscription</h4>
                              <p>You can change or upgrade your subscription later under settings.</p>
          					<div class="row">
       <div class="col-md-6 col-lg-4">
                  <div class="card pricing card-lg">
                    <div class="card-body">
                      <h5>Free One Month Trial</h5>
                      <span class="display-3">$0</span>
                      <span class="h6">Includes:</span>
                      <ul class="list-unstyled">
                        <small>
                        <li>
                          Access to all features
                        </li>
                        <li>
                          Fully functional Profile
                        </li>
                        <li>
                          Option to upgrade after one month
                        </li>
                        </small>
                          <br />
                      </ul>
                      <button class="btn btn-success sw-btn-next" type="button">Select</button>
                    </div>
                  </div>
                  <!--end card-->
                </div>
                <!--end of col-->
                <div class="col-md-6 col-lg-4">
                  <div class="card pricing card-lg">
                    <div class="card-body">
                      <h5>Pay per <br>Post</h5>
                      <span class="display-3">$3</span>
                      <span class="h6">Includes:</span>
                      <ul class="list-unstyled">
                        <small>
                        <li>
                          Limited access to features
                        </li>
                        <li>
                          Create events and connect                       
                        </li>
                        <li>
                          Option to upgrade at any <br>time
                        </li>
                        </small>
                      </ul>
                      <button class="btn btn-success sw-btn-next" type="button">Select</button>
                    </div>
                  </div>
                  <!--end card-->
                </div>
                <!--end of col-->
                <div class="col-md-6 col-lg-4">
                  <div class="card pricing card-lg">
                    <div class="card-body">
                      <h5>Monthly Subscription</h5>
                        <br />
                      <span class="display-3">$50</span>
                      <span class="h6">Includes:</span>
                      <ul class="list-unstyled">
                        <small>
                        <li>
                          All unlimited access to all features
                        </li>
                        <li>
                          Customizable profile
                        </li>
                        <li>
                          Option to downgrade plan at any time
                        </li>
                        </small>
                      </ul>
                      <button class="btn btn-success sw-btn-next" type="button">Select</button>
                    </div>
                  </div>
                  <!--end card-->
                    </div>
	
                            </div>
                          </div>
                          <!--end of col-->
                        </div>
                        <!--end of row-->
                      </div>
                      <asp:Button ID="btnSubmit"  class="btn btn-success" validationgroup="group1" runat="server" onclick="btnSubmit_Click" Text="Submit" />
                
              
                      
        </div>
        <!--end of container-->
      </section>
      <!--end of section-->
    </div>
</form>

    <script type="text/javascript" src="pages/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="pages/assets/js/popper.min.js"></script>
    <script type="text/javascript" src="pages/assets/js/jquery.smartWizard.min.js"></script>
    <script type="text/javascript" src="pages/assets/js/flickity.pkgd.min.js"></script>
    <script type="text/javascript" src="pages/assets/js/scrollMonitor.js"></script>
    <script type="text/javascript" src="pages/assets/js/smooth-scroll.polyfills.js"></script>
    <script type="text/javascript" src="pages/assets/js/prism.js"></script>
    <script type="text/javascript" src="pages/assets/js/zoom.min.js"></script>
    <script type="text/javascript" src="pages/assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="pages/assets/js/theme.js"></script>

       <!--End Template-->



   
  </body>

</html>