<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Messaging.aspx.cs" Inherits="Messaging" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
        <div runat="server" class="container">
          <div class="row card flex-row">
            <div class="col-auto">
              <form class="card-header d-none d-lg-block">
            	<h5> Brilliature Messaging</h5>
            <a href="#myModal2" class="btn btn-success" data-toggle="modal"><i class="icon-plus">&nbsp;</i>New Message</a>
            <br>
            <br>
            	  <input class="form-control form-control-lg" type="search" placeholder="Search..." />
            	 <ul class="nav nav-tabs"  role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active"  data-toggle="tab" href="#" role="tab" aria-selected="true"><i class="icon-mail">&nbsp;</i>Inbox</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link"  data-toggle="tab" href="#" role="tab" aria-selected="false"><i class="icon-star">&nbsp;</i>Starred</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link"  data-toggle="tab" href="#" role="tab" aria-selected="false"><i class="icon-trash">&nbsp;</i>Trash</a>
                  </li>
                </ul>
            <!--end nav collapse-->
            	</form>
            	 <form runat="server" class="card-header d-none d-lg-block">
            	  <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="overview-tab" data-toggle="tab" href="#" role="tab" aria-selected="true">All</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" id="OrganizeSchool" name="OrganizeSchool" aria-selected="false" runat="server" onserverclick="OrganizeSchool_OnClick">School</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="security-tab" data-toggle="tab" href="#" role="tab" aria-selected="false">Teacher</a>
                  </li>
                </ul>
            	 </form>
              
              <div class="list-group list-group-chat list-group-flush">
                <a id="sidebarHighlight1" runat="server" href="#" class="list-group-item list-group-item-action active">
                  <div class="media">
                    <img alt="Image" src="pages/assets/img/avatar-male-4.jpg" class="avatar avatar-sm m-0" />
                    <div class="media-body d-none d-lg-block ml-2">
                      <div class="d-flex justify-content-between align-items-center">
                        <h6 id="sidebarContactName1" runat="server" class="mb-0">Daniel Cameron
                          <span class="badge badge-indicator badge-success"></span>
                        </h6>
                        <div>
                          <small id="sidebarContactTime1" runat="server" class="text-muted">1 hour ago</small>
                        </div>
                      </div>
                      <span id="sidebarContactMessage1" runat="server" class="text-muted text-small col-11 p-0 text-truncate d-block">Let's keep those protoypes 100</span>
                    </div>
                  </div>
                </a>

                <a id="sidebarHighlight2" runat="server" href="#" class="list-group-item list-group-item-action">
                  <div class="media">
                    <img alt="Image" src="pages/assets/img/avatar-female-3.jpg" class="avatar avatar-sm m-0" />
                    <div class="media-body d-none d-lg-block ml-2">
                      <div class="d-flex justify-content-between align-items-center">
                        <h6 id="sidebarContactName2" runat="server" class="mb-0">Mercy Ketteridge</h6>
                        <div>
                          <small id="sidebarContactTime2" runat="server" class="text-muted">1 hour ago</small>
                        </div>
                      </div>
                      <span id="sidebarContactMessage2" runat="server" class="text-muted text-small col-11 p-0 text-truncate d-block">How should I go about this issue I'm facing</span>
                    </div>
                  </div>
                </a>

                <a id="sidebarHighlight3" runat="server" href="#" class="list-group-item list-group-item-action">
                  <div class="media">
                    <img alt="Image" src="pages/assets/img/avatar-male-3.jpg" class="avatar avatar-sm m-0" />
                    <div class="media-body d-none d-lg-block ml-2">
                      <div class="d-flex justify-content-between align-items-center">
                        <h6 id="sidebarContactName3" runat="server" class="mb-0">Sven Lansson</h6>
                        <div>
                          <small id="sidebarContactTime3" runat="server" class="text-muted">2 hours ago</small>
                        </div>
                      </div>
                      <span id="sidebarContactMessage3" runat="server" class="text-muted text-small col-11 p-0 text-truncate d-block">Can you send through the logo files?</span>
                    </div>
                  </div>
                </a>

                <a id="sidebarHighlight4" runat="server" href="#" class="list-group-item list-group-item-action">
                  <div class="media">
                    <img alt="Image" src="pages/assets/img/avatar-male-2.jpg" class="avatar avatar-sm m-0" />
                    <div class="media-body d-none d-lg-block ml-2">
                      <div class="d-flex justify-content-between align-items-center">
                        <h6 id="sidebarContactName4" runat="server" class="mb-0">Bart Van Wissen</h6>
                        <div>
                          <small id="sidebarContactTime4" runat="server" class="text-muted">7 hours ago</small>
                        </div>
                      </div>
                      <span id="sidebarContactMessage4" runat="server" class="text-muted text-small col-11 p-0 text-truncate d-block">I'm collecting names for the annual event</span>
                    </div>
                  </div>
                </a>

              </div>
            </div>
            <!--end of col-->
            <div id="mainMessagePanel" runat="server" class="col">
              <div class="card-header d-flex justify-content-between align-items-center">
                <div class="media align-items-center">
                  <img id="userPhoto" runat="server" alt="Image" src="assets/img/avatar-male-4.jpg" class="avatar avatar-sm" />
                  <div class="media-body">
                    <h6 id="mainViewUserSchool" runat="server" class="mb-0 d-block">Harrisonburg High School
                      <span class="badge badge-indicator badge-success"></span>
                    </h6>
                    <span id="mainViewUserName" runat="server" class="text-muted text-small">Speaking with: Susan Thomas (Counselor)</span>
                  </div>
                </div>

                <div>    
                <button class="btn btn-outline-secondary" type="button" id="Button" aria-haspopup="true" aria-expanded="false">
                    <i class="icon-star"></i>
                  </button>
                  <button class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-no-arrow" type="button" id="Button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="icon-chevron-down"></i>
                  </button>
                  <div class="dropdown-menu dropdown-menu-right dropdown-menu-sm" aria-labelledby="Button">
                    <a class="dropdown-item" href="#">View Profile</a>
                    <a class="dropdown-item" href="#">Mark as Unread</a>
                    <a class="dropdown-item" href="#">Mute</a>
                    <a class="dropdown-item" href="#">Active Status</a>
                	<a class="dropdown-item" href="#">Notifications</a>
                   <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Delete chat</a>
                  </div>
                  
                </div>
              </div>
              <!--end card header-->
              <div class="card-body overflow-auto">

                <div class="row justify-content-start">
                  <div class="col-auto">
                    <div class="card bg-secondary">
                      <div class="card-body p-2">

                        <p id="mainMessage1" runat="server" class="mb-0">
                          Agreed, their after-sales support is second-to-none.
                        </p>
                        <div>

                          <small class="opacity-60">1:08pm</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row justify-content-end text-right">
                  <div class="col-auto">
                    <div class="card bg-primary text-white">
                      <div class="card-body p-2">

                        <p id="mainMessage2" runat="server" class="mb-0">
                          Same! The guys at Medium Rare are also top blokes
                        </p>
                        <div>

                          <small class="opacity-60">1:07pm</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row justify-content-start">
                  <div class="col-auto">
                    <div class="card bg-secondary">
                      <div class="card-body p-2">

                        <p id="mainMessage3" runat="server" class="mb-0">
                          Yeah talk about speedy, it saves me so much time and effort &#x1F44C;
                        </p>
                        <div>

                          <small class="opacity-60">1:06pm</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row justify-content-end text-right">
                  <div class="col-auto">
                    <div class="card bg-primary text-white">
                      <div class="card-body p-2">

                        <p id="mainMessage4" runat="server" class="mb-0">
                          I know, right? We've been using Wingman for all our internal projects for a while now
                        </p>
                        <div>

                          <small class="opacity-60">1:05pm</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row justify-content-start">
                  <div class="col-auto">
                    <div class="card bg-secondary">
                      <div class="card-body p-2">

                        <p id="mainMessage5" runat="server" class="mb-0">
                          Of course, I'm not a fool!
                        </p>
                        <div>

                          <small class="opacity-60">1:05pm</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row justify-content-end text-right">
                  <div class="col-auto">
                    <div class="card bg-primary text-white">
                      <div class="card-body p-2">

                        <p id="mainMessage6" runat="server" class="mb-0">
                          Awesome, did you make it with Wingman?
                        </p>
                        <div>

                          <small class="opacity-60">1:05pm</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row justify-content-start">
                  <div class="col-auto">
                    <div class="card bg-secondary">
                      <div class="card-body p-2">

                        <p id="mainMessage7" runat="server" class="mb-0">
                          Yes, all synced to the drive for you guys &#x1F44D;
                        </p>
                        <div>

                          <small class="opacity-60">1:04pm</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div id="newSentMessage" runat="server" class="row justify-content-end text-right">
                  <div class="col-auto">
                    <div class="card bg-primary text-white">
                      <div class="card-body p-2">

                        <p id="sendPhrase" runat="server" class="mb-0">
                          Hey, what's up? Did you manage to get those prototypes together?
                        </p>
                        <div>

                          <small id="sendTime" runat="server" class="opacity-60">1:04pm</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div id="autoReceiveMessage" runat="server" class="row justify-content-end text-right">
                  <div class="col-auto">
                    <div class="card bg-primary text-white">
                      <div class="card-body p-2">

                        <p id="autoGeneratedMessage" runat="server" class="mb-0">
                          Yes, I am still interested.
                        </p>
                        <div>

                          <small id="autoGeneratedMessageTime" runat="server" class="opacity-60">1:04pm</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <label id="noMessagesAlert" runat="server">No current messages</label>

                <div class="row mb-4">
                  <div class="col text-center">
                    <span class="badge badge-secondary">Conversation Started: Yesterday</span>
                  </div>
                  <!--end of col-->
                </div>
              </div>
              <div class="card-footer bg-secondary">
                <form class="d-flex align-items-center">
                  <div class="input-group input-group-lg">
                    <div class="input-group-prepend">
                      <button class="btn btn-secondary" type="button">
                        <i class="icon-attachment"></i>
                      </button>
                    </div>
                    <input id="messageBox" runat="server" class="form-control" type="text" placeholder="Type a message" name="message" />
                  </div>
                    
                <button class="btn-lg btn-success">Send</a></button>
                  <button class="btn btn-link pr-0">
                    <span class="h3">&#x1F600;</span>
                  </button>
                </form>
              </div>
              
              
            </div>
            <!--end of col-->
          </div>
          <!--end of row-->
        </div>

        <!--end of container-->
        
         <!-- Modal HTML -->
    <div id="myModal2" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">New Message:</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                	  <input class="form-control form-control-lg" type="search" placeholder="To:" />
                	 <input class="form-control form-control-lg" type="search" placeholder="Subject" />

    <label for="exampleFormControlTextarea1"></label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="4"></textarea>
  </div>
   
                <div class="modal-footer" runat="server">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-success" id="SendButton" runat="server" onServerclick="SendButton_OnClick">Send</button>
                </div>
            </div>
        </div>
    </div>
      <!--end of section-->
      
       <footer class="bg-gray text-light footer-long">
        <div class="container">
          <div class="row">
            <div class="col-3 col-md-3">
              <a href="landing-4.html">
              <img alt="Image" src="assets/img/W_logo.svg"/>
              </a>
              <br>
              <br>
              <p>
                &copy; 2019 Brilliature
              </p>
       <a href="https://cued-in.com/" target="_blank" class="footer">powered by Cued-In <img alt="Brilliature" src="assets/img/cuedin.svg" /></a>

            </div>
            <!--end of col-->
            <div class="col-12 col-md-9">
              <div class="row no-gutters">
                <div class="col-6 col-lg-3">
                  <h6>Brilliature</h6>
                  <ul class="list-unstyled">
                    <li>
                      <a href="landing-4.html">About Us</a>
                    </li>
                    <li>
                      <a href="landing-4.html">How it Works</a>
                    </li>
                    <li>
                      <a href="landing-4.html">Subscriptions</a>
                    </li>
                    <li>
                      <a href="landing-4.html">FAQ's</a>
                    </li>
                    <li>
                      <a href="landing-4.html">Contact US</a>
                    </li>
                  </ul>
                </div>
                <!--end of col-->
                <div class="col-6 col-lg-3">
                  <h6>Dashboard</h6>
                  <ul class="list-unstyled">
                    <li>
                      <a href="landing-5.html">Manage Job Opportunities</a>
                    </li>
                    <li>
                      <a href="blog-grid.html">View Applications</a>
                    </li>
                    <li>
                      <a href="app-collection-list.html">Post a Scholarship</a>
                    </li>
                    <li>
                      <a href="landing-5.html">Community Engagement</a>
                    </li>
                    <li>
                      <a href="landing-5.html">Insights</a>
                    </li>
                  </ul>
                </div>
                <!--end of col-->
                <div class="col-6 col-lg-3">
                  <h6>User Preferences</h6>
                  <ul class="list-unstyled">
                    <li>
                      <a href="#">My Profile</a>
                    </li>
                    <li>
                      <a href="#">Payment Methods</a>
                    </li>
                    <li>
                      <a href="#">Log Out</a>
                    </li>
                  </ul>
                </div>
                <!--end of col-->
              </div>
              <!--end of row-->
            </div>
            <!--end of col-->
          </div>
          <!--end of row-->
        </div>
        <!--end of container-->
      </footer>
    </div>

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

</asp:Content>
