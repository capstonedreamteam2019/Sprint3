<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LandingPage2.aspx.cs" Inherits="LandingPage2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <section>
        <div class="container">
        
         <nav aria-label="Page navigation example">
                <ul class="pagination">
                  <li class="page-item"><a class="page-link" href="LandingPage.aspx"><i class="icon-grid"></i></a>
                  </li>
                  <li class="page-item active"><a class="page-link" href="LandingPage2.aspx"><i class="icon-menu"></i></a>
                  </li>
                </ul>
              </nav>
              
              <br>
              
               <!-- <div class="col-12 col-md-9"> -->
           <div id="accordion">
   <div class="card">
    <div class="card-header">
      <a class="card-link show" data-toggle="collapse" href="#collapseOne">
        My Site Statistics
      </a>
    </div>
    <div id="collapseOne" class="collapse" data-parent="#accordion">
      <div class="card-body">
          <!-- Content Row -->
          <div class="row">
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-3 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Applicants</div>
                      <br>
                      <div class="h3 mb-0 font-weight-bold"><i class="icon-users">&nbsp;</i>12</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-3 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Active Jobs</div>
                      <br>
                      <div class="h3 mb-0 font-weight-bold"><i class="icon-network">&nbsp;</i>8</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-3 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Profile Proficiency</div>
                      
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h3 mb-0 mr-3 font-weight-bold">50%</div>
                        </div>
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                            <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                    </div>                   
                  </div>
                </div>
              </div>
            </div>
             <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-3 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Active Scholarships</div>
                      <div class="h3 mb-0 font-weight-bold"><i class="icon-graduation-cap">&nbsp;</i>8</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <!--end of col-->
          </div> <!-- end of row-->
        </div> <!-- large card body -->
        </div> <!-- collapseOne -->
        
          </div> <!-- card -->
          </div> <!-- accordion -->
        
          <div class="row">
            <div class="col">
              <table class="table table-hover align-items-center table-borderless">
               
                <tbody>

                  <tr class="bg-white">
                    <th scope="row">
                        <a href="JobPosts.aspx"> 
                            <div class="media align-items-center">
                        <img alt="Image" src="pages/assets/img/PostIcon.svg" alt="Post" height="90px">      
                        <div class="media-body">
                          <span class="h5 mb-0"> &nbsp;&nbsp;&nbsp;&nbsp;Manage Job Opportunities
                          </span>
                          <span class="text-muted"></span>
                        </div>
                      </div>
                        </a>
                    </th>
                    <td>
                    <ul><small><br>
                    		<li>Create job postings for users to view and complete</li>
                    		<li>Manage and edit your existing posts</li>
                  	  </small></ul>
                    </td>
                  </tr>
                  <tr class="table-divider">
                    <th></th>
                    <td></td>
                  </tr>

                  <tr class="bg-white">
                    <th scope="row">
                        <a href="Applications.aspx">
                      <div class="media align-items-center">                      
                        <img src="pages/assets/img/View App.svg" alt="Post" height="90px">                       
                        <div class="media-body">
                          <span class="h5 mb-0"> &nbsp;&nbsp;&nbsp;&nbsp;View Student Applications
                          </span>
                          <span class="text-muted"></span>
                        </div>
                      </div>
                        </a>
                    </th>
                    <td>
                     <ul><small>
                    		<li>Take a look at completed applications</li>
                    		<li>Customizable view to preview applications</li>
                  	  </small></ul>
                    </td>
                  </tr>
                  <tr class="table-divider">
                    <th></th>
                    <td></td>
                  </tr>

                  <tr class="bg-white">
                    <th scope="row">
                        <a href="ManageScholarships.aspx">
                      <div class="media align-items-center">
                        
                        <img src="pages/assets/img/Post A Scholarship.svg" alt="Post" height="90px">
                       
                        <div class="media-body">
                          <span class="h5 mb-0"> &nbsp;&nbsp;&nbsp;&nbsp;Post a Scholarship
                          </span>
                          <span class="text-muted"></span>
                        </div>
                      </div>
                         </a>
                    </th>
                    <td>
                    <ul><small>
                    		<li>Create an event for your community</li>
                    <li>View local events to attend in your area </li>
                  	  </small></ul>
                    </td>
                  </tr>
                  <tr class="table-divider">
                    <th></th>
                    <td></td>
                  </tr>

                  <tr class="bg-white">
                    <th scope="row">
                        <a href="CommunityEngagement.aspx">
                      <div class="media align-items-center">
                        
                        <img src="pages/assets/img/Community Engagement Icon.svg" alt="Post" height="90px">
                        
                        <div class="media-body">
                          <span class="h5 mb-0"> &nbsp;&nbsp;&nbsp;&nbsp;Community Engagement</span>
                          <span class="text-muted"></span>
                        </div>
                      </div>
                    </a>
                    </th>
                    <td>
                    <ul><small>
                    		<li>Create an event for your community</li>
                    <li>View local events to attend in your area </li>
                  	  </small></ul>
                    </td>
                  </tr>
                  <tr class="table-divider">
                    <th></th>
                    <td></td>
                  </tr>

                  <tr class="bg-white">
                    <th scope="row">
                    <a href="Insight.aspx">
                      <div class="media align-items-center">
                        
                        <img src="pages/assets/img/Insights Icon.svg" alt="Post" height="90px">
                        
                        <div class="media-body">
                          <span class="h5 mb-0"> &nbsp;&nbsp;&nbsp;&nbsp;Insights</span>
                          <span class="text-muted"></span>
                        </div>
                      </div>
                        </a>
                    </th>
                    <td>
                    <ul><small>
                    		<li>Local Community Feedback</li>
                    <li>View industry statistics</li>
                  	  </small></ul>
                    </td>
                  </tr>
                  <tr class="table-divider">
                    <th></th>
                    <td></td>
                  </tr>

                  
    
                </tbody>
              </table>
            </div>
            <!--end of col-->
          </div>
          <!--end of row-->
         <!--end of row-->

              
             
    
        </div>
        <!--end of container-->
      </section>
      <!--end of section-->
</asp:Content>


