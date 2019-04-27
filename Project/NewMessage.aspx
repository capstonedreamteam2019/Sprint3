<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewMessage.aspx.cs" Inherits="NewMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


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
                </ul>
            <!--end nav collapse-->
              
              <div class="list-group list-group-chat list-group-flush">
                    <div class="table table-hover align-items-center table-borderless bg-white media align-items-center media-body">
                     <asp:GridView ID="GridView1" runat="server" ShowHeader="false" AllowPaging="True" pagesize="6" GridLines="None" ForeColor="#343A40" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowSelection="ChangeMain_Click" AllowSorting="True" AutoGenerateColumns="False" Width="387px" DataKeyNames="userID">
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
                     <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStrings:localDB %>" SelectCommand="select s.schoolname as 'School:', u.userID, concat(substring(u.firstName, 1, 1), '. ', u.lastName) as 'Contact:', max(m.lastupdated) as 'Time' from school s
inner join schoolEmployee se on s.schoolID = se.schoolID
inner join users u on se.userID = u.userID
inner join messages1 m on u.userID = m.messageToID
group by messageToID, schoolname, u.userID, firstname, lastname
order by max(m.lastupdated)"></asp:SqlDataSource>--%>
                    </div>

              </div>
            </div>
            <!--end of col-->
            <div class="col">
              <div class="card-header d-flex justify-content-between align-items-center">
                <div class="media align-items-center">
                  <%--<img alt="Image" src="assets/img/avatar-male-4.jpg" class="avatar avatar-sm" />--%>
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
                    <a onServerClick="changeNotificiation_Click" runat="server" class="dropdown-item" href="#">Mark as Read</a>
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

                <asp:GridView ID="GridView3" runat="server" Width="100%" ShowHeader="false" CssClass="card-body overflow-auto" AutoGenerateColumns="False" OnRowDataBound="GridView3_RowDataBound">
                      <Columns>
                          <asp:BoundField DataField="messageToID" HeaderText="messageToID" SortExpression="messageToID" />
                          <asp:BoundField DataField="messageFromID" HeaderText="messageFromID" SortExpression="messageFromID" />
                          <asp:BoundField DataField="messagebody" HeaderText="messagebody" SortExpression="messagebody" />
                      </Columns>
                  </asp:GridView>
              </div>





                <form class="d-flex align-items-center">
                  <div class="input-group input-group-lg">
                       <br />
                    <input id="messageBox" runat="server" class="form-control" type="text" placeholder="Type a message" name="message" />
                 
                
                <button id="SendButton" runat="server" onServerClick="sendBTN_Click" class="btn-lg btn-success">Send</a></button>
                  <button id="Emoji" runat="server" onServerClick="RecBTN_Click" class="btn btn-link pr-0">
                    <span class="h3">&#x1F600;</span>
                  </button>
                </div>
                </form>
              </div>





              
              
            </div>
            <!--end of col-->
          </div>
          <!--end of row-->
        </div>

        <!--end of container-->
        
     

      </section>

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
