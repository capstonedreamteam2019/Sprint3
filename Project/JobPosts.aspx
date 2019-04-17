<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="JobPosts.aspx.cs" Inherits="JobPosts" %>

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

    <section class="space-sm">
        <div class="container">
          <div class="row justify-content-between">
            <div class="col-auto order-md-2 mb-4">
               <div class="row justify-content-center">
            <div class="col-auto">
            </div>
            <!--end of col-->
          </div>
            </div>
            <!--end of col-->
            <div class="col order-md-1">
              <h2 class="mb-0">Manage your Job Opportunities</h2>
              <span>Edit and manage your job postings here.</span>
              <div class="media align-items-center my-3">


             <div class="dropdown">
                <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Filter Jobs By
                  <span class="sr-only">Toggle Dropdown</span>
                </button>
                <div class="dropdown-menu dropdown-menu-right dropdown-menu-md">
                  <a class="dropdown-item" href="#">Last Updated</a>
                  <a class="dropdown-item" href="#">Due Date</a>
                  <a class="dropdown-item" href="#">Department</a>
                </div>
              </div>
        
            <div class="col-auto">        
        <!-- Button HTML (to Trigger Modal) -->
    <a href="#CreateModal" class="btn btn-success" data-toggle="modal"><i class="icon-plus">&nbsp;</i>Create a Job Post</a>


        <!-- Create Job Modal HTML -->
        <div id="CreateModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Create a Job Post</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="title">Position Title:</label>
                            <input type="text" runat="server" class="form-control" id="title" placeholder="ie. Sales Intern">
                        </div>
                        <div class="form-group">
                            <label for="title">Position Description:</label>
                            <input type="text" runat="server" class="form-control" id="description" placeholder="ie. Intern for the summer">
                        </div>
                        <div class="form-group">
                            <label for="department">Department:</label>
                            <input type="text" runat="server" class="form-control" id="department" placeholder="ie. Marketing">
                        </div>

                        <div class="form-group">
                            <label for="location">Job Location:</label>
                            <input type="text" runat="server" class="form-control" id="location" placeholder="ie. Richmond, VA">
                        </div>

                        <div class="form-group">
                            <label for="salary">Salary ($):</label>
                            <input type="text" runat="server" class="form-control" id="salary" placeholder="ie. 10,000">
                        </div>

                        <div class="form-group">
                            <label for="payType">Pay Type:</label>
                            <br />
                            <label for="payType">Yearly</label>
                            <input type="radio" runat="server" id="yearly" name="payType" value="yearly">

                            <label for="payType">Hourly</label>
                            <input type="radio" runat="server" id="hourly" name="payType" value="hourly">
                        </div>

                        <div class="form-group">
                            <label for="deadline">Application Deadline:</label>
                            <input type="text" runat="server" class="form-control" id="deadline" placeholder="3/31/2019">
                        </div>

                        <div class="form-group">
                            <label for="respons">Job Responsibilities:</label>
                            <textarea class="form-control" runat="server" id="respons" rows="3"></textarea>
                        </div>

                        <div class="form-group">
                            <label for="reqs">Job Requirements:</label>
                            <textarea class="form-control" runat="server" id="reqs" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="reqs">A Day in the Life:</label>
                            <textarea class="form-control" runat="server" id="ADayInTheLife" rows="3"></textarea>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success" runat="server" onserverclick="SubmitButton_Click">Create Post</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end Create Modal-->
    </section>
    <!--end header section-->

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
                                <HeaderStyle BackColor="#f8f9fa" Font-Bold="True" ForeColor="Black" />
                                <RowStyle CssClass="style" Width="100%" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                              <asp:Label visible="false" ID="lblID" Text='<%#Eval("PostID") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Title">
                                        <ItemTemplate>
                                            <span class="h6 mb-0">
                                                <asp:Label ID="lblTitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label></span><span class="badge badge-success">Active</span>
                                            <br />
                                            <span class="text-muted">Last Updated: 
                                                    <asp:Label ID="Label1" Text='<%#Eval("LastUpdated") %>' runat="server"></asp:Label></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Due Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDueDate" Text='<%#Eval("DueDate") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Department">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDepartment" Text='<%#Eval("Department") %>' runat="server"></asp:Label>
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
                                            <asp:Label ID="lblLocation" Text='<%#Eval("JobAddress") %>' runat="server"></asp:Label>
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
                                            <asp:Label ID="lblCluster" Text='<%#Eval("CareerCluster") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>         
                                          <div class="dropdown">
                                                <button class="btn btn-sm btn-outline-primary dropdown-toggle dropdown-toggle-no-arrow" type="button" id="btnDropDown" data-toggle="dropdown" onmouseover="mouseOver" aria-haspopup="true" aria-expanded="false">
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

            <br />
            <br />
        <!--End of Girdview-->
    <div id="accordion">
    <div class="card">
    <div class="card-header">
      <a class="card-link show" data-toggle="collapse" href="#collapseOne">
        Deleted Posts
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
                                ID="GridView2"
                                EmptyDataText="No Deleted Posts"
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
                                              <asp:Label visible="false" ID ="lblID" Text='<%#Eval("PostID") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Title">
                                        <ItemTemplate>
                                            <span class="h6 mb-0">
                                                <asp:Label ID="lblTitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label></span><span class="badge badge-danger">Deleted</span>
                                            <br />
                                            <span class="text-muted">Last Updated: 
                                                    <asp:Label ID="Label1" Text='<%#Eval("LastUpdated") %>' runat="server"></asp:Label></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Due Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDueDate" Text='<%#Eval("DueDate") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Department">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDepartment" Text='<%#Eval("Department") %>' runat="server"></asp:Label>
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
                                            <asp:Label ID="lblLocation" Text='<%#Eval("JobAddress") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDescription" Text='<%#Eval("PostDescription") %>' runat="server"></asp:Label>
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
                                          <asp:Button
                                                        Text="Re-Activate"
                                                        type="Button"
                                                        class="btn btn-success"
                                                        ID="Button2"
                                                        runat="server"
                                                        CommandName="Re"
                                                        CommandArgument='<%# Container.DataItemIndex %>' />
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

            <!--Preview Pannel-->
            <div id="mask">
            </div>
      <asp:Panel ID="PreviewPopup" runat="server"  BackColor="White" Height="1500px"
            Width="700px" Style="z-index:111;background-color: White; position: absolute; left: 22%; top: -12%; 
            border: outset 2px gray;padding:5px;display:none">
                    <h1>Preview Job Post</h1>
                <div class="form-group">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                <h2><label ID="Label1" runat="server" text=""></label></h2>
                                            </div>
                                        </div>
                                    </div>
                                
                                <!--end of section-->
                                <div>
                                    <div class="container">
                                        <div class="row justify-content-between">
                                            <div class="col-12 col-md-8 col-lg-7">
                                                <article>
                                                    <h5>Role Description</h5>
                                                    <label ID="Label2" runat="server" text=""></label>
                                                    <h5>Responsibilities</h5>
                                                    <label ID="Label3" runat="server" text=""></label>
                                                    <h5>Minimum Qualifications</h5>
                                                    <label ID="Label4" runat="server" text=""></label>
                                                    <h5>A Day In The Life</h5>
                                                    <label ID="Label5" runat="server" text=""></label>
                                                </article>
                                                <hr>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div class="card">
                                    <ul class="list-group">
                                        <li class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <div><i class="icon-tools mr-1"></i>Department</div>
                                                <label id="Label6" runat="server" text=""></label>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <div><i class="icon-home mr-1"></i>Location</div>
                                                <label id="Label7" runat="server"></label>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <div><i class="icon-calculator mr-1"></i>Salary</div>
                                                <label id="Label8" runat="server"></label>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <div><i class="icon-stopwatch mr-1"></i>Basis</div>
                                                <label id="Label9" runat="server"></label>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <div><i class="icon-calendar mr-1"></i>Due Date</div>
                                                <label id="Label10" runat="server"></label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                              <button type="button" onserverclick="ClosePreview" class="btn btn-success" runat="server">Close</button>              
                </asp:Panel>
            <!--End Preview Pannel-->

            <!--Edit Pannel-->
            <div id="mask">
            </div>
            <asp:Panel ID="EditPopup" runat="server"  BackColor="White" Height="950px"
                Width="700px" Style="z-index:111;background-color: White; position: absolute; left: 22%; top: -20%; 
                border: outset 2px gray;padding:5px;display:none">
                    <h1>Edit Job Post</h1>
                    <div class="form-group">
                            <div>
                                <div class="container">
                                    <div class="row justify-content-between">
                                        <div class="col-12 col-md-8 col-lg-7">
                                            <article>
                                                <label>Job Title</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditTitle">
                                                <label>Role Description</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditDescription">
                                                <label>Responsibilities</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditResponsibilities">
                                                <label>Minimum Qualifications</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditRequirements">
                                                <label>Department</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditDepartment">
                                                <label>Location</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditLocation">
                                                <label>Salary</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditSalary">
                                                <label>Basis</label>
                                                <div class="form-group">
                                                    <label for="payType">Yearly</label>
                                                    <input type="radio" runat="server" id="Radio1" name="payType" value="yearly">

                                                    <label for="payType">Hourly</label>
                                                    <input type="radio" runat="server" id="Radio2" name="payType" value="hourly">
                                                </div>
                                                <label>Due Date</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditDeadline">
                                                <label>A Day In The Life</label>
                                                <input class="form-control" runat="server" type="text" ID="txtADay">
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
              <button type="button" class="btn btn-success" runat="server" onserverclick="SaveEdit_Click">Save Changes</button>
              <button type="button" onserverclick="CloseEdit" class="btn btn-default" runat="server">Close</button>              
            </asp:Panel>
            <!--End edit Pannel-->

            <!--Delete pannel-->
            <div id="mask">
            </div>
            <asp:Panel ID="DeletePopup" runat="server"  BackColor="White" Height="250px"
                Width="500px" Style="z-index:111;background-color: White; position: absolute; left: 30%; top: -20%; 
                border: outset 2px gray;padding:5px;display:none">
                        <h3>Are you sure you want to delete this Post?</h3>
                        <br />
                        <h5>All applications for this post will also be deleted.</h5>

                        <button type="button" class="btn btn-success" runat="server" onserverclick="DeletePost_Click">Yes, Delete</button>
                        <button type="button" onserverclick="CloseDelete" class="btn btn-default" runat="server">Close</button>              
             </asp:Panel>
            <!--End delete pannel-->

            <!--Reactivate pannel-->
            <div id="mask">
            </div>
            <asp:Panel ID="RePopup" runat="server"  BackColor="White" Height="250px"
                Width="500px" Style="z-index:111;background-color: White; position: absolute; left: 30%; top: -20%; 
                border: outset 2px gray;padding:5px;display:none">
                        <h3>Are you sure you want to re-activate this Post?</h3>
                        <br />
                        <h5>The post will become public for everyone to view and apply to.</h5>

                        <button type="button" class="btn btn-success" runat="server" onserverclick="Reactivate_Click">Yes, Re-Activate</button>
                        <button type="button" onserverclick="CloseRe" class="btn btn-default" runat="server">Close</button>              
             </asp:Panel>
            <!--End Reactivate pannel-->

    </section>
    <!--end Body section-->

  </form>

</asp:Content>
