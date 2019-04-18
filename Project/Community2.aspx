<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Community2.aspx.cs" Inherits="Community2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<form runat="server">

    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Are you sure you want to log out?</h3>
                </div>
                <div class="modal-body">
                   <a href="landing-4.html" class="btn-lg btn-success">Yes</a>
                    <button type="button" class="btn btn-default" data-dismiss="modal">No, return to page</button>
                </div>
            </div>
        </div>
    </div>
   
    <section class="space-sm">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-auto order-md-2 mb-4">
                    <div class="row justify-content-center">
                        <div class="col-auto">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item active">
                                        <a class="page-link" href="Community2.aspx"><i class="icon-grid"></i></a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="CommunityEngagement.aspx"><i class="icon-menu"></i></a>
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
                                <a class="dropdown-item" href="#" runat="server" onserverclick="filterAlphabeticallySecondGridview">Alphabetically</a>
                                <a class="dropdown-item" href="#" runat="server" onserverclick="filterByDateSecondGridview" >Date</a>
                            </div>
                        </div>

                        <div class="col-auto">
                            <!-- Button HTML (to Trigger Modal) -->
                            <a href="#createEvent1" class="btn btn-success" data-toggle="modal" runat="server"><i class="icon-plus">&nbsp;</i>Create an Event</a>
                 
                           
        <!-- Create Event Modal HTML -->
        <div id="createEvent1" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Create an Event</h4>
                </div>
                <div class="modal-body">
   <div class="form-group">
    <label for="title">Event Title:</label>
    <input type="text" runat="server" class="form-control" id="title" placeholder="ie. Coffee Networking Event">
  </div>
   <div class="form-group">
    <label for="startdate">Start Date:</label>
    <input type="text" runat="server" class="form-control" id="startdate" placeholder="ie. 4/9/2019">
  </div>
     <div class="form-group">
    <label for="enddate">End Date:</label>
    <input type="text" runat="server" class="form-control" id="enddate" placeholder="ie. 4/9/2019">
  </div>
     <div class="form-group">
    <label for="starttime">Start Time:</label>
    <input type="text" runat="server" class="form-control" id="starttime" placeholder="ie. 2:00 pm">
  </div>
     <div class="form-group">
    <label for="endtime">End Time:</label>
    <input type="text" runat="server" class="form-control" id="endtime" placeholder="ie. 3:00 pm">
  </div>
     <div class="form-group">
    <label for="location">Event Location:</label>
    <input type="text" runat="server" class="form-control" id="location" placeholder="ie. James Madison University">
  </div>
  <div class="form-group">
    <label for="eventdescription">Event Description:</label>
    <textarea class="form-control" runat="server" id="eventdescription" rows="3"></textarea>
  </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success" runat="server" onserverclick="EventButton_Click">Create Post</button>
                        
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
                                ForeColor="#343A40">
                                <HeaderStyle BackColor="#f8f9fa" Font-Bold="True" ForeColor="Black" />
                                <RowStyle CssClass="style" Width="100%" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <span visible="false">
                                                <asp:Label ID="lblID" Text='<%#Eval("PostID") %>' runat="server"></asp:Label></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Event">
                                        <ItemTemplate>
                                            <span class="h6 mb-0">
                                                <asp:Label ID="lblTitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label></span>
                                            <br />
                                            <span class="text-muted">Last Updated: 
                                           <asp:Label ID="Label1" Text='<%#Eval("lastUpdated") %>' runat="server"></asp:Label></span>       
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
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Event Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" Text='<%#Eval("startdate") %>' runat="server"></asp:Label>
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
                                    <asp:TemplateField>
                                        <ItemTemplate>         
                                          <div class="dropdown">
                                                <button class="btn btn-sm btn-outline-primary dropdown-toggle dropdown-toggle-no-arrow" type="button" id="dropdownMenuButton-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="icon-dots-three-horizontal"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right" aria-labelledby="dropdown01">
                                                    <a class="dropdown-item" href="#myModal3" data-toggle="modal">Preview</a>
                                                    <a class="dropdown-item" href="#myModal4" data-toggle="modal">Edit</a>
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

           
             <!-- SECOND Gridview-->
          
    <section class="flush-with-above">
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
                                ForeColor="#343A40">
                                <HeaderStyle BackColor="#f8f9fa" Font-Bold="True" ForeColor="Black" />
                                <RowStyle CssClass="style" Width="100%" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <span visible="false">
                                                <asp:Label ID="lblID" Text='<%#Eval("PostID") %>' runat="server"></asp:Label></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <br />
                                             <h1>     </h1>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Event">
                                        <ItemTemplate>
                                            <span class="h6 mb-0">
                                                <asp:Label ID="lblTitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label></span>
                                            <br />
                                            <span class="text-muted">Last Updated: 
                                           <asp:Label ID="Label1" Text='<%#Eval("lastUpdated") %>' runat="server"></asp:Label></span>       
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
                                    <asp:TemplateField HeaderText="Event Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" Text='<%#Eval("startdate") %>' runat="server"></asp:Label>
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
                                    <asp:TemplateField>
                                        <ItemTemplate>         
                                          <div class="dropdown">
                                                <button class="btn btn-sm btn-outline-primary dropdown-toggle dropdown-toggle-no-arrow" type="button" id="dropdownMenuButton-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="icon-dots-three-horizontal"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right" aria-labelledby="dropdown01">
                                                    <a class="dropdown-item" href="#myModal3" data-toggle="modal">Preview</a>
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
         </div> <!--lines 233 and 234 were messing up the footer-->
        </section> <!--lines 233 and 234 were messing up the footer-->

            <div class="row justify-content-center">
                <div class="col-auto">
                    <nav aria-label="Page navigation example">
                       
                    </nav>
                </div>
            </div>
        <!--End of SECOND Gridview-->
         </div> <!--lines 233 and 234 were messing up the footer-->
        </section> <!--lines 233 and 234 were messing up the footer-->

            <div class="row justify-content-center">
                <div class="col-auto">
                    <nav aria-label="Page navigation example">
                    </nav>
                </div>
            </div>
        <!--End of Gridview-->
    <br /><br />

     

           

            <!-- Preview Modal HTML -->
            <div id="myModal3" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Preview Event</h4>
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
                                                    <h5>Event Description</h5>
                                                    <label ID="Label11" runat="server" text=""></label>
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
                     <h4 class="modal-title">Edit Event Post</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div>
                                <div class="container">
                                    <div class="row justify-content-between">
                                        <div class="col-12 col-md-8 col-lg-7">
                                            <article>

                                                <label>Event Title</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditTitle">
                                                <label>Start Date</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditStartDate">
                                                <label>End Date</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditEndDate">
                                                <label>Start Time </label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditStartTime">
                                                <label>End Time</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditEndTime">
                                                <label>Event Location</label>
                                                <input class="form-control" runat="server" type="text" ID="txtEditLocation">
                               <!--                 <label>Event Description</label>   -->
                                 <!--               <input class="form-control" runat="server" type="text" ID="txtEditDescription" rows="3"> -->
                                                <label for="eventdescription">Event Description:</label>
                                                <textarea class="form-control" runat="server" id="textEditDescriptionText" rows="3"></textarea>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End Body-->
                    <div class="modal-footer">
                 
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success" runat="server" onserverclick="SaveEdit_Click">Save</button>
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

                    </div>
                    <div class="modal-body">

                        <button type="button" class="btn btn-default" data-dismiss="modal">No, return to page</button>
                         <button type="button" class="btn btn-success" runat="server" onserverclick="DeletePost_Click">Yes, Delete Event</button>
                    </div>
                </div>
            </div>
        </div>
        <!--End delete modal-->
    </section>
    <!--end Body section-->

  </form>


</asp:Content>
