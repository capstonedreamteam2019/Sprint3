﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration4.aspx.cs" Inherits="Registration4" %>

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

    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-137981458-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-137981458-2');
</script>

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
                    <ul class="nav nav-tabs text-center row justify-content-center">
                      <li class="col-3 col-md-2 nav-item"><a href="Registration.aspx" class="step-circle2 step-circle2-sm active">1</a>
                      </li>
                      <li class="col-3 col-md-2 nav-item"><a href="Registration2.aspx" class="step-circle2 step-circle2-sm active">2</a>
                      </li>
                      <li class="col-3 col-md-2 nav-item"><a href="Registration3.aspx" class="step-circle2 step-circle2-sm active">3</a>
                      </li>
                      <li class="col-3 col-md-2 nav-item"><a href="Registration4.aspx" class="step-circle2 step-circle2-sm active">4</a>
                      </li>
                    </ul>
            
                      <br />
                             <div id="fourth">
                        <div class="row justify-content-around align-items-center">
                          <div class="col-8 col-md-6 col-lg-4 mb-4">
                            <img alt="Image" src="pages/assets/img/Done.svg" class="w-100" />
                          </div>
                          <!--end of col-->
                          <div class="col-12 col-md-6 col-lg-5 mb-4">
                            <div>
                              <h6 class="title-decorative mb-2">Step 4.</h6>
                              <h4 class="mb-2">You're all set</h4>
                  <p>We've set up your account and some basic details, now let's move on to your dashboard.</p>
                            </div>
                            <br>
                    <a href="LandingPage.aspx" class="btn-lg btn-success">Go to Dashboard</a>
                          </div>
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
