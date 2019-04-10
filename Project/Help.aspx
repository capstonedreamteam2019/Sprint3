<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Help.aspx.cs" Inherits="Help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
 <section class="bg-success text-light">
        <div class="container">
          <div class="row justify-content-center mb-5">
            <div class="col-auto text-center">
              <h4>Welcome to Brilliature Support</h4>
            </div>
            <!--end of col-->
          </div>
          <!--end of row-->
          <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-8">
              <form class="card card-sm">
                <div class="card-body row no-gutters align-items-center">
                  <div class="col-auto">
                    <i class="icon-magnifying-glass h4 text-body"></i>
                  </div>
                  <!--end of col-->
                  <div class="col">
                    <input class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search topics or keywords" />
                  </div>
                  <!--end of col-->
                  <div class="col-auto">
                    <button class="btn btn-lg btn-success" type="submit">Search</button>
                  </div>
                  <!--end of col-->
                </div>
              </form>
            </div>
            <!--end of col-->
          </div>
          <!--end of row-->
        </div>
        <!--end of container-->
      </section>
      <!--end of section-->
      <section>
        <div class="container">
          <div class="row justify-content-center mb-5">
            <div class="col-auto">
              <h3 class="h4">What do you need help with?</h3>
            </div>
            <!--end of col-->
          </div>
          <!--end of row-->
          <div class="row justify-content-center">
            <div class="col-12 col-lg-10">
              <ul class="feature-list feature-list-sm row">

                <li class="col-6 col-md-4">
                  <a class="card text-center" href="#">
                    <div class="card-body">
                      <i class="icon-network text-primary display-4"></i>
                      <h6 class="title-decorative">Job Opportunities</h6>
                    </div>
                  </a>
                </li>

                <li class="col-6 col-md-4">
                  <a class="card text-center" href="#">
                    <div class="card-body">
                      <i class="icon-clipboard text-primary display-4"></i>
                      <h6 class="title-decorative">Student Applications</h6>
                    </div>
                  </a>
                </li>

                <li class="col-6 col-md-4">
                  <a class="card text-center" href="#">
                    <div class="card-body">
                      <i class="icon-graduation-cap text-primary display-4"></i>
                      <h6 class="title-decorative">Scholarships</h6>
                    </div>
                  </a>
                </li>

                <li class="col-6 col-md-4">
                  <a class="card text-center" href="#">
                    <div class="card-body">
                      <i class="icon-users text-primary display-4"></i>
                      <h6 class="title-decorative">Community Engagement</h6>
                    </div>
                  </a>
                </li>

                <li class="col-6 col-md-4">
                  <a class="card text-center" href="#">
                    <div class="card-body">
                      <i class="icon-sweden text-primary display-4"></i>
                      <h6 class="title-decorative">Insights</h6>
                    </div>
                  </a>
                </li>

                <li class="col-6 col-md-4">
                  <a class="card text-center" href="#">
                    <div class="card-body">
                      <i class="icon-user text-primary display-4"></i>
                      <h6 class="title-decorative">Profile/Settings</h6>
                    </div>
                  </a>
                </li>

              </ul>
            </div>
            <!--end of col-->
          </div>
          <!--end of row-->
        </div>
        <!--end of container-->
      </section>
      <!--end of section-->
      <section class="flush-with-above">
        <div class="container">
          <div class="row justify-content-center mb-5">
            <div class="col-auto">
              <h3 class="h4">Frequently Asked Questions by Category</h3>
            </div>
            <!--end of col-->
          </div>
          <!--end of row-->
          <ul class="feature-list feature-list-sm row">

            <li class="col-12 col-md-6 col-lg-4">
              <div class="card">
                <div class="card-header d-flex justify-content-between">
                  <div>
                    <span class="h6">Get more support</span>
                    <span class="badge badge-secondary">6</span>
                  </div>
                  <a href="#">View all &rsaquo;</a>
                </div>
                <div class="card-body">
                  <ul class="list-unstyled list-spacing-sm">
                    <li>
                      <i class="icon-text-document text-muted mr-1"></i>
                      <a href="#">Teachers and students</a>
                    </li>
                    <li>
                      <i class="icon-text-document text-muted mr-1"></i>
                      <a href="#">Support for business</a>
                    </li>
                    <li>
                      <i class="icon-text-document text-muted mr-1"></i>
                      <a href="#">Report a problem</a>
                    </li>
                    <li>
                      <i class="icon-text-document text-muted mr-1"></i>
                      <a href="#">Contact Brilliature</a>
                    </li>
                  </ul>
                </div>
              </div>
              <!--end of card-->
            </li>
            <!--end of col-->

            <li class="col-12 col-md-6 col-lg-4">
              <div class="card">
                <div class="card-header d-flex justify-content-between">
                  <div>
                    <span class="h6">Popular topics</span>
                    <span class="badge badge-secondary">4</span>
                  </div>
                  <a href="#">View all &rsaquo;</a>
                </div>
                <div class="card-body">
                  <ul class="list-unstyled list-spacing-sm">
                    <li>
                      <i class="icon-text-document text-muted mr-1"></i>
                      <a href="#">Managing statistics</a>
                    </li>
                    <li>
                      <i class="icon-text-document text-muted mr-1"></i>
                      <a href="#">Creating an event help</a>
                    </li>
                    <li>
                      <i class="icon-text-document text-muted mr-1"></i>
                      <a href="#">Posting a job help</a>
                    </li>
                    <li>
                      <i class="icon-text-document text-muted mr-1"></i>
                      <a href="#">How to preview a job post</a>
                    </li>
                  </ul>
                </div>
              </div>
              <!--end of card-->
            </li>
            <!--end of col-->

            <li class="col-12 col-md-6 col-lg-4">
              <div class="card">
                <div class="card-header d-flex justify-content-between">
                  <div>
                    <span class="h6">Billing</span>
                    <span class="badge badge-secondary">10</span>
                  </div>
                  <a href="#">View all &rsaquo;</a>
                </div>
                <div class="card-body">
                  <ul class="list-unstyled list-spacing-sm">
                    <li>
                      <i class="icon-text-document text-muted mr-1"></i>
                      <a href="#">How do I switch payment methods?</a>
                    </li>
                    <li>
                      <i class="icon-text-document text-muted mr-1"></i>
                      <a href="#">How to upgrade subscriptions</a>
                    </li>
                    <li>
                      <i class="icon-text-document text-muted mr-1"></i>
                      <a href="#">Problems with canceling subscriptions</a>
                    </li>
                    <li>
                      <i class="icon-text-document text-muted mr-1"></i>
                      <a href="#">Can I add more than one card?</a>
                    </li>
                  </ul>
                </div>
              </div>
              <!--end of card-->
            </li>
            <!--end of col-->

          </ul>
          <!--end of row-->
          
        <!--end of container-->
      </section>


</asp:Content>

