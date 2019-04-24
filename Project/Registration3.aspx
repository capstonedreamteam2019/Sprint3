<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration3.aspx.cs" Inherits="Registration3" %>

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
                      <li class="col-3 col-md-2 nav-item active"><a href="Registration.aspx" class="step-circle2 step-circle2-sm active">1</a>
                      </li>
                      <li class="col-3 col-md-2 nav-item active"><a href="Registration2.aspx" class="step-circle2 step-circle2-sm active">2</a>
                      </li>
                      <li class="col-3 col-md-2 nav-item active"><a href="Registration3.aspx" class="step-circle2 step-circle2-sm active">3</a>
                      </li>
                      <li class="col-3 col-md-2 nav-item"><a href="Registration4.aspx" class="step-circle2 step-circle2-sm">4</a>
                      </li>
                    </ul>
                    <div class="tab-content">
                      <div id="first">
                        <div class="row justify-content-around align-items-center">
                            <br />
                          <!--end of col-->
                       
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
                          <br />
                          <br />
                      </ul>
                        <asp:Button ID="btnSelect1"  class="btn btn-success sw-btn-next" validationgroup="group1" runat="server" onclick="btnSelect1_Click" Text="Select" />
                        <br />
                    </div>
                  </div>
                  <!--end card-->
                </div>
                <!--end of col-->
                <div class="col-md-6 col-lg-4">
                  <div class="card pricing card-lg">
                    <div class="card-body">
                      <h5>Pay per <br>Post</h5>
                      <span class="display-3">$299</span>
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
                          <br />
                          <br />                          
                      </ul>
                        <asp:Button ID="btnSelect2"  class="btn btn-success sw-btn-next" validationgroup="group1" runat="server" onclick="btnSelect2_Click" Text="Select" />
                        <br />
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
                      <span class="display-3">$199</span>
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
              
                        <br />
                        <asp:Button ID="btnSelect3"  class="btn btn-success sw-btn-next" validationgroup="group1" runat="server" onclick="btnSelect3_Click" Text="Select" />
                        
                        <asp:Label ID="lblError" runat="server" forecoloe="red" Text=""></asp:Label>
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
