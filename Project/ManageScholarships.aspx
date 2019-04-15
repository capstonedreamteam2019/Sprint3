<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageScholarships.aspx.cs" Inherits="ManageScholarships" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A robust suite of app and landing page templates by Medium Rare">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,400i,500" rel="stylesheet">
    <link href="pages/assets/css/socicon.css" rel="stylesheet" type="text/css" media="all" />
    <link href="pages/assets/css/entypo.css" rel="stylesheet" type="text/css" media="all" />
    <link href="pages/assets/css/theme.css" rel="stylesheet" type="text/css" media="all" />
    <style>
        .style
        {
            border: 1px solid #C8C8C8;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            margin-bottom: 50px;
        }
    </style>
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
                    <a href="#myModal2" class="btn btn-success" data-toggle="modal"><i class="icon-plus">&nbsp;</i>Create a Scholarship</a>
    
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
                                                            ForeColor="#343A40">
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
                                                                        <br />
                                                                        <h1></h1>
                                                                        <br />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <a href="#" class="mr-4">
                                                                            <img alt="Image" src="pages/assets/img/Scholarship Logo.jpg" class="rounded avatar avatar-lg" />
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
                                                                                <a class="dropdown-item" href="#PreviewModal" data-toggle="modal">Preview</a>
                                                                                <a class="dropdown-item" href="#EditModal" data-toggle="modal">Edit</a>
                                                                                <div class="dropdown-divider"></div>
                                                                                <a class="dropdown-item" href="#DeleteModal" data-toggle="modal">Remove</a>
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
                                      <br />
                                      <h1></h1>
                                      <br />
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField>
                                  <ItemTemplate>
                                      <a href="#" class="mr-4">
                                          <img alt="Image" src="pages/assets/img/Scholarship Logo.jpg" class="rounded avatar avatar-lg" />
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
                                      <div class="text-small">
                                          <ul class="list-inline">
                                              <li class="list-inline-item"><i class="icon-eye"></i>221</li>
                                              <li class="list-inline-item"><i class="icon-check"></i>14</li>
                                          </ul>
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


                                    <!-- Create Modal -->
                                    <div id="CreateModal" class="modal fade">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Create a Scholarship</h4>
                                                </div>
                                                <div class="modal-body">
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
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-success" runat="server" onserverclick="SubmitButton_Click">Create Scholarship</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end of col-->
                            </div>
                            <!--end of row-->
                        </div>
                        <!--end of container-->

                                    <!--Start Preview Modal-->
                                    <div id="PreviewModal" class="modal fade">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Preview of Scholarship</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <section class="bg-white space-sm">
                                                            <div class="container">
                                                                <div class="row">
                                                                    <div class="col">
                                                                        <h2><asp:Label ID="lblTitle1" runat="server" Text=""></asp:Label></h2>
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
                                                </div>
                                                <!--End Body-->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                            <!--Contant-->
                                        </div>
                                        <!--Dialog-->
                                    </div>
                                    <!--End of Preview modal-->


                                    <!-- Edit Job Modal HTML -->
                        <div id="EditModal" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Edit Application</h4>
                                    </div>
                                    <div class="modal-body">
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
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-success" runat="server" onserverclick="SaveEdit_Click">Save Changes</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end Edit Modal-->


                                   <!-- Delete Modal HTML -->
                                    <div id="DeleteModal" class="modal fade">
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

                         <!-- reactivate Modal HTML -->
        <div id="myModal6" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>Are you sure you want to re-activate this Scholarship?</h3>
                        <br />
                        <h5>The Scholarship will become public for everyone to view and apply to.</h5>
                    </div>
                    <div class="modal-body">
                        <button type="button" class="btn btn-success" onserverclick="Reactivate_Click" runat="server">Yes, Re-Activate</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">No, return to page</button>
                    </div>
                </div>
            </div>
        </div>
        <!--End reactivate modal-->

                </section>
                <!--end of section-->
            </div>
    </form>         

</asp:Content>

