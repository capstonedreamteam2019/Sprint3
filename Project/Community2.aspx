<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Community2.aspx.cs" Inherits="Community2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .badge-brilliature {
    color: #fff;
    background-color: #11A2AC;
    }

    a.badge-brilliature:hover, a.badge-brilliature:focus {
    color: #fff;
    background-color: #11A2AC;
    }
    a.badge-brilliature:focus, a.badge-brilliature.focus {
    outline: 0;
    box-shadow: 0 0 0 0.2rem rgba(23, 162, 184, 0.5);
}



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

      //Preview popups
        function ShowPreview() {
            $('#mask').show();
            $('#<%=PreviewPopup.ClientID %>').show();
        }
        function HidePreview() {
            $('#mask').hide();
            $('#<%=PreviewPopup.ClientID %>').hide();
        }
         

        //Edit popups
        function ShowEdit() {
            $('#mask').show();
            $('#<%=EditPopup.ClientID %>').show();
        }
        function HideEdit() {
            $('#mask').hide();
            $('#<%=EditPopup.ClientID %>').hide();
        }

        //Delete popups
        function ShowDelete() {
            $('#mask').show();
            $('#<%=DeletePopup.ClientID %>').show();
        }
        function HideDelete() {
            $('#mask').hide();
            $('#<%=DeletePopup.ClientID %>').hide();
        }

        //Reactivate popups
        function ShowRe() {
            $('#mask').show();
            $('#<%=RePopup.ClientID %>').show();
        }
        function HideRe() {
            $('#mask').hide();
            $('#<%=RePopup.ClientID %>').hide();
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    


   
    <section class="space-sm">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-auto order-md-2 mb-4">
                    <div class="row justify-content-center">
                        <div class="col-auto">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item active">
                                        <a class="page-link" href="Community2.aspx"><i class="icon-menu"></i></a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="CommunityEngagement.aspx"><i class="icon-grid"></i></a>
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

                        <div class="dropdown">
                            <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Filter Events By
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-md">
                                <a class="dropdown-item" href="#" runat="server" onserverclick="filterAlphabetically">Alphabetically</a>
                                <a class="dropdown-item" href="#" runat="server" onserverclick="filterByDate">Date</a>
                            </div>
                        </div>

                        <div class="col-auto">
                            <!-- Button HTML (to Trigger Modal) -->
                           <button type="button" class="btn btn-success" runat="server" onserverclick="openCreate"><i class="icon-plus">&nbsp;</i>Create an Event</button>                            
                
                           
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
    <!--end header section-->
    
    
    <!--Gridview-->
     
    <section class="flush-with-above">
        <!--Body section-->
        <div class="container">
                    <h5>Your Events</h5>
            <div class="row">
                <div class="col">
                    <div class="table table-hover align-items-center table-borderless bg-white media align-items-center media-body">
                      <asp:GridView
                                ID="GridView1"
                                EmptyDataText="No records in database."
                                Visible="true"
                                runat="server"
                                GridLines="none"
                                AutoGenerateColumns="False"
                                ForeColor="#343A40"
                                OnRowCommand="GridView1_RowCommand">
                                <HeaderStyle BackColor="#f8f9fa" Font-Bold="True" ForeColor="Black" />
                                <RowStyle CssClass="style" Width="100%" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                                <asp:Label visible="false" ID="lblID" Text='<%#Eval("PostID") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField HeaderText="Event">
                                        <ItemTemplate>
                                            <span class="h6 mb-0">
                                                <asp:Label ID="lblTitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label></span>                                      
                                            <span class="text-muted">Post Date: 
                                           <asp:Label ID="Label1" Text='<%#Eval("PostDate") %>' runat="server"></asp:Label></span>   
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField>
                                        <ItemTemplate>                                           
                                             <span class="badge badge-brilliature">Your Event</span>                                          
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Event Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" Text='<%#Eval("startdate") %>' runat="server"></asp:Label>
                                            <asp:Label ID="Label3" Text='<%#Eval("starttime") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Location">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLocation" Text='<%#Eval("eventaddress") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Career Cluster">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCareerCluster" Text='<%#Eval("CareerCluster") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>         
                                          <div class="dropdown">
                                                <button class="btn btn-sm btn-outline-primary dropdown-toggle dropdown-toggle-no-arrow" type="button" id="dropdownMenuButton-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="icon-dots-three-horizontal"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right" aria-labelledby="dropdown01">
                                                    <asp:Button
                                                        Text="Preview"
                                                        type="Button"
                                                        class="dropdown-item"
                                                        ID="btnPreview"
                                                        runat="server"
                                                        CommandName="Preview"
                                                        CommandArgument='<%# Container.DataItemIndex %>' />
                                                    <asp:Button
                                                        Text="Edit"
                                                        type="Button"
                                                        class="dropdown-item"
                                                        ID="Button1"
                                                        runat="server"
                                                        CommandName="Change"
                                                        CommandArgument='<%# Container.DataItemIndex %>' />
                                                    <div class="dropdown-divider"></div>
                                                    <asp:Button
                                                        Text="Remove"
                                                        type="Button"
                                                        class="dropdown-item"
                                                        ID="Button2"
                                                        runat="server"
                                                        CommandName="Remove"
                                                        CommandArgument='<%# Container.DataItemIndex %>' />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>                    
                    </div>
                    <!--end of col-->
                </div>
                <!--end of row-->
            </div>
            <!--end of container-->
    
           
             <!-- SECOND Gridview-->
          
    
        <!--Body section-->
        <div class="container">
            <h5>Local Events</h5>
            <div class="row">
                <div class="col">
                    <div class="table table-hover align-items-center table-borderless bg-white media align-items-center media-body">
                      <asp:GridView
                                ID="GridView2"
                                EmptyDataText="No records in database."
                                Visible="true"
                                runat="server"
                                GridLines="none"
                                AutoGenerateColumns="False"
                                ForeColor="#343A40"
                                OnRowCommand="GridView2_RowCommand">
                                <HeaderStyle BackColor="#f8f9fa" Font-Bold="True" ForeColor="Black" />
                                <RowStyle CssClass="style" Width="100%" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                                <h1><asp:Label ID="Label2" ForeColor="#f37821" Text='<%#Eval("Opened") %>' runat="server"></asp:Label></h1>
                                                <asp:Label visible="false" ID="lblID" Text='<%#Eval("PostID") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField HeaderText="Event">
                                        <ItemTemplate>
                                            <span class="h6 mb-0">
                                                <asp:Label ID="lblTitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label></span>                                      
                                            <span class="text-muted">Post Date: 
                                           <asp:Label ID="Label1" Text='<%#Eval("PostDate") %>' runat="server"></asp:Label></span>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <span class="badge badge-info">Local Event</span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Event Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" Text='<%#Eval("startdate") %>' runat="server"></asp:Label>
                                            <asp:Label ID="Label3" Text='<%#Eval("starttime") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField HeaderText="Location">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLocation" Text='<%#Eval("eventaddress") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField HeaderText="Career Cluster">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCareerCluster" Text='<%#Eval("CareerCluster") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField>
                                        <ItemTemplate>         
                                          <div class="dropdown">
                                                <button class="btn btn-sm btn-outline-primary dropdown-toggle dropdown-toggle-no-arrow" type="button" id="dropdownMenuButton-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="icon-dots-three-horizontal"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right" aria-labelledby="dropdown01">
                                                    <asp:Button
                                                        Text="Preview"
                                                        type="Button"
                                                        class="dropdown-item"
                                                        ID="btnPreview"
                                                        runat="server"
                                                        CommandName="Preview"
                                                        CommandArgument='<%# Container.DataItemIndex %>' />
                                                    <asp:Button
                                                        Text="Mark as Read"
                                                        type="Button"
                                                        class="dropdown-item"
                                                        ID="Button1"
                                                        runat="server"
                                                        CommandName="Read"
                                                        CommandArgument='<%# Container.DataItemIndex %>' /> 
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>                    
                    </div>
                    <!--end of col-->
                </div>
                <!--end of row-->
            </div>
            <!--end of container-->

        <!--End of Girdview-->
                <div id="accordion">
                    <div class="card">
                        <div class="card-header">
                            <a class="card-link show" data-toggle="collapse" href="#collapseOne">Deleted Posts
                            </a>
                        </div>
                        <div id="collapseOne" class="collapse" data-parent="#accordion">
                            <div class="card-body">

                                <!--Gridview-->
                                <section class="flush-with-above">
                                    <!--Body section-->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                <div class="table table-hover align-items-center table-borderless bg-white media align-items-center media-body">
                                                    <asp:GridView
                                                        ID="GridView3"
                                                        EmptyDataText="No Deleted Posts"
                                                        Visible="true"
                                                        runat="server"
                                                        GridLines="none"
                                                        AutoGenerateColumns="False"
                                                        ForeColor="#343A40"
                                                        OnRowCommand="GridView3_RowCommand">
                                                        <HeaderStyle BackColor="#f8f9fa" Font-Bold="True" ForeColor="Black" />
                                                        <RowStyle CssClass="style" Width="100%" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:Label Visible="false" ID="lblID" Text='<%#Eval("PostID") %>' runat="server"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Event">
                                                                <ItemTemplate>
                                                                    <span class="h6 mb-0">
                                                                        <asp:Label ID="lblTitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label></span>
                                                                    <span class="text-muted">Post Date: 
                                                                    <asp:Label ID="Label1" Text='<%#Eval("PostDate") %>' runat="server"></asp:Label></span>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <span class="badge badge-danger">Deleted</span>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <br />
                                                                    <h1></h1>
                                                                    <br />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Event Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDate" Text='<%#Eval("startdate") %>' runat="server"></asp:Label>
                                                                    <asp:Label ID="Label3" Text='<%#Eval("starttime") %>' runat="server"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <br />
                                                                    <h1></h1>
                                                                    <br />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <br />
                                                                    <h1></h1>
                                                                    <br />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Location">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblLocation" Text='<%#Eval("eventaddress") %>' runat="server"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <br />
                                                                    <h1></h1>
                                                                    <br />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <br />
                                                                    <h1></h1>
                                                                    <br />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Career Cluster">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCareerCluster" Text='<%#Eval("CareerCluster") %>' runat="server"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <br />
                                                                    <h1></h1>
                                                                    <br />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <div class="dropdown">
                                                                        <button class="btn btn-sm btn-outline-primary dropdown-toggle dropdown-toggle-no-arrow" type="button" id="dropdownMenuButton-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                            <i class="icon-dots-three-horizontal"></i>
                                                                        </button>
                                                                        <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right" aria-labelledby="dropdown01">
                                                                            <asp:Button
                                                                                Text="Preview"
                                                                                type="Button"
                                                                                class="dropdown-item"
                                                                                ID="btnPreview"
                                                                                runat="server"
                                                                                CommandName="Preview"
                                                                                CommandArgument='<%# Container.DataItemIndex %>' />
                                                                            <asp:Button
                                                                                Text="Reactivate"
                                                                                type="Button"
                                                                                class="dropdown-item"
                                                                                ID="Button1"
                                                                                runat="server"
                                                                                CommandName="Re"
                                                                                CommandArgument='<%# Container.DataItemIndex %>' />
                                                                        </div>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                            <!--end of col-->
                                        </div>
                                        <!--end of row-->
                                    </div>
                                    <!--end of container-->
                                </section>
                                <!--End of Girdview-->
                            </div>
                        </div>
                    </div>
                </div>
        </div>
   

           

            <!-- Preview Modal HTML -->
           <div id="mask">
                </div>
                <asp:Panel ID="PreviewPopup" runat="server" BackColor="White" Height="650px"
                    Width="700px" Style="z-index: 111; background-color: White; position: absolute; left: 22%; top: 0%; border: outset 2px gray; padding: 5px; display: none">
                    <h1 style="background-color: #11A2AC; color:White; font-weight: bold; font: Helvetica; padding:3px"; align="center">Preview Event</h1>

                          <div class="form-group">
                                <div class="bg-white space-sm">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                <h2><label ID="Label1" runat="server" text=""></label></h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end of section-->
                                <div>
                                    <div class="container">
                                        <div class="row justify-content-between">
                                            <div class="col-12 col-md-8 col-lg-7">
                                                <article>
                                                    <h5>Event Description</h5>
                                                    <label ID="Label11" runat="server" text=""></label>
                                                </article>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end of col-->
                                <div class="card full">
                                    <ul class="list-group list-group-flush full">
                                        <li class="list-group-item full">
                                            <div class="d-flex justify-content-between full">
                                                <div><i class="icon-stopwatch mr-1"></i>Start Time</div>
                                                <label id="Label5" runat="server" text=""></label>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <div><i class="icon-stopwatch mr-1"></i>End Time</div>
                                                <label id="Label6" runat="server"></label>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <div><i class="icon-calendar mr-1"></i>Start Date</div>
                                                <label id="Label7" runat="server"></label>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <div><i class="icon-calendar mr-1"></i>End Date</div>
                                                <label id="Label8" runat="server"></label>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <div><i class="icon-home mr-1"></i>Location</div>
                                                <label id="Label9" runat="server"></label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                    <button type="button" onserverclick="ClosePreview" class="btn btn-success" runat="server">Close</button>
                </asp:Panel>
                <!--End Preview Pannel-->


        <!-- Edit Modal HTML -->
         <div id="mask">
                </div>
                    <asp:Panel ID="EditPopup" runat="server" BackColor="White" Height="750px"
                    Width="700px" Style="z-index: 111; background-color: White; position: absolute; left: 22%; top:0%; border: outset 2px gray; padding: 5px; display: none">
                    <h1 style="background-color: #11A2AC; color:White; font-weight: bold; font: Helvetica; padding:3px"; align="center">Edit Event</h1>
                        <div class="form-group">
                            <div>
                                <div class="container">
                                    <div class="row justify-content-between">
                                        <div class="col-12 col-md-8 col-lg-7">
                                            <article>
                                                <label style="color: red">*</label><label>Event Title</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditTitle">
                                                <label style="color: red">*</label><label>Start Date</label>
                                                <input class="form-control" runat="server" type="date" ID="txtEditStartDate">
                                                <label>End Date</label>
                                                <input class="form-control" runat="server" type="date" ID="txtEditEndDate">
                                                <label style="color: red">*</label><label>Start Time </label>
                                                <input class="form-control" runat="server" type="time" ID="txtEditStartTime">
                                                <label>End Time</label>
                                                <input class="form-control" runat="server" type="time" ID="txtEditEndTime">
                                                <label style="color: red">*</label><label>Event Location</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditLocation">
                                                <label for="eventdescription">Event Description:</label>
                                                <textarea class="form-control" runat="server" id="txtEditDescription" rows="3"></textarea>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                    <asp:Label ID="lblEditError" runat="server" forecolor="Red" Text=""></asp:Label><br />
                    <button type="button" class="btn btn-success" runat="server" validationgroup="group1" onserverclick="SaveEdit_Click">Save Changes</button>
                    <button type="button" onserverclick="CloseEdit" class="btn btn-default" runat="server">Close</button>

        </asp:Panel>
        <!--End edit modal-->

         <!--Delete pannel-->
                <div id="mask">
                </div>
                <asp:Panel ID="DeletePopup" runat="server" BackColor="White" Height="225px"
                    Width="500px" Style="z-index: 111; background-color: White; position: absolute; left: 30%; top: -150px; border: outset 2px gray; padding: 5px; display: none">
                    <h3  style="font: Helvetica;">Are you sure you want to delete this Post?</h3>
                    <br />
                    <h5 style="font: Helvetica;">All applications for this post will also be deleted.</h5>

                    <button type="button" class="btn btn-success" runat="server" onserverclick="DeletePost_Click">Yes, Delete</button>
                    <button type="button" onserverclick="CloseDelete" class="btn btn-default" runat="server">Close</button>
                </asp:Panel>
                <!--End delete pannel-->

         <!--Reactivate pannel-->
                <div id="mask">
                </div>
                <asp:Panel ID="RePopup" runat="server" BackColor="White" Height="250px"
                    Width="500px" Style="z-index: 111; background-color: White; position: absolute; left: 30%; top: -150px; border: outset 2px gray; padding: 5px; display: none">
                    <h3 class="brilliatureFont">Are you sure you want to re-activate this Post?</h3>
                    <br />
                    <h5 class="brilliatureFont">The post will become public for everyone to view and apply to.</h5>

                    <button type="button" class="btn btn-success" runat="server" onserverclick="Reactivate_Click">Yes, Re-Activate</button>
                    <button type="button" onserverclick="CloseRe" class="btn btn-default" runat="server">Close</button>
                </asp:Panel>
                <!--End Reactivate pannel-->

    </section>
    <!--end Body section-->



</asp:Content>
