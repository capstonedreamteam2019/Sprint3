<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="JobPosts.aspx.cs" Inherits="JobPosts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
    function openModal() {
        $('#myModal3').modal('show');
    }
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form runat="server">

    <section>
        <!--Header section-->
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="col">
                    <div class="media align-items-center">
                        <div class="media-body">
                            <div class="mb-3">
                                <h1 class="h2 mb-2">Manage Job Opportunities</h1>
                                <span>Create job opportunities, view and edit them here.</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end of col-->
                <div class="col-auto">
                    <!-- Button HTML (to Trigger Modal) -->
                    <a href="#myModal2" runat="server" class="btn btn-success" data-toggle="modal"><i class="icon-plus">&nbsp;</i>Job Post</a>
                </div>
            </div>
        </div>
        <!-- Create Job Modal HTML -->
        <div id="myModal2" class="modal fade">
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
                                SelectedIndexChanged ="Gridview1_SelectedIndexChanged">
                                <HeaderStyle BackColor="#f8f9fa" Font-Bold="True" ForeColor="Black" />
                                <RowStyle CssClass="style" Width="100%" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                              <asp:Label ID="lblID" Text='<%#Eval("PostID") %>' runat="server"></asp:Label>
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
                                          <div class="dropdown">
                                                <button class="btn btn-sm btn-outline-primary dropdown-toggle dropdown-toggle-no-arrow" type="button" id="btnDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="icon-dots-three-horizontal"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right" aria-labelledby="dropdown01">
                                                    <a class="dropdown-item" href="#myModal3" data-toggle="modal">Preview</a>
                                                    <a class="dropdown-item" href="#myModal4" data-toggle="modal">Edit</a>
                                                    <a class="dropdown-item" href="#" data-toggle="modal">Share</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#myModal5" data-toggle="modal">Remove</a>
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

            <div class="row justify-content-center">
                <div class="col-auto">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true"><i class="icon-chevron-left"></i>
                                    </span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">2</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">3</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true"><i class="icon-chevron-right"></i>
                                    </span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
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
                                ForeColor="#343A40">
                                <HeaderStyle BackColor="#f8f9fa" Font-Bold="True" ForeColor="Black" />
                                <RowStyle CssClass="style" Width="100%" />
                                <Columns>
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
                                          <div class="dropdown">
                                                    <a class="btn btn-success" href="#myModal6" data-toggle="modal">Re-Activate</a>
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
        

       <!-- reactivate Modal HTML -->
        <div id="myModal6" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>Are you sure you want to re-activate this Post?</h3>
                        <br />
                        <h5>The post will become public for everyone to view and apply to.</h5>
                    </div>
                    <div class="modal-body">
                        <button type="button" class="btn btn-success" onserverclick="Reactivate_Click" runat="server">Yes, Re-Activate</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">No, return to page</button>
                    </div>
                </div>
            </div>
        </div>
        <!--End reactivate modal-->


            <!-- Preview Modal HTML -->
            <div id="myModal3" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Preview Application</h4>
                      </div>
                        <div class="modal-body">
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
                                                    <h5>Role Description</h5>
                                                    <label ID="Label2" runat="server" text=""></label>
                                                    <h5>Responsibilities</h5>
                                                    <label ID="Label3" runat="server" text=""></label>
                                                    <h5>Minimum Qualifications</h5>
                                                    <label ID="Label4" runat="server" text=""></label>
                                                    <h5>A Day In The Life</h5>
                                                    <label ID="Label10" runat="server" text=""></label>
                                                </article>
                                                <hr>
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
                                                <div><i class="icon-tools mr-1"></i>Department</div>
                                                <label id="Label5" runat="server" text=""></label>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <div><i class="icon-home mr-1"></i>Location</div>
                                                <label id="Label6" runat="server"></label>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <div><i class="icon-calculator mr-1"></i>Salary</div>
                                                <label id="Label7" runat="server"></label>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <div><i class="icon-stopwatch mr-1"></i>Basis</div>
                                                <label id="Label8" runat="server"></label>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <div><i class="icon-calendar mr-1"></i>Due Date</div>
                                                <label id="Label9" runat="server"></label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                       <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Preview Modal-->


        <!-- Edit Modal HTML -->
       <div id="myModal4" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                     <h4 class="modal-title">Edit Job Post</h4>
                    </div>
                    <div class="modal-body">
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
                    </div>
                    <!--End Body-->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" runat="server" onserverclick="SaveEdit_Click">Save Changes</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
               </div>
            </div>
        </div>
        <!--End edit modal-->


       <!-- Delete Modal HTML -->
        <div id="myModal5" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>Are you sure you want to delete this Post?</h3>
                        <br />
                        <h5>All applications for this post will also be deleted.</h5>
                    </div>
                    <div class="modal-body">
                        <button type="button" class="btn btn-success" runat="server" onserverclick="DeletePost_Click">Yes, Delete</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">No, return to page</button>
                    </div>
                </div>
            </div>
        </div>
        <!--End delete modal-->
    </section>
    <!--end Body section-->

  </form>

</asp:Content>
