<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration2.aspx.cs" Inherits="Registration2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>Employee Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A robust suite of app and landing page templates by Medium Rare">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,400i,500" rel="stylesheet">
    <link href="pages/assets/css/socicon.css" rel="stylesheet" type="text/css" media="all" />
    <link href="pages/assets/css/entypo.css" rel="stylesheet" type="text/css" media="all" />
    <link href="pages/assets/css/theme.css" rel="stylesheet" type="text/css" media="all" />

      <style>
       
        .step-circle2 {
    display: inline-block;
    width: 3rem;
    height: 3rem;
    line-height: 3rem;
    border-radius: 50% !important;
    background: #dee2e6;
    color: #fff;
    text-align: center;
    font-size: 1.75rem;
    transition: background-color .35s ease;
    padding: 0 !important;
    border-bottom: none !important;
}

    .step-circle2.active {
        background: #f37821;
    }

    .step-circle2.step-circle2-sm.active {
        width: 2.25rem;
        height: 2.25rem;
        line-height: 2.25rem;
        font-size: 1rem;
        font-weight: 500;
        background-color: #f37821;
    }
    .step-circle2.step-circle2-sm {
        width: 2.25rem;
        height: 2.25rem;
        line-height: 2.25rem;
        font-size: 1rem;
        font-weight: 500;
        background-color: #dee2e6;
    }
  .step-circle2.step-circle2-lg {
    width: 6rem;
    height: 6rem;
    line-height: 6rem; }

.active .step-circle2 {
    background: #f37821;
}

    </style>
</head>
<body>
    <form runat="server">
    
  <div class="navbar-container">
      <div class="bg-white navbar-light" data-sticky="top">
        <div class="container">
          <nav class="navbar navbar-expand-lg">
            <a class="navbar-brand" href="Website.aspx">
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
                    <ul class="nav nav-tabs text-center row justify-content-center step-anchor">
                      <li class="col-3 col-md-2 nav-item"><a href="Registration.aspx" class="step-circle2 step-circle2-sm active">1</a>
                      </li>
                      <li class="col-3 col-md-2 nav-item"><a href="Registration2.aspx" class="step-circle2 step-circle2-sm active">2</a>
                      </li>
                      <li class="col-3 col-md-2 nav-item"><a href="Registration3.aspx" class="step-circle2 step-circle2-sm">3</a>
                      </li>
                      <li class="col-3 col-md-2 nav-item"><a href="Registration4.aspx" class="step-circle2 step-circle2-sm">4</a>
                      </li>
                    </ul>
                    <br />
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
                              <p>Password</p> <asp:CheckBox id="pwcheckbox" runat="server" AutoPostBack="True" Text="Show password" TextAlign="Right"/>
                              <asp:TextBox ID="txtPassword" class="form-control form-control-lg" placeholder="Password" runat="server" type="password" ></asp:TextBox>                                                   
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="group1" ControlToValidate="txtPassword" runat="server" ErrorMessage="Required" ForeColor="red"></asp:RequiredFieldValidator>                             
                              <p>Confirm Password</p> <asp:CheckBox id="cpwcheckbox" runat="server" AutoPostBack="True" Text="Show password" TextAlign="Right"/> 
                              <asp:TextBox ID="txtPassword2" type="password" class="form-control form-control-lg" placeholder="Confirm Password" runat="server" ></asp:TextBox>   
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="group1" ControlToValidate="txtPassword2" runat="server" ErrorMessage="Required" ForeColor="red"></asp:RequiredFieldValidator>
                              <p>First Name</p>
                              <asp:TextBox ID="txtFirstName" class="form-control form-control-lg" placeholder="FirstName" runat="server"></asp:TextBox>   
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="group1" ControlToValidate="txtFirstName" runat="server" ErrorMessage="Required" ForeColor="red"></asp:RequiredFieldValidator>
                              <p>Last Name</p>
                              <asp:TextBox ID="txtLastName" class="form-control form-control-lg" placeholder="LastName" runat="server"></asp:TextBox>   
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="group1" ControlToValidate="txtLastName" runat="server" ErrorMessage="Required" ForeColor="red"></asp:RequiredFieldValidator>
                              <p>Company Name</p>
                              <asp:TextBox ID="txtCompanyName" CssClass="form-control form-control-lg"  placeholder="Company Name" runat="server" />
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="group1" runat="server" ControlToValidate="txtCompanyName" ErrorMessage="Required" ForeColor="red"></asp:RequiredFieldValidator>                           
                                  <asp:Label ID="lblError" runat="server" forecolor="red" Text=""></asp:Label>
                              </div>
                            </div>
                              <asp:Button ID="Step2"  class="btn btn-success sw-btn-next" validationgroup="group1" runat="server" onclick="Step2_Click" Text="Next Step" />
                          </div>
                          <!--end of col-->
                            </div>
                        <!--end of row-->
                      </div>
  
 
        <!--end of container-->
      </section>
      <!--end of section-->

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
