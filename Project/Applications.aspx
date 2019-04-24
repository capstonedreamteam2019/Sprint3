<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Applications.aspx.cs" Inherits="Applications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">      
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
        //Preview popups
        function ShowPreview() {
            $('#mask').show();
            $('#<%=PreviewPopup.ClientID %>').show();
        }
        function HidePreview() {
            $('#mask').hide();
            $('#<%=PreviewPopup.ClientID %>').hide();
        }

        //Preview popups
        function ShowResume() {
            $('#mask').show();
            $('#<%=ResumePopup.ClientID %>').show();
        }
        function HideResume() {
            $('#mask').hide();
            $('#<%=ResumePopup.ClientID %>').hide();
        }

        //Hire popups
        function ShowHire() {
            $('#mask').show();
            $('#<%=HirePopup.ClientID %>').show();
        }
        function HideEdit() {
            $('#mask').hide();
            $('#<%=HirePopup.ClientID %>').hide();
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

    <form runat="server">
        <section class="space-sm">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-auto order-md-2 mb-4">
                        <div class="row justify-content-center">
                            <div class="col-auto">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <li class="page-item "><a class="page-link" href="ViewApplications.aspx"><i class="icon-grid"></i></a>
                                        </li>
                                        <li class="page-item active"><a class="page-link" href="Applications.aspx"><i class="icon-menu"></i></a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                            <!--end of col-->
                        </div>
                    </div>
                    <!--end of col-->
                    <div class="col order-md-1">
                        <h2 class="mb-0">View Your Applicants</h2>
                        <span>View applicants completed applications. Filter using the drop down menu.</span>
                        <div class="media align-items-center my-3">
                        </div>
                        <div class="dropdown">
                            <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Filter Applications By
                            <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-md">
                                <a class="dropdown-item" runat="server" onserverclick="LastUpdatedFilter">Most Recent</a>
                                <a class="dropdown-item" runat="server" onserverclick="PositionFilter">Position Applied For</a>
                                <a class="dropdown-item" runat="server" onserverclick="AlphabeticalFilter">Alphabetical by Last Name</a>
                                <a class="dropdown-item" runat="server" onserverclick="BestFitFilter">Best Fit Score</a>
                            </div>
                        </div>
                    </div>
                    <!--end of col-->
                </div>
                <!--end of row-->
            </div>
            <!--end of container-->
        </section>
        <!--end of header section-->

        <!--body section-->
        <section class="flush-with-above">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="table table-hover align-items-center table-borderless bg-white media align-items-center media-body full">
                            <table>
                                <tr>
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
                                <RowStyle Width="100%" CssClass="style"  />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                           <asp:Label ID="lblID" visible="false" Text='<%#Eval("AppID") %>' runat="server"></asp:Label>
                                            <asp:Label  visible="false"  ID="lblUserID" Text='<%#Eval("UserID") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                                                     
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <img alt="Image" src="pages/assets/img/person.png" class="avatar" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <span class="badge badge-info"><asp:Label ID="lblStatus" Text='<%#Eval("Hired") %>' runat="server"></asp:Label></span>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" Text='<%#Eval("FirstName") %>' runat="server"></asp:Label>
                                            <asp:Label ID="lblName2" Text='<%#Eval("LastName") %>' runat="server"></asp:Label>
                                            <br />
                                            <span class="text-muted">Applied For: 
                                            <asp:Label ID="lblTitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label></span>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" Text='<%#Eval("Email") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField HeaderText="Phone Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPhone" Text='<%#Eval("PhoneNumber") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                            <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Best Fit Score">
                                        <ItemTemplate>
                                            <asp:Label ID="lblScore" Text='<%#Eval("Score") %>' runat="server"></asp:Label>
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
                                                <button class="btn btn-sm btn-outline-primary dropdown-toggle dropdown-toggle-no-arrow" type="button" id="btnDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="icon-dots-three-horizontal"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right" aria-labelledby="dropdown01">
                                                    <asp:Button
                                                        Text="Preview Application"
                                                        type="Button"
                                                        class="dropdown-item"
                                                        ID="btnPreview"
                                                        runat="server"
                                                        CommandName="Preview"
                                                        CommandArgument='<%# Container.DataItemIndex %>' />
                                                    <asp:Button
                                                        Text="View Resume"
                                                        type="Button"
                                                        class="dropdown-item"
                                                        ID="Button4"
                                                        runat="server"
                                                        CommandName="Resume"
                                                        CommandArgument='<%# Container.DataItemIndex %>' />
                                                    <asp:Button
                                                        Text="Hire Applicant"
                                                        type="Button"
                                                        class="dropdown-item"
                                                        ID="Button1"
                                                        runat="server"
                                                        CommandName="Hire"
                                                        CommandArgument='<%# Container.DataItemIndex %>' />                 
                                                    <div class="dropdown-divider"></div>
                                                    <asp:Button
                                                        Text="Decline Applicant"
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
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                                    </tr>
                          </table>

                        </div>
                        </div>
                   
                        <!--End of Gridview-->
                   
                    <br />
                    <br />
                    <!--end of col-->
               
                    <div class="col full">
                        <div class="table table-hover align-items-center table-borderless bg-white media align-items-center media-body full">
                            <table>
                                <tr>
                                    <asp:GridView
                                        ID="GridView3"
                                        EmptyDataText="No records in database."
                                        Visible="true"
                                        runat="server"
                                        GridLines="none"
                                        AutoGenerateColumns="False"
                                        ForeColor="#343A40"
                                        OnRowCommand="GridView3_RowCommand">
                                        <HeaderStyle BackColor="#f8f9fa" Font-Bold="True" ForeColor="Black" />
                                        <RowStyle Width="100%" CssClass="style" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Label  visible="false"  ID="lblUserID" Text='<%#Eval("UserID") %>' runat="server"></asp:Label></span>
                                                    <asp:Label  visible="false"  ID="lblID" Text='<%#Eval("AppID") %>' runat="server"></asp:Label></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>                                                
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <img alt="Image" src="pages/assets/img/person.png" class="avatar" />
                                                </ItemTemplate>
                                            </asp:TemplateField>                                            
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <span class="badge badge-success"><asp:Label ID="lblStatus" Text='<%#Eval("Hired") %>' runat="server"></asp:Label></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>                                            
                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" Text='<%#Eval("FirstName") %>' runat="server"></asp:Label>
                                                    <asp:Label ID="lblName2" Text='<%#Eval("LastName") %>' runat="server"></asp:Label>
                                                    <br />
                                                    <span class="text-muted">Applied For: 
                                            <asp:Label ID="lblTitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <br />
                                                    <h1></h1>
                                                    <br />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmail" Text='<%#Eval("Email") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>                                            
                                            <asp:TemplateField HeaderText="Phone Number">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPhone" Text='<%#Eval("PhoneNumber") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField> 
                                             <asp:TemplateField>
                                                <ItemTemplate>
                                                    <br />
                                                    <h1></h1>
                                                    <br />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Best Fit Score">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblScore" Text='<%#Eval("Score") %>' runat="server"></asp:Label>
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
                                                        <button class="btn btn-sm btn-outline-primary dropdown-toggle dropdown-toggle-no-arrow" type="button" id="btnDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <i class="icon-dots-three-horizontal"></i>
                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right" aria-labelledby="dropdown01">
                                                            <asp:Button
                                                                Text="Preview Applicant"
                                                                type="Button"
                                                                class="dropdown-item"
                                                                ID="btnPreview"
                                                                runat="server"
                                                                CommandName="Preview"
                                                                CommandArgument='<%# Container.DataItemIndex %>' />
                                                            <asp:Button
                                                                Text="View Resume"
                                                                type="Button"
                                                                class="dropdown-item"
                                                                ID="Button4"
                                                                runat="server"
                                                                CommandName="Resume"
                                                                CommandArgument='<%# Container.DataItemIndex %>' />
                                                            <a class="dropdown-item" href="Messaging.aspx">Contact Applicant</a>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <br />
                                                    <h1></h1>
                                                    <br />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </tr>
                            </table>
                        </div>
                     
                 

                        <br />
              
                    <div class="col">
                        <div id="accordion">
                            <div class="card">
                                <div class="card-header">
                                    <a class="card-link show" data-toggle="collapse" href="#collapseOne">Declined Applications
                                </a>
                                </div>
                                <div id="collapseOne" class="collapse" data-parent="#accordion">
                                    <div class="card-body">

                                        <!--Gridview2-->
                                        <div class="table table-hover align-items-center table-borderless bg-white media align-items-center media-body">
                                            <asp:GridView
                                                ID="GridView2"
                                                EmptyDataText="No Declined Applications"
                                                Visible="true"
                                                runat="server"
                                                GridLines="none"
                                                AutoGenerateColumns="False"
                                                ForeColor="#343A40"
                                                OnRowCommand="GridView2_RowCommand">
                                                <HeaderStyle Font-Bold="True" ForeColor="Black" />
                                                <RowStyle CssClass="style" Width="100%" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Label  visible="false"  ID="lblUserID" Text='<%#Eval("UserID") %>' runat="server"></asp:Label>
                                                            <asp:Label  visible="false" ID="lblID" Text='<%#Eval("AppID") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>                                                   
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <img alt="Image" src="pages/assets/img/person.png" class="avatar" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <br />
                                                            <h1></h1>
                                                            <br />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status">
                                                        <ItemTemplate>
                                                            <span class="badge badge-danger"><asp:Label ID="lblStatus" Text="Declined" runat="server"></asp:Label></span>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <br />
                                                            <h1></h1>
                                                            <br />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" Text='<%#Eval("FirstName") %>' runat="server"></asp:Label>
                                                            <asp:Label ID="lblName2" Text='<%#Eval("LastName") %>' runat="server"></asp:Label>
                                                            <br />
                                                            <span class="text-muted">Applied For: 
                                            <asp:Label ID="lblTitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label></span>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <br />
                                                            <h1></h1>
                                                            <br />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Email">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEmail" Text='<%#Eval("Email") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <br />
                                                            <h1></h1>
                                                            <br />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Phone Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPhone" Text='<%#Eval("PhoneNumber") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <br />
                                                            <h1></h1>
                                                            <br />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Best Fit Score">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblScore" Text='<%#Eval("Score") %>' runat="server"></asp:Label>
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
                                                        <button class="btn btn-sm btn-outline-primary dropdown-toggle dropdown-toggle-no-arrow" type="button" id="btnDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <i class="icon-dots-three-horizontal"></i>
                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right" aria-labelledby="dropdown01">
                                                            <div class="dropdown">
                                                                <asp:Button
                                                                    Text="Preview Applicant"
                                                                    type="Button"
                                                                    class="dropdown-item"
                                                                    ID="Button3"
                                                                    runat="server"
                                                                    CommandName="Preview"
                                                                    CommandArgument='<%# Container.DataItemIndex %>' />
                                                                <asp:Button
                                                                    Text="View Resume"
                                                                    type="Button"
                                                                    class="dropdown-item"
                                                                    ID="Button4"
                                                                    runat="server"
                                                                    CommandName="Resume"
                                                                    CommandArgument='<%# Container.DataItemIndex %>' />
                                                                <asp:Button
                                                                    Text="Reactivate"
                                                                    type="Button"
                                                                    class="dropdown-item"
                                                                    ID="btnPreview"
                                                                    runat="server"
                                                                    CommandName="Re"
                                                                    CommandArgument='<%# Container.DataItemIndex %>' />
                                                            </div>
                                                            </div>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <!--end of col-->
                                <!--end of col-->
                            </div>
                        </div>
                    </div>
                           </div>
                </div>
                <!--end of row-->
            
</div>
            <!--end of container-->

            <!--Preview Pannel-->
            <div id="mask">
            </div>
            <asp:Panel ID="PreviewPopup" runat="server"  BackColor="White" Height="1050px"
                Width="600px" Style="z-index:111;background-color: White; position: absolute; left: 25%; top: -12%; 
                border: outset 2px gray;padding:5px;display:none">
                    <h1 style="background-color: #11A2AC; color:White; font-weight: bold; font: Helvetica; padding:3px"; align:"center">Student Application</h1>
                    <div class="container">
                                <div class="row justify-content-between">
                                    <div class="col-12 col-md-8 col-lg-7">
                                  
                                            <img alt="Image" src="pages/assets/img/person.png" class="avatar" />
                                            <h5>Name</h5>
                                            <label ID="lblTitle1" runat="server" Text=""></label><br /><br />
                                            <h5>Email</h5>
                                            <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label><br /><br />
                                            <h5>Phone Number</h5>
                                            <asp:Label ID="lblResponsibilities" runat="server" Text=""></asp:Label><br /><br />
                                            <h5>Date Of Birth</h5>
                                            <asp:Label ID="lblQualifications" runat="server" Text=""></asp:Label><br /><br />
                                            <h5>School</h5>
                                            <asp:Label ID="lblDepartment" runat="server" Text=""></asp:Label><br /><br />
                                            <h5>Year</h5>
                                            <asp:Label ID="lblLocation" runat="server" Text=""></asp:Label><br /><br />
                                            <h5>GPA</h5>
                                            <asp:Label ID="lblGPA" runat="server" Text=""></asp:Label><br /><br />
                                            <h5>SAT</h5>
                                            <asp:Label ID="lblSAT" runat="server" Text=""></asp:Label><br /><br />
                                            <h5>Industry Interest</h5>
                                            <asp:Label ID="lblInterest" runat="server" Text=""></asp:Label><br /><br />
                                       
                                    </div>
                                </div>
                            </div>
                            <button type="button" onserverclick="ClosePreview" class="btn btn-success" runat="server">Close</button>              
                </asp:Panel>
            <!--End Preview Pannel-->

            <!-- Delete Pannel -->
            <div id="mask">
            </div>
            <asp:Panel ID="DeletePopup" runat="server"  BackColor="White" Height="200px"
                Width="500px" Style="z-index:111;background-color: White; position: absolute; left: 400px; top: -20px; 
                border: outset 2px gray;padding:5px;display:none">
                        <h3>Are you sure you want to decline this Applicant?</h3>
                        <br />
                        <button type="button" class="btn btn-success" runat="server" onserverclick="DeleteApp_Click">Yes, Decline</button>
                        <button type="button" onserverclick="CloseDelete" class="btn btn-default" runat="server">Close</button>              
             </asp:Panel>
            <!--End delete pannel-->

            <!--Hire pannel-->
             <div id="mask">
            </div>
            <asp:Panel ID="HirePopup" runat="server"  BackColor="White" Height="250px"
                Width="500px" Style="z-index:111;background-color: White; position: absolute; left: 400px; top: -20px; 
                border: outset 2px gray;padding:5px;display:none">
                <h1 style="background-color: #11A2AC; color:White; font-weight: bold; font: Helvetica; padding:3px"; align:"center">Student Resume</h1>

                            <h3>Are you sure you want to hire this applicant?</h3>
                            <br />
                            <h5>The applicant and their school will receive a notification about your interest in them.</h5>   
                            <button type="button" class="btn btn-success" runat="server" onserverclick="Hire_Click">Yes, Hire!</button>
                            <button type="button" onserverclick="CloseHire" class="btn btn-default" runat="server">Close</button>              
             </asp:Panel>
            <!--End Hire pannel-->


            <!--Reactivate pannel-->
            <div id="mask">
            </div>
            <asp:Panel ID="RePopup" runat="server"  BackColor="White" Height="200px"
                Width="500px" Style="z-index:111;background-color: White; position: absolute; left: 400px; top: -20px;
                border: outset 2px gray;padding:5px;display:none">
                        <h3>Are you sure you want to re-activate this Applicant?</h3>
                        <br />
                        <button type="button" class="btn btn-success" runat="server" onserverclick="Reactivate_Click">Yes, Re-Activate</button>
                        <button type="button" onserverclick="CloseRe" class="btn btn-default" runat="server">Close</button>              
             </asp:Panel>
            <!--End Reactivate pannel-->

            <!--Resume pannel-->
            <div id="mask">
            </div>
            <asp:Panel ID="ResumePopup"  runat="server"  BackColor="White" Height="1050px"
                Width="600px" Style="z-index:111;background-color: White; position: absolute; left: 25%; top: -12%; 
                border: outset 2px gray;padding:5px;display:none">
                <%--<asp:Image ID="imgResume" runat="server" />--%>
                <img ID="imgResume" alt="resume" src="pages/assets/img/resume1.jpg" />
                <button type="button" onserverclick="CloseResume" class="btn btn-default" runat="server">Close</button>              
             </asp:Panel>
            <!--End Resume pannel-->

        </section>
        <!--end of section-->
    </form> 
</asp:Content>