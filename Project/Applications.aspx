<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Applications.aspx.cs" Inherits="Applications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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
                                <a class="dropdown-item" href="#">Most Recent</a>
                                <a class="dropdown-item" href="#">Position Applied For</a>
                                <a class="dropdown-item" href="#">Alphabetical</a>
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
                                ForeColor="#343A40">
                                <HeaderStyle BackColor="#f8f9fa" Font-Bold="True" ForeColor="Black" />
                                <RowStyle Width="100%" CssClass="style"  />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <img alt="Image" src="pages/assets/img/avatar-female-1.jpg" class="avatar" />
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
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
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
                                                    <a class="dropdown-item" href="#myModal4" data-toggle="modal">View Application</a>
                                                    <a class="dropdown-item" href="#myModal6" data-toggle="modal">Hire Applicant</a>                  
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#myModal5" data-toggle="modal">Decline Applicant</a>
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
                                        ForeColor="#343A40">
                                        <HeaderStyle BackColor="#f8f9fa" Font-Bold="True" ForeColor="Black" />
                                        <RowStyle Width="100%" CssClass="style" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <img alt="Image" src="pages/assets/img/avatar-female-1.jpg" class="avatar" />
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
                                                    <span class="badge badge-success"><asp:Label ID="lblStatus" Text='<%#Eval("Hired") %>' runat="server"></asp:Label></span>
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
                                                        <button class="btn btn-sm btn-outline-primary dropdown-toggle dropdown-toggle-no-arrow" type="button" id="btnDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <i class="icon-dots-three-horizontal"></i>
                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right" aria-labelledby="dropdown01">
                                                            <a class="dropdown-item" href="#myModal4" data-toggle="modal">View Application</a>
                                                            <a class="dropdown-item" href="Messaging.aspx">Contact Applicant</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a class="dropdown-item" href="#myModal5" data-toggle="modal">Decline Applicant</a>
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
                                                ForeColor="#343A40">
                                                <HeaderStyle Font-Bold="True" ForeColor="Black" />
                                                <RowStyle CssClass="style" Width="100%" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <img alt="Image" src="pages/assets/img/avatar-female-1.jpg" class="avatar" />
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
                                                            <asp:Label ID="lblStatus" Text='<%#Eval("Hired") %>' runat="server"></asp:Label>
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
                                                                <a class="btn btn-success" href="#myModal7" data-toggle="modal">Re-Activate</a>
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

            <!--Student Application-->
            <div id="myModal4" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>Student Application</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row justify-content-between">
                                    <div class="col-12 col-md-8 col-lg-7">
                                        <article>
                                            <img alt="Image" src="pages/assets/img/avatar-female-1.jpg" class="avatar" />
                                            <h5>Name</h5>
                                            <asp:Label ID="lblTitle1" runat="server" Text=""></asp:Label>
                                            <h5>Email</h5>
                                            <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
                                            <h5>Phone Number</h5>
                                            <asp:Label ID="lblResponsibilities" runat="server" Text=""></asp:Label>
                                            <h5>Date Of Birth</h5>
                                            <asp:Label ID="lblQualifications" runat="server" Text=""></asp:Label>
                                            <h5>School</h5>
                                            <asp:Label ID="lblDepartment" runat="server" Text=""></asp:Label>
                                            <h5>Year</h5>
                                            <asp:Label ID="lblLocation" runat="server" Text=""></asp:Label>
                                        </article>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Delete Modal HTML -->
            <div id="myModal5" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3>Are you sure you want to decline this Application?</h3>
                            <br />
                        </div>
                        <div class="modal-body">
                            <button type="button" class="btn btn-success" runat="server" onserverclick="DeletedApp_Click">Yes, Decline</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">No, return to page</button>
                        </div>
                    </div>
                </div>
            </div>

            <!--Hire modal-->
            <div id="myModal6" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3>Are you sure you want to hire this applicant?</h3>
                            <br />
                            <h5>They will receive a notification about your interest in them.</h5>
                        </div>
                        <div class="modal-body">
                            <button type="button" class="btn btn-success" runat="server" onserverclick="Hire_Click">Yes, Hire!</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">No, return to page</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- reactivate Modal HTML -->
        <div id="myModal7" class="modal fade">
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

        </section>
        <!--end of section-->
    </form> 
</asp:Content>