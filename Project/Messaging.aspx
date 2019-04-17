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
<!--               <a href="#r" id="sidebarHighlight1" runat="server" onserverclick="ChangeBack_OnClick" class="list-group-item list-group-item-action active">
                  <div class="media">
                    <img alt="Image" src="pages/assets/img/avatar-male-4.jpg" class="avatar avatar-sm m-0" />
                    <div class="media-body d-none d-lg-block ml-2">
                      <div class="d-flex justify-content-between align-items-center">
                        <h6 id="sidebarContactName1" class="mb-0">Daniel Cameron
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
                        <h6 class="mb-0">Mercy Ketteridge</h6>
                        <div>
                          <small class="text-muted">1 hour ago</small>
                        </div>
                      </div>
                      <span class="text-muted text-small col-11 p-0 text-truncate d-block">How should I go about this issue I'm facing</span>
                    </div>
                  </div>
                </a>

                <a href="#" id="sidebarHighlight3" runat="server" class="list-group-item list-group-item-action">
                  <div class="media">
                    <img alt="Image" src="pages/assets/img/avatar-male-3.jpg" class="avatar avatar-sm m-0" />
                    <div class="media-body d-none d-lg-block ml-2">
                      <div class="d-flex justify-content-between align-items-center">
                        <h6 class="mb-0">Sven Lansson</h6>
                        <div>
                          <small class="text-muted">2 hours ago</small>
                        </div>
                      </div>
                      <span class="text-muted text-small col-11 p-0 text-truncate d-block">Can you send through the logo files?</span>
                    </div>
                  </div>
                </a>

                <a href="#" id="sidebarHighlight4" runat="server" class="list-group-item list-group-item-action">
                  <div class="media">
                    <img alt="Image" src="pages/assets/img/avatar-male-2.jpg" class="avatar avatar-sm m-0" />
                    <div class="media-body d-none d-lg-block ml-2">
                      <div class="d-flex justify-content-between align-items-center">
                        <h6 class="mb-0">Bart Van Wissen</h6>
                        <div>
                          <small class="text-muted">7 hours ago</small>
                        </div>
                      </div>
                      <span class="text-muted text-small col-11 p-0 text-truncate d-block">I'm collecting names for the annual event</span>
                    </div>
                  </div>
                </a>-->


                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="Converations_Label" runat="server" Text='<%# Eval("[Converations:]") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:TextBox ID="Converations_TextBox" runat="server" Text='<%# Bind("[Converations:]") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton2" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>
                                    <asp:TextBox ID="Converations_TextBox2" runat="server" Text='<%# Bind("[Converations:]") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="Converations_Label2" runat="server" Text='<%# Eval("[Converations:]") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Converations:</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="Converations_Label3" runat="server" Text='<%# Eval("[Converations:]") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" SelectCommand="select schoolname as 'Converations:' from school s inner join schoolemployee se on s.schoolid = se.schoolid inner join users u on se.userid = u.userid inner join messages m on se.userid = m.messagetoid
group by schoolname"></asp:SqlDataSource>

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
                  <button class="btn btn-outline-secondary" type="button" id="starMessage" aria-haspopup="true" aria-expanded="false">
                    <i class="icon-star"></i>
                  </button>
                  <button class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-no-arrow" type="button" id="Button" name="Button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="icon-chevron-down"></i>
                  </button>
                  <div class="dropdown-menu dropdown-menu-right dropdown-menu-sm" aria-labelledby="Button">
                    <a class="dropdown-item" href="#contactModal" id="contactInfo" data-toggle="modal" runat="server">View Profile</a>
                    <a class="dropdown-item" href="#">Mark as Unread</a>
                    <a class="dropdown-item" href="#">Mute</a>
                   <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" id="clearMessages" runat="server" onserverclick="ClearMessages_OnClick">Clear messages</a>
                    <a class="dropdown-item" href="#" id="deleteMessages" runat="server" onserverclick="DeleteMessages_OnClick">Delete chat</a>
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


         <!-- Modal HTML -->
    <div id="contactModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Contact Information</h4>
                </div>
                <div class="modal-body">
  <div class="form-group">
    <label for="title">Daniel Cameron</label>
  </div>

  <div class="form-group">
    <label for="descr">Email: danielCameron@gmail.com</label>
  </div>
                
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
      
     
<!--end Create Modal-->

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