<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LandingPage.aspx.cs" Inherits="LandingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <section>
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-12 col-lg-10">
    
     		 <div>
              <ul class="feature-list feature-list-sm row">
                <li class="col-6 col-md-4">
                  <a class="card text-left" href="JobPosts.aspx">
                    <div class="card-body">
                     <img src="pages/assets/img/PostIcon.svg" class="card-img-top" alt="Post" height="110px">
                     <br>
                     <br>
                  <h5 class="card-title" align="center">Manage Job Opportunities</h5>
                       <ul><small>
                    		<li>Create job postings for users to view and complete</li>
                    		<li>Manage and edit your existing posts</li>
                  	  </small></ul>
                    </div>
                  </a>
                </li>

                <li class="col-6 col-md-4">
                  <a class="card text-left" href="ViewApplications.aspx">
                    <div class="card-body">
                       <img src="pages/assets/img/View App.svg" class="card-img-top" alt="Post" height="110px">
                     <br>
                     <br>
                  <h5 class="card-title" align="center">View Completed Student Applications</h5>
                       <ul><small>
                    		<li>Take a look at completed applications</li>
                    		<li>Favorite your top applicants</li>
                  	  </small></ul>
                    </div>
                  </a>
                </li>

                <li class="col-6 col-md-4">
                  <a class="card text-left" href="ManageScholarships.aspx">
                    <div class="card-body">
                       <img src="pages/assets/img/Post A Scholarship.svg" class="card-img-top" alt="Post" height="110px">
                     <br>
                     <br>
                  <h5 class="card-title" align="center">Post a Scholarship</h5>
                       <ul><small>
                    		<li>Create a scholarship here</li>
                    		<li>Manage and edit your existing scholarship offers</li>
                  	  </small></ul>
                    </div>
                  </a>
                </li>

                <li class="col-6 col-md-6">
                  <a class="card text-left" href="CommunityEngagement.aspx">
                    <div class="card-body">
                     <img src="pages/assets/img/Community Engagement Icon.svg" class="card-img-top" alt="Post" height="110px">
                     <br>
                     <br>
                  <h5 class="card-title" align="center">Community Engagement</h5>
                       <ul><small>
                    		<li>Create an event for your community</li>
                    <li>Campus recruiting events, job fairs, field trips etc. </li>
                  	  </small></ul>
                    </div>
                  </a>
                </li>

                <li class="col-6 col-md-6">
                  <a class="card text-left" href="Insight.aspx">
                    <div class="card-body">
                       <img src="pages/assets/img/Insights Icon.svg" class="card-img-top" alt="Post" height="110px">
                     <br>
                     <br>
                  <h5 class="card-title" align="center">Insights</h5>
                       <ul><small>
                    		<li>Check out your analytics here</li>
                    <li>View your impressions and engagements</li>
                  	  </small></ul>
                    </div>
                  </a>
                </li>
              </ul>
              <div id="accordion">
 	 <div class="card">
    <div class="card-header">
      <a class="card-link show" data-toggle="collapse" href="#collapseOne">
        Statistics
      </a>
    </div>
    <div id="collapseOne" class="collapse" data-parent="#accordion">
      <div class="card-body">
        
        
          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Number of Applicants</div>
                      <div class="h3 mb-0 font-weight-bold">200</div>
                    </div>
                    <div class="col-auto">
                      <i class="icon-calendar"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Number of Clicks</div>
                      <div class="h3 mb-0 font-weight-bold">100</div>
                    </div>
                    <div class="col-auto">
                      <i class="icon-calendar"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks</div>
                      <br>
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
                    <div class="col-auto">
                      <i class="icon-calendar"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
             <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Pending Requests</div>
                      <div class="h3 mb-0 font-weight-bold">18</div>
                    </div>
                    <div class="col-auto">
                      <i class="icon-calendar"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->
        </div>
        </div>
 	 </div>
            </div>
            <!--end of col-->
          </div>
          <!--end of row-->
        </div>
        <!--end of container-->
      </section>
      <!--end of section-->

    
</asp:Content>

