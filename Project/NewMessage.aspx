<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewMessage.aspx.cs" Inherits="NewMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <form class="card-header d-none d-lg-block" runat="server">
      <section>
        <div class="container">
          <div class="row card flex-row">
            <div class="col-auto">
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
              
              <div class="list-group list-group-chat list-group-flush">
                    <div class="table table-hover align-items-center table-borderless bg-white media align-items-center media-body">
                     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" pagesize="6" GridLines="None" ForeColor="#343A40" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowSelection="ChangeMain_Click" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="387px" DataKeyNames="userID">
                          <HeaderStyle BackColor="#f8f9fa" Font-Bold="True" ForeColor="Black" />
                          <RowStyle CssClass="style"/>
                          <Columns>
                              <asp:CommandField ShowSelectButton="True" />
                              <asp:BoundField ItemStyle-Width="20%" DataField="School:" HeaderText="School:" SortExpression="School:"  />
                              <asp:BoundField ItemStyle-Width="10%" DataField="userID" HeaderText="userID" SortExpression="userID" ReadOnly="True" InsertVisible="False" />
                              <asp:BoundField ItemStyle-Width="10%" DataField="Contact:" HeaderText="Contact:" ReadOnly="True" SortExpression="Contact:" />
                              <asp:BoundField DataField="Time" HeaderText="Time" ReadOnly="True" SortExpression="Time" />
                          </Columns>
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" SelectCommand="select s.schoolname as 'School:', u.userID, concat(substring(u.firstName, 1, 1), '. ', u.lastName) as 'Contact:', max(m.lastupdated) as 'Time' from school s
inner join schoolEmployee se on s.schoolID = se.schoolID
inner join users u on se.userID = u.userID
inner join messages1 m on u.userID = m.messageToID
group by messageToID, schoolname, u.userID, firstname, lastname
order by max(m.lastupdated)"></asp:SqlDataSource>
                    </div>

              </div>
            </div>
            <!--end of col-->
            <div class="col">
              <div class="card-header d-flex justify-content-between align-items-center">
                <div class="media align-items-center">
                  <img alt="Image" src="assets/img/avatar-male-4.jpg" class="avatar avatar-sm" />
                  <div class="media-body">
                    <h6 id="mainViewContactSchool" runat="server" class="mb-0 d-block">Harrisonburg High School
                      <span class="badge badge-indicator badge-success"></span>
                    </h6>
                    <span id="mainViewContactName" runat="server" class="text-muted text-small">Speaking with: Susan Thomas (Counselor)</span>
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

                        <p class="mb-0">
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

                        <p class="mb-0">
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

                        <p class="mb-0">
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

                        <p class="mb-0">
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

                        <p class="mb-0">
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

                        <p class="mb-0">
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

                        <p class="mb-0">
                          Yes, all synced to the drive for you guys &#x1F44D;
                        </p>
                        <div>

                          <small class="opacity-60">1:04pm</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row justify-content-end text-right">
                  <div class="col-auto">
                    <div class="card bg-primary text-white">
                      <div class="card-body p-2">

                        <p class="mb-0">
                          Hey, what's up? Did you manage to get those prototypes together?
                        </p>
                        <div>

                          <small class="opacity-60">1:04pm</small>
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


             <asp:Panel runat="server" ID="chatPanel">
                <div style="vertical-align: middle; min-height: 480px;" class="pre-scrollable">
                    <div>
                        <asp:DataList ID="DataList2" runat="server" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" DataSourceID="SqlDataSource3">
                            <ItemTemplate>
                                    messagebody:
                                    <asp:Label ID="messagebodyLabel" runat="server" Text='<%# Eval("messagebody") %>'></asp:Label>
                                    <br />
                                    <br />
                            </ItemTemplate>
                        </asp:DataList>


                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" SelectCommand="select messagebody from messages1
where messagetoid=16"></asp:SqlDataSource>


                    </div>
                </div>
            </asp:Panel>




                <form class="d-flex align-items-center">
                  <div class="input-group input-group-lg">
                    <div class="input-group-prepend">
                      <button class="btn btn-secondary" type="button">
                        <i class="icon-attachment"></i>
                      </button>
                    </div>
                    <input id="messageBox" runat="server" class="form-control" type="text" placeholder="Type a message" name="message" />
                  </div>
                    
                <button id="SendButton" runat="server" onServerClick="sendBTN_Click" class="btn-lg btn-success">Send</a></button>
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

                        <div class="list-group list-group-chat list-group-flush">
                            <div class="table table-hover align-items-center table-borderless bg-white media align-items-center media-body">
                                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" PageSize="6" GridLines="None" ForeColor="#343A40" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                                    <HeaderStyle BackColor="#f8f9fa" Font-Bold="True" ForeColor="Black" />
                                    <RowStyle CssClass="style" Width="30%" />
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="School:" HeaderText="School:" SortExpression="School:" />
                                        <asp:BoundField DataField="Contact:" HeaderText="Contact:" SortExpression="Contact:" ReadOnly="True" />
                                    </Columns>

                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" SelectCommand="select s.schoolname as 'School:', concat(u.firstName, ' ', u.lastName) as 'Contact:' 
from school s 
inner join schoolemployee se on s.schoolid=se.schoolid
inner join users u on se.userid=u.userid
order by schoolname, lastname asc"></asp:SqlDataSource>
                            </div>

                        </div>
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
    </form>
      <!--end of section-->

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

    </div>

    </asp:Content>
