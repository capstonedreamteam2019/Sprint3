<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CommunityEngagement.aspx.cs" Inherits="CommunityEngagement" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    #mask
        {
            position: fixed;
            left: 0px;
            top: 0px;
            z-index: 4;
            opacity: 0.4;
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=40)"; /* first!*/
            filter: alpha(opacity=40); /* second!*/
            background-color: gray;
            display: none;
            width: 100%;
            height: 100%;
        }
    </style>
    <script src="Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        //Create popups
        function ShowCreate() {
            $('#mask').show();
            $('#<%=CreatePopup.ClientID %>').show();
        }
        function HideCreate() {
            $('#mask').hide();
            $('#<%=CreatePopup.ClientID %>').hide();
        }
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form cssclass="container-fluid" runat="server">  
    <section class="space-sm">
        <div class="container">
          <div class="row justify-content-between">
            <div class="col-auto order-md-2 mb-4">
               <div class="row justify-content-center">
            <div class="col-auto">
              <nav aria-label="Page navigation example">
                <ul class="pagination">
                  <li class="page-item "><a class="page-link" href="Community2.aspx"><i class="icon-menu"></i></a>
                  </li>
                  <li class="page-item active"><a class="page-link" href="CommunityEngagement.aspx"><i class="icon-grid"></i></a>
                  </li>
                </ul>
              </nav>
            </div>
            <!--end of col-->
          </div>
         </div>
            <!--end of col-->           
            <div class="col order-md-1">
              <h2 class="mb-0">Engage with your Community</h2>
              <span>Create and view events in your local community.</span>
              <div class="media align-items-center my-3">
              </div>
            </div>
            <!--end of col-->
          </div>
          <!--end of row-->
        </div>
        <!--end of container-->
      </section>
      <!--end of section-->  
         <div class="container-fluid" style="width:75%">       
          <div class="row justify-content">
            <div class="col-auto">
              <nav aria-label="Page navigation example">                            
                <button type="button" class="btn btn-success" runat="server" onserverclick="openCreate"><i class="icon-plus">&nbsp;</i>Create an Event</button>                                          
             </nav>
            </div>
            <!--end of col-->
          </div>
        </div>
  <section class="flush-with-above">  
    <!--Body section-->
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="table table-hover align-items-center table-borderless bg-white media align-items-center media-body">
          
                <span class="container" aria-hidden="true">
             
                <asp:Calendar ID="Calendar1" runat="server" DayNameFormat="Full" Height="300px" Width="1100px" OnSelectionChanged="Calendar1_SelectionChanged1" OnDayRender="Calendar1_DayRender" TodayDayStyle-BackColor="#FFE2C6">
                    <DayHeaderStyle CssClass="p-1 text-center, p-1 bg-dark text-white"/>
                    <DayStyle CssClass="date col-1, day col-sm p-2 border border-left-0 border-top-0 text-truncate" />
                    <OtherMonthDayStyle ForeColor="#669999" />

                    <TodayDayStyle BackColor="#B7FBF4" BorderStyle="Solid"></TodayDayStyle>
                </asp:Calendar>

                </span>
                    </div>
                    <!--end of col-->
                </div>
                <!--end of row-->
            </div>
      </div>
            <!--end of container-->
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="table table-hover align-items-center table-borderless bg-white media align-items-center media-body">
                      <asp:GridView
                                ID="GridView1"
                                runat="server"
                                GridLines="none"
                                ForeColor="#343A40"
                                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                <HeaderStyle BackColor="#f8f9fa" Font-Bold="True" ForeColor="Black" />
                                <RowStyle CssClass="style" Width="100%" />
                                </asp:GridView> 
                                               
                    </div>
                    <!--end of col-->
                </div>
                <!--end of row-->
            </div>
        </div>
        <!--end of container-->   

        
       <!-- Create Event Modal HTML -->
        <div id="mask">
                </div>
        <asp:Panel ID="CreatePopup" runat="server" BackColor="White" Height="750px"
                    Width="700px" Style="z-index: 111; background-color: White; position: absolute; left: 22%; top: -20%; border: outset 2px gray; padding: 5px; display: none">
            <h1 style="background-color: #11A2AC; color:White; font-weight: bold; font: Helvetica; padding:3px"; align="center">Create an Event</h1>
            <div class="form-group">
                <label style="color: red">*</label><label for="title">Event Title:</label>
                <input type="text" runat="server" class="form-control" id="title" placeholder="ie. Coffee Networking Event">
            </div>
            <div class="form-group">
                <label style="color: red">*</label><label for="startdate">Start Date:</label>
                <input type="Date" runat="server" class="form-control" id="startdate" placeholder="ie. 4/9/2019">
            </div>
            <div class="form-group">
                <label for="enddate">End Date:</label>
                <input type="date" runat="server" class="form-control" id="enddate" placeholder="ie. 4/9/2019">
            </div>
            <div class="form-group">
                <label style="color: red">*</label><label for="starttime">Start Time:</label>
                <input type="time" runat="server" class="form-control" id="starttime" placeholder="ie. 2:00 pm">
            </div>
            <div class="form-group">
                <label for="endtime">End Time:</label>
                <input type="time" runat="server" class="form-control" id="endtime" placeholder="ie. 3:00 pm">
            </div>
            <div class="form-group">
                <label style="color: red">*</label><label for="location">Event Location:</label>
                <input type="text" runat="server" class="form-control" id="location" placeholder="ie. James Madison University">
            </div>
            <div class="form-group">
                <label for="eventdescription">Event Description:</label>
                <textarea class="form-control" runat="server" id="eventdescription" rows="3"></textarea>
            </div>
            <br />
                <asp:Label ID="lblError" runat="server" forecolor="Red" Text=""></asp:Label><br />
              <button type="button" class="btn btn-success" runat="server" validationgroup="group1" onserverclick="SubmitButton_Click">Create Event</button>
              <button type="button" onserverclick="CloseCreate" class="btn btn-default" runat="server">Close</button>

    </asp:Panel>
        <!--end Create Modal-->
   </section>

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

   
      </form>

    </asp:Content>