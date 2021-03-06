﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CommunityEngagement.aspx.cs" Inherits="CommunityEngagement" %>


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
                <li> <a href="#myModal2" class="btn btn-success" data-toggle="modal"><i class="icon-plus">&nbsp;</i>Create an Event</a></li>  		   
                </ul>
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
            
                <%--<asp:GridView ID="GridView1" runat="server" CssClass="form-group" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                </asp:GridView>--%>

                </span>
                    </div>
                    <!--end of col-->
                </div>
                <!--end of row-->
            </div>
      </div>
            <!--end of container-->
         
         </div>      

       <section class="flush-with-above">
        <!--Body section-->
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
<%--                                <asp:GridView ID="GridView3" runat="server" CssClass="form-group" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    </asp:GridView>--%>
                                               
                    </div>
                    <!--end of col-->
                </div>
                <!--end of row-->
            </div>
        </div>
            <!--end of container-->
            </section>


              </nav>
            </div>
            <!--end of col-->
          </div>
    
          <!--end of row-->
    

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
    <label for="title">Event Title:</label>
    <input type="text" runat="server" class="form-control" id="title" placeholder="ie. Coffee Networking Event">
  </div>
   <div class="form-group">
    <label for="startdate">Start Date:</label>
    <input type="date" runat="server" class="form-control" id="startdate" placeholder="ie. 4/9/2019">
  </div>
     <div class="form-group">
    <label for="enddate">End Date:</label>
    <input type="date" runat="server" class="form-control" id="enddate" placeholder="ie. 4/9/2019">
  </div>
     <div class="form-group">
    <label for="starttime">Start Time:</label>
    <input type="time" runat="server" class="form-control" id="starttime" placeholder="ie. 2:00 pm">
  </div>
     <div class="form-group">
    <label for="endtime">End Time:</label>
    <input type="time" runat="server" class="form-control" id="endtime" placeholder="ie. 3:00 pm">
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
                    <button type="button" class="btn btn-success" runat="server" onserverclick="EventButton_Click">Create Event</button>
                </div>
            </div>
        </div>
    </div>

      <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-137981458-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-137981458-2');
</script>

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