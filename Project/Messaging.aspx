<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Messaging.aspx.cs" Inherits="Messaging" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <section>
        <div class="container">
          <div class="row card flex-row">
            <div class="col-auto">
               <form class="card-header d-none d-lg-block">
            	<h5> Brilliature Messaging</h5>
                <a href="#myModal2" class="btn btn-success" data-toggle="modal"><i class="icon-plus">&nbsp;</i>New Message</a>
                <br>
                <br>
            	  <input class="form-control form-control-lg" type="search" placeholder="Search..." />
            	 <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="overview-tab" data-toggle="tab" href="#" role="tab" aria-selected="true"><i class="icon-mail">&nbsp;</i>Inbox</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="billing-tab" data-toggle="tab" href="#" role="tab" aria-selected="false"><i class="icon-star">&nbsp;</i>Starred</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="security-tab" data-toggle="tab" href="#" role="tab" aria-selected="false"><i class="icon-trash">&nbsp;</i>Trash</a>
                  </li>
                </ul>
            <!--end nav collapse-->
            	</form>
              <form class="card-header d-none d-lg-block">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="overview-tab" data-toggle="tab" href="#" role="tab" aria-selected="true">All</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="billing-tab" data-toggle="tab" href="#" role="tab" aria-selected="false">School</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="security-tab" data-toggle="tab" href="#" role="tab" aria-selected="false">Teacher</a>
                  </li>
                </ul>
              </form>
              
                <div id="sidebar" class="list-group list-group-chat list-group-flush">

                <a href="#r" id="sidebarHighlight1" runat="server" onserverclick="ChangeBack_OnClick" class="list-group-item list-group-item-action active">
                  <div class="media">
                    <img alt="Image" src="pages/assets/img/avatar-male-4.jpg" class="avatar avatar-sm m-0" />
                    <div class="media-body d-none d-lg-block ml-2">
                      <div class="d-flex justify-content-between align-items-center">
                        <h6 id="sidebarContactName1" runat="server" class="mb-0">Daniel Cameron
                          <span class="badge badge-indicator badge-success"></span>
                        </h6>
                        <div>
                          <small id="sidebarContactTime1" class="text-muted" runat="server">1 hour ago</small>
                        </div>
                      </div>
                      <span id="sidebarContactMessage1" runat="server" class="text-muted text-small col-11 p-0 text-truncate d-block">Let's keep those protoypes 100</span>
                    </div>
                  </div>
                </a>

                <a href="#" id="sidebarHighlight2" class="list-group-item list-group-item-action" runat="server" onserverclick="ChangeMessage_OnClick">
                  <div class="media">
                    <img alt="Image" src="pages/assets/img/avatar-female-3.jpg" class="avatar avatar-sm m-0" />
                    <div class="media-body d-none d-lg-block ml-2">
                      <div class="d-flex justify-content-between align-items-center">

                        <h6 id="sidebarContactName2" runat="server" class="mb-0">Harrisonburg High School</h6>

                        <div>
                          <small class="text-muted">1 hour ago</small>
                        </div>
                      </div>
                      <span class="text-muted text-small col-11 p-0 text-truncate d-block">How should I go about this issue I'm facing</span>
                    </div>
                  </div>
                </a>

                <a href="#" class="list-group-item list-group-item-action">
                  <div class="media">
                    <img alt="Image" src="pages/assets/img/avatar-male-3.jpg" class="avatar avatar-sm m-0" />
                    <div class="media-body d-none d-lg-block ml-2">
                      <div class="d-flex justify-content-between align-items-center">

                        <h6 id="sidebarContactName3" runat="server" class="mb-0">Arlington High School</h6>


                        <div>
                          <small class="text-muted">2 hours ago</small>
                        </div>
                      </div>
                      <span class="text-muted text-small col-11 p-0 text-truncate d-block">Can you send through the logo files?</span>
                    </div>
                  </div>
                </a>

                <a href="#" class="list-group-item list-group-item-action">
                  <div class="media">
                    <img alt="Image" src="pages/assets/img/avatar-male-2.jpg" class="avatar avatar-sm m-0" />
                    <div class="media-body d-none d-lg-block ml-2">
                      <div class="d-flex justify-content-between align-items-center">

                        <h6 id="sidebarContactName4" runat="server" class="mb-0">Newport News High School</h6>

                        <div>
                          <small class="text-muted">7 hours ago</small>
                        </div>
                      </div>
                      <span class="text-muted text-small col-11 p-0 text-truncate d-block">I'm collecting names for the annual event</span>
                    </div>
                  </div>
                </a>
              </div>
            </div>
            <!--end of col-->
            <div class="col">
              <div class="card-header d-flex justify-content-between align-items-center">

                <div class="media align-items-center">
                  <img id="photoChange" runat="server" alt="Image" src="pages/assets/img/avatar-male-4.jpg" class="avatar avatar-sm" />
                  <div class="media-body">
                    <h6 id="mainViewUserName" runat="server" class="mb-0 d-block">Daniel Cameron
                    </h6>
                      <span class="badge badge-indicator badge-success"></span>
                    <span id="mainViewSpeakingWith" runat="server" class="text-muted text-small">last seen today at 2:15 PM</span>
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
  
              
                <label id="noMessagesAlert" runat="server">All messages cleared</label>
              
               <!-- conversation thread-->
              <div id="messageClear" runat="server" class="card-body overflow-auto">

                <div class="row justify-content-start">
                  <div class="col-auto">
                    <div class="card bg-secondary">
                      <div class="card-body p-2">

                        <p id="firstMess" runat="server" class="mb-0">
                          Agreed, their after-sales support is second-to-none.
                        </p>
                        <div>

                          <small class="opacity-60">1:08 PM</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row justify-content-end text-right">
                  <div class="col-auto">
                    <div class="card bg-primary text-white">
                      <div class="card-body p-2">

                        <p id="secondMess" runat="server" class="mb-0">
                          Same! The guys at Medium Rare are also top blokes
                        </p>
                        <div>

                          <small class="opacity-60">1:07 PM</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row justify-content-start">
                  <div class="col-auto">
                    <div class="card bg-secondary">
                      <div class="card-body p-2">

                        <p id="thirdMess" runat="server" class="mb-0">
                          Yeah talk about speedy, it saves me so much time and effort &#x1F44C;
                        </p>
                        <div>

                          <small class="opacity-60">1:06 PM</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row justify-content-end text-right">
                  <div class="col-auto">
                    <div class="card bg-primary text-white">
                      <div class="card-body p-2">

                        <p id="fourthMess" runat="server" class="mb-0">
                          I know, right? We've been using Wingman for all our internal projects for a while now
                        </p>
                        <div>

                          <small class="opacity-60">1:05 PM</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row justify-content-start">
                  <div class="col-auto">
                    <div class="card bg-secondary">
                      <div class="card-body p-2">

                        <p id="fifthMess" runat="server" class="mb-0">
                          Of course, I'm not a fool!
                        </p>
                        <div>

                          <small class="opacity-60">1:05 PM</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row justify-content-end text-right">
                  <div class="col-auto">
                    <div class="card bg-primary text-white">
                      <div class="card-body p-2">

                        <p id="sixthMess" runat="server" class="mb-0">
                          Awesome, did you make it with Wingman?
                        </p>
                        <div>

                          <small class="opacity-60">1:05 PM</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row justify-content-start">
                  <div class="col-auto">
                    <div class="card bg-secondary">
                      <div class="card-body p-2">

                        <p id="seventhMess" runat="server" class="mb-0">
                          Yes, all synced to the drive for you guys &#x1F44D;
                        </p>
                        <div>

                          <small class="opacity-60">1:04 PM</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div id="sendHide" class="row justify-content-end text-right" runat="server">
                  <div class="col-auto">
                    <div class="card bg-primary text-white">
                      <div class="card-body p-2">
                        
                        <!--new message appears in box-->
                        <label id="sendPhrase" class="mb-0" runat="server"></label>
                        <div>

                          <small id="time" class="opacity-60" runat="server"></small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                 <div id="responseHide" class="row justify-content-start" runat="server">
                  <div class="col-auto">
                    <div class="card bg-secondary">
                      <div class="card-body p-2">

                        <label id="sendResponse" class="mb-0" runat="server">
                          Yes, I am still interested.
                        </label>
                        <div>

                          <small id="responseMessageTime" class="opacity-60" runat="server"></small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row mb-4">
                  <div class="col text-center">
                    <span class="badge badge-secondary">Conversation Started: Yesterday</span>
                  </div>
                  <!--end of col-->
                </div>
              </div>
              <div class="card-footer bg-secondary">
                <form class="d-flex align-items-center" runat="server">
                  <div class="input-group input-group-lg">
                    <div class="input-group-prepend">
                      <button class="btn btn-secondary" type="button">
                        <i class="icon-attachment"></i>
                      </button>
                    </div>
                    <input class="form-control" type="text" id="messageBox" name="message" placeholder="Type a message" runat="server" />
                    <button type="button" class="btn btn-success" runat="server" onServerClick="SendButton_OnClick">Send</button>
                  </div>
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
   
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-success">Send</button>
                </div>
            </div>
        </div>
    </div>
      </section>
      <!--end of section-->
     

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

</asp:Content>