<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageScholarships.aspx.cs" Inherits="ManageScholarships" %>

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

    <form runat="server">
        <div class="main-container">
            <section>
                <div class="container">
                    <div class="col order-md-1">
                        <h2 class="mb-0">Post a Scholarship</h2>
                        <span>Edit and manage your scholarship posts on this page.</span>
                        <div class="media align-items-center my-3">
                            <div class="row">
                                <div class="col-auto">

                                    <!-- Button HTML (to Trigger Modal) -->
                                    <button type="button" class="btn btn-success" runat="server" onserverclick="openCreate"><i class="icon-plus">&nbsp;</i>Create a Scholarship</button>
                                    <br>
                                    <br>
                                    <nav class="nav flex-md-column">
                                        <a href="#" class="nav-link active">All</a>
                                        <a href="#" class="nav-link">Most Recent</a>
                                        <a href="#" class="nav-link">Alphabetical</a>
                                        <a href="#" class="nav-link">Active</a>
                                        <a href="#" class="nav-link">Expired</a>
                                    </nav>
                                </div>
                                <!--end of col-->
                                <div class="col">
                                    <div class="card card-sm">
                                        <div class="card-header d-flex bg-secondary justify-content-between align-items-center">
                                            <div>
                                                <h5>Posted Scholarships</h5>
                                            </div>
                                        </div>

                                        <!--Gridview-->
                                        <section class="flush-with-above">
                                            <!--Body section-->
                                            <div class="container">
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
                                                                <RowStyle CssClass="style" Width="100%" />
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:Label Visible="false" ID="lblID" Text='<%#Eval("PostID") %>' runat="server"></asp:Label>
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
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <a href="#" class="mr-4">
                                                                                <img alt="Image" src="pages/assets/img/ScholarshioLogo.png" class="rounded avatar avatar-lg" />
                                                                            </a>
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
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <span class="mb-1">
                                                                                <asp:Label ID="lblTitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label></span><br />
                                                                            <asp:Label ID="lblRequirements" Text='<%#Eval("Requirements") %>' runat="server"></asp:Label><br />
                                                                            <asp:Label ID="lblLocation" Text='<%#Eval("Reward") %>' runat="server"></asp:Label><br />
                                                                            <a class="badge badge-success badge-pill mb-2" href="#">Active</a><br />
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
                                                                            <p>Career Cluster:</p>
                                                                            <asp:Label ID="lblCluster" Text='<%#Eval("CareerCluster") %>' runat="server"></asp:Label></span><br />
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
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                        <!--End of Gridview-->

                                        <div id="accordion">
                                            <div class="card">
                                                <div class="card-header">
                                                    <a class="card-link show" data-toggle="collapse" href="#collapseOne">Deleted Posts</a>
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
                                                                                ID="GridView2"
                                                                                EmptyDataText="No Deleted Posts"
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
                                                                                            <br />
                                                                                            <h1></h1>
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                     <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:Label Visible="false" ID="lblID" Text='<%#Eval("PostID") %>' runat="server"></asp:Label>
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
                                                                                            <a href="#" class="mr-4">
                                                                                                <img alt="Image" src="pages/assets/img/ScholarshioLogo.png" class="rounded avatar avatar-lg" />
                                                                                            </a>
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
                                                                                    <asp:TemplateField>
                                                                                        <ItemTemplate>
                                                                                            <span class="mb-1">
                                                                                                <asp:Label ID="lblTitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label></span><br />
                                                                                            <asp:Label ID="lblRequirements" Text='<%#Eval("Requirements") %>' runat="server"></asp:Label><br />
                                                                                            <asp:Label ID="lblLocation" Text='<%#Eval("Reward") %>' runat="server"></asp:Label><br />
                                                                                            <span class="badge badge-danger badge-pill mb-2">Deleted</span><br />
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
                                                                            <p>Career Cluster:</p>
                                                                            <asp:Label ID="lblCluster" Text='<%#Eval("CareerCluster") %>' runat="server"></asp:Label></span><br />
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


                                        <!-- Create Modal -->
                                        <div id="mask">
                                </div>
                            <asp:Panel ID="CreatePopup" runat="server" BackColor="White" Height="950px"
                                Width="700px" Style="z-index: 111; background-color: White; position: absolute; left: 15%; top: 0%; border: outset 2px gray; padding: 5px; display: none">
                                <h1>Create Scholarship</h1>
                                                        <div class="form-group">
                                                            <label for="exampleFormControlInput1">Scholarship Title:</label>
                                                            <asp:TextBox ID="txtTitle" class="form-control" placeholder="ie. College Scholarship" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="exampleFormControlInput1">Scholarship Description:</label>
                                                            <asp:TextBox ID="txtDescription" class="form-control" placeholder="ie. Art Appreciation Scholarship for College Students" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="exampleFormControlTextarea1">Scholarship Requirements:</label>
                                                            <asp:TextBox ID="txtRequirements" class="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="exampleFormControlInput1">Amount:</label>
                                                            <asp:TextBox ID="txtAmount" class="form-control" placeholder="ie. $5,000" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="exampleFormControlInput1">Deadline:</label>
                                                            <asp:TextBox ID="txtDeadline" class="form-control" placeholder="ie. 10/12/2019" runat="server"></asp:TextBox>
                                                        </div>
                                                        
                                                        <button type="button" class="btn btn-success" runat="server" onserverclick="SubmitButton_Click">Create Scholarship</button> 
                                                        <button type="button" onserverclick="CloseCreate" class="btn btn-default" runat="server">Close</button>
                                     </asp:Panel>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end of col-->
                                </div>
                                <!--end of row-->
                            </div>
                            <!--end of container-->

                            <!--Start Preview Popup-->
                             <div id="mask">
                                </div>
                            <asp:Panel ID="PreviewPopup" runat="server" BackColor="White" Height="950px"
                                Width="700px" Style="z-index: 111; background-color: White; position: absolute; left: 22%; top: 0%; border: outset 2px gray; padding: 5px; display: none">
                                <h1>Preview of Scholarship</h1>
                                <div class="form-group">
                                    <section class="bg-white space-sm">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col">
                                                    <h2>
                                                        <asp:Label ID="lblTitle1" runat="server" Text=""></asp:Label></h2>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    <!--end of section-->
                                    <section>
                                        <div class="container">
                                            <div class="row justify-content-between">
                                                <div class="col-12 col-md-8 col-lg-7">
                                                    <article>
                                                        <h5>Scholarship Description</h5>
                                                        <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
                                                        <h5>Requirements</h5>
                                                        <asp:Label ID="lblRequirements" runat="server" Text=""></asp:Label>
                                                        <h5>Reward</h5>
                                                        <asp:Label ID="lblReward" runat="server" Text=""></asp:Label>
                                                        <h5>Due Date</h5>
                                                        <asp:Label ID="lblScholarshipDueDate" runat="server" Text=""></asp:Label>
                                                    </article>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                                <button type="button" onserverclick="ClosePreview" class="btn btn-success" runat="server">Close</button>
                            </asp:Panel>
                            <!--End of Preview popup-->


                            <!-- Edit popup -->
                            <div id="mask">
                                </div>
                            <asp:Panel ID="EditPopup" runat="server" BackColor="White" Height="950px"
                                Width="700px" Style="z-index: 111; background-color: White; position: absolute; left: 22%; top: 0%; border: outset 2px gray; padding: 5px; display: none">
                                <h1>Edit Scholarship</h1>
                                            <div class="form-group">
                                                <label for="exampleFormControlInput1">Scholarship Title:</label>
                                                <asp:TextBox ID="txtEditTitle" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1">Scholarship Description:</label>
                                                <asp:TextBox ID="txtEditDescription" multiline="true" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1">Scholarship Requirements:</label>
                                                <asp:TextBox ID="txtEditRequirements" multiline="true" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlInput1">Reward:</label>
                                                <asp:TextBox ID="txtEditREward" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlInput1">DueDate:</label>
                                                <asp:TextBox ID="txtEditDueDate" class="form-control" runat="server"></asp:TextBox>
                                            </div> 
                                  <button type="button" class="btn btn-success" runat="server" onserverclick="SaveEdit_Click">Save Changes</button>
                                  <button type="button" onserverclick="CloseEdit" class="btn btn-default" runat="server">Close</button>

                              </asp:Panel>
                            <!--end Edit Panel-->


                            <!-- Delete popup -->
                            <div id="mask">
                                </div>
                            <asp:Panel ID="DeletePopup" runat="server" BackColor="White" Height="950px"
                                Width="700px" Style="z-index: 111; background-color: White; position: absolute; left: 22%; top: -20%; border: outset 2px gray; padding: 5px; display: none">
                                <h1>Edit Scholarship</h1>
                                            <h3>Are you sure you want to delete this Post?</h3>
                                            <br />
                                            <h5>All applications for this post will also be deleted.</h5>
                                   
                                            <button type="button" class="btn btn-success" runat="server" onserverclick="DeletePost_Click">Yes, Delete</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">No, return to page</button>
                                   
                             </asp:Panel>
                            <!--End delete popup-->

                            <!-- reactivate Modal HTML -->
                            <div id="mask">
                                </div>
                            <asp:Panel ID="RePopup" runat="server" BackColor="White" Height="950px"
                                Width="700px" Style="z-index: 111; background-color: White; position: absolute; left: 22%; top: -20%; border: outset 2px gray; padding: 5px; display: none">
                                <h1>Edit Scholarship</h1>
                                            <h3>Are you sure you want to re-activate this Scholarship?</h3>
                                            <br />
                                            <h5>The Scholarship will become public for everyone to view and apply to.</h5>
                                                                  
                    <button type="button" class="btn btn-success" runat="server" onserverclick="Reactivate_Click">Yes, Re-Activate</button>
                    <button type="button" onserverclick="CloseRe" class="btn btn-default" runat="server">Close</button>
                             </asp:Panel>
                            <!--End reactivate modal-->
            </section>
            <!--end of section-->
        </div>
    </form>         

</asp:Content>

