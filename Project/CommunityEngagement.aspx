<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CommunityEngagement.aspx.cs" Inherits="CommunityEngagement" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
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
    </div>
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
              <ul>
        
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
            <!--end of col-->
          </div>
          <!--end of row-->
        </div>
        <!--end of container-->
      </section>
      <!--end of section-->
    
     <section class="flush-with-above">   
         <div class="container-fluid" style="width:75%">       
          <div class="row justify-content">
            <div class="col-auto">
              <nav aria-label="Page navigation example">
                <ul class="pagination">
                <li>
                <div class="dropdown">
                <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Filter Applications By
                  <span class="sr-only">Toggle Dropdown</span>
                </button>
                <div class="dropdown-menu dropdown-menu-right dropdown-menu-md">
                  <a class="dropdown-item" href="#">Your Events</a>
                  <a class="dropdown-item" href="#">Local Events</a>
                </div>
              </div>
            </li>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <li><h2 class="text-center" id="monthName" runat="server"></h2></li>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         	&nbsp;&nbsp;&nbsp;
           <li> <a href="#myModal2" class="btn btn-success" data-toggle="modal"><i class="icon-plus">&nbsp;</i>Create an Event</a></li>
   		    &nbsp;&nbsp;&nbsp;&nbsp;
                  <li class="page-item disabled">
                    <a class="page-link" href="#" aria-label="Previous">
                      <span aria-hidden="true"><i class="icon-chevron-left"></i>
                      <span class="sr-only">Previous</span>
                    </a>
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
            <!--end of col-->
          </div>
    
          <!--end of row-->
    
      
  </div>
         </div>


            <form runat="server">
                <asp:Calendar ID="Calendar1" runat="server" CssClass="container-fluid" DayNameFormat="Full" Height="479px" Width="973px" OnSelectionChanged="Calendar1_SelectionChanged1" OnDayRender="Calendar1_DayRender" TodayDayStyle-BackColor="#FFE2C6">
                    <DayHeaderStyle CssClass="p-1 text-center, p-1 bg-dark text-white"/>
                    <DayStyle CssClass="date col-1, day col-sm p-2 border border-left-0 border-top-0 text-truncate" />
                    <OtherMonthDayStyle ForeColor="#669999" />
                </asp:Calendar>
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
            </form>



        <!--end of container-->
       <!-- Modal HTML -->
      <div id="myModal2" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Create an Event</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
    <label for="exampleFormControlInput1">Company Name:</label>
    <input type="department" class="form-control" id="exampleFormControlInput1" placeholder="ie. Human Resources">
  </div>
   <div class="form-group">
    <label for="exampleFormControlInput1">Event Title:</label>
    <input type="Position Title" class="form-control" id="exampleFormControlInput1" placeholder="ie. Sales Intern">
  </div>
     <div class="form-group">
    <label for="exampleFormControlInput1">Date of Event:</label>
    <input type="Position Title" class="form-control" id="exampleFormControlInput1" placeholder="ie. Richmond, VA">
  </div>
     <div class="form-group">
    <label for="exampleFormControlInput1">Event Location:</label>
    <input type="Job Salary" class="form-control" id="exampleFormControlInput1">
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Event Description:</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  </div>
   <div class="form-group">
    <label for="exampleFormControlInput1">Last Updated On:</label>
    <input type="Last Updated" class="form-control" id="exampleFormControlInput1">
  </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-success">Create Event</button>
                </div>
            </div>
        </div>
    </div>
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

    </asp:Content>
