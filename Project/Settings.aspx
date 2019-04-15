﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form runat="server">

          <section class="space-sm">
        <div class="container">
          <div class="row">
            <div class="col-12 col-md-4 mb-4 mb-md-0">
              <div class="card card-profile-large text-center">
                <div class="card-header">
                  <img alt="Image" src="pages/assets/img/photo-beach.jpg" class="bg-image" />
                </div>
                <div class="card-body">
                  <a href="#">
                    <img alt="Edward Smith" src="pages/assets/img/Ed.svg" class="avatar avatar-lg" />
                  </a>
                  <div class="my-3">
                    <div class="mb-2">
                        <asp:Label class="mb-0" ID="lblName1" runat="server"></asp:Label><br />
                        <asp:Label class="text-muted" ID="lblBusiness" runat="server"></asp:Label> 
                      <br>
                      <asp:Label class="text-small text-muted icon-location" ID="lblLocation" runat="server"></asp:Label>  
                    </div>
                  </div>
                  <div>
                      <span class="text-muted">(434)-840-5578</span>
                    <button class="btn btn-outline-primary"><i class="icon-phone"></i>
                    </button>
                  </div>
                </div>
              </div>
              <!-- end card -->
              <div class="card">
                <div class="card-header d-flex justify-content-between">
                  <div>
                    <span class="h6">Suggested Users</span>
                  </div>
                  <a href="#">View all &rsaquo;</a>
                </div>
                <div class="card-body">
                  <ul class="list-unstyled list-spacing-sm">

                    <li>
                      <a class="media" href="#">
                        <img alt="Image" src="pages/assets/img/avatar-male-1.jpg" class="avatar avatar-sm mr-3" />
                        <div class="media-body">
                          <span class="h6 mb-0">Daniel Cameron</span>
                          <span class="text-muted">Product Designer</span>
                        </div>
                      </a>
                    </li>

                    <li>
                      <a class="media" href="#">
                        <img alt="Image" src="pages/assets/img/avatar-female-1.jpg" class="avatar avatar-sm mr-3" />
                        <div class="media-body">
                          <span class="h6 mb-0">Caitlyn Halsy</span>
                          <span class="text-muted">Marketing Professional</span>
                        </div>
                      </a>
                    </li>

                    <li>
                      <a class="media" href="#">
                        <img alt="Image" src="pages/assets/img/avatar-male-2.jpg" class="avatar avatar-sm mr-3" />
                        <div class="media-body">
                          <span class="h6 mb-0">Toby Marsh</span>
                          <span class="text-muted">Developer</span>
                        </div>
                      </a>
                    </li>

                    <li>
                      <a class="media" href="#">
                        <img alt="Image" src="pages/assets/img/avatar-female-4.jpg" class="avatar avatar-sm mr-3" />
                        <div class="media-body">
                          <span class="h6 mb-0">Lucille Freebody</span>
                          <span class="text-muted">Graphic Designer</span>
                        </div>
                      </a>
                    </li>
                    
                     <li>
                      <a class="media" href="#">
                        <img alt="Image" src="pages/assets/img/avatar-male-4.jpg" class="avatar avatar-sm mr-3" />
                        <div class="media-body">
                          <span class="h6 mb-0">Tod Jones</span>
                          <span class="text-muted">Multimedia Designer</span>
                        </div>
                      </a>
                    </li>
                    
                       <li>
                      <a class="media" href="#">
                        <img alt="Image" src="pages/assets/img/avatar-female-2.jpg" class="avatar avatar-sm mr-3" />
                        <div class="media-body">
                          <span class="h6 mb-0">Cameron Smith</span>
                          <span class="text-muted">Marketing Assistant</span>
                        </div>
                      </a>
                    </li>

                  </ul>
                </div>
              </div>
              <!-- end card -->
              
            </div>
            <!--end of col-->

            <div class="col-12 col-md-8">
              <div class="card">
                <div class="card-body">
                  <div class="media">
                    <div class="media-body">
                      <span class="h5 mb-0">Create Profile</span>
                      <br>
                      <div class="form-group">
                    <img alt="Image" src="pages/assets/img/Ed.svg" class="avatar avatar-lg mb-3 mb-md-0" />
                    <div class="media-body">
                      <div>
                        <label class="custom-file mb-2" for="file2">
                          <input type="file" id="file2" class="custom-file-input height-0">
                          <span class="btn btn-primary"><i class="icon-upload-to-cloud">&nbsp;</i>Upload</span>
                        </label>
                        <div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end of col-->
              </div>
              <!--end of row-->
              <br>
              <div class="row">
                <div class="col-12 col-md-4 order-md-2">
                </div>
                <!--end of col-->
                <div class="col-12 col-md-8 order-md-1">
                  <div class="row">
                    <div class="col-6">
                      <div class="form-group">
                        <label for="first-name">First Name:
                          <span class="text-red">*</span>
                        </label>
                          <asp:TextBox ID="txtFirstName"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-6">
                      <div class="form-group">
                        <label for="last-name">Last Name:
                          <span class="text-red">*</span>
                        </label>
                          <asp:TextBox ID="txtLastName"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-6">
                      <div class="form-group">
                        <label for="last-name">Middle Name:</label>
                          <asp:TextBox ID="txtMiddleName"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-group">
                        <label for="emailaddress">Email Address:
                          <span class="text-red">*</span>
                        </label>
                          <asp:TextBox ID="txtEmail"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                        <small>Used to log in to your account</small>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-group">
                        <label for="emailaddress">Phone Number:
                          <span class="text-red">*</span>
                        </label>
                          <asp:TextBox ID="txtPhone"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-group">
                        <label for="emailaddress">Date of Birth:
                          <span class="text-red">*</span>
                        </label>
                          <asp:TextBox ID="txtDOB"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-group">
                        <label for="emailaddress">Address:
                          <span class="text-red">*</span>
                        </label>
                          <asp:TextBox ID="txtAddress"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-group">
                        <label for="emailaddress">Testimonial:</label>
                          <asp:TextBox ID="txtTestimonial"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                        <small>Made public to students to give insight into your company</small>
                      </div>
                    </div>
                    <div class="col-12">
                      
                    </div>
                  </div>
                </div>
                <!--end of col-->
              </div>
              <!--end of row-->
            
              <div class="row">
                <div class="col-12 col-md-4 order-md-2">
                </div>

                <!--end of col-->
                <div class="col-12 col-md-8 order-md-1">
                  <div class="row">
                    <div class="col-12">
                      <div class="form-group">
                        <label for="website">Company Name:
                             <span class="text-red">*</span>
                        </label>
                        <asp:TextBox ID="txtCompanyName"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                        <small>This will be displayed on your public profile</small>
                      </div>
                      <div class="form-group">
                        <label for="website">Website:</label>
                        <asp:TextBox ID="txtWebsite"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                        <small>This will be displayed on your public profile</small>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-group">
                        <label for="about-me">Industry:</label>
                        <asp:TextBox ID="txtIndustry"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                      </div>
                    </div>                    
                    <div class="col-12">
                      <div class="form-group">
                        <label for="about-me">Company Description:</label>
                        <asp:TextBox ID="txtDescription"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-group">
                        <label for="about-me">Company Mission Statement:</label>
                        <asp:TextBox ID="txtMissionStatement"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-group">
                        <label for="about-me">Company Values:</label>
                        <asp:TextBox ID="txtValues"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-group">
                        <label for="about-me">Company Culture:</label>
                        <asp:TextBox ID="txtCulture"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-group">
                        <label for="about-me">Company Size:</label>
                        <asp:TextBox ID="txtSize"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-group">
                        <label for="about-me">Company Head Quarters Address:</label>
                        <asp:TextBox ID="txtHQ"  class="form-control form-control-lg" runat="server"></asp:TextBox>
                      </div>
                    </div>





           
       
                        <div class="form-group">
                        <div class="custom-control custom-switch">
                          <input type="checkbox" class="custom-control-input" id="customSwitch1">
                          <label class="custom-control-label" for="customSwitch1">Make profile public</label>
                        </div>
                        <button class="btn btn-sm btn-success">Update Profile</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--end of card-->
            
            </div>
            <!--end of col-->
          </div>
          <!--end of row-->
  
      </section>
    
       <div class="container">
          <div class="tab-content">
            <div class="tab-pane fade show active" id="pricing-monthly">
              <div class="row">
                <div class="col-md-6 col-lg-4">
                  <div class="card pricing card-lg">
                    <div class="card-body">
                      <h5>Free One Month Trial</h5>
                      <span class="display-3 price-collapse collapse show">$0</span>
                      <span class="h6">Includes:</span>
                      <ul class="list-unstyled">
                        <li>
                          Access to all features
                        </li>
                        <li>
                          Fully functional Profile
                        </li>
                        <li>
                          Option to upgrade after one month
                        </li>
                      </ul>
                      <a href="app-wizard-onboarding.html" class="btn btn-lg btn-success">Select</a>
                    </div>
                  </div>
                  <!--end card-->
                </div>
                <!--end of col-->
                <div class="col-md-6 col-lg-4">
                  <div class="card pricing card-lg">
                    <div class="card-body">
                      <h5>Pay per Post</h5>
                      <span class="display-3">$3</span>
                      <span class="h6">Includes:</span>
                      <ul class="list-unstyled">
                      <li>
                          Limited access to features
                        </li>
                        <li>
                          Create events and connect                       
                        </li>
                        <li>
                          Option to upgrade at any time
                        </li>
                      </ul>
                      <a href="app-wizard-onboarding.html" class="btn btn-lg btn-success">Select</a>
                    </div>
                  </div>
                  <!--end card-->
                </div>
                <!--end of col-->
                <div class="col-md-6 col-lg-4">
                  <div class="card pricing card-lg">
                    <div class="card-body">
                      <h5>Monthly Subscription</h5>
                      <span class="display-3">$50</span>
                      <span class="h6">Includes:</span>
                      <ul class="list-unstyled">
                        <li>
                          All unlimited access to all features
                        </li>
                        <li>
                          Customizable profile
                        </li>
                        <li>
                          Option to downgrade plan at any time
                        </li>
                      </ul>
                      <a href="app-wizard-onboarding.html" class="btn btn-lg btn-success">Select</a>
                    </div>
                  </div>
                  <!--end card-->
                </div>
                <!--end of col-->
              </div>
              <!--end of row-->
            </div>
      </section>
              <div class="row mb-4">
                <div class="col">
                  <h5>Payment Methods</h5>
                </div>
                <!--end of col-->
              </div>
              <!--end of row-->
              <div class="row">
                <div class="col-12">
                  <form>
                    <table class="table align-items-center">
                      <thead>
                        <tr>
                          <th scope="col">Card Type</th>
                          <th scope="col">Card Number</th>
                          <th scope="col">Default Payment Method</th>
                          <th scope="col">Remove</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row">
                            <img alt="Image" src="pages/assets/img/logo-payment-visa.svg" class="avatar avatar-sm" />
                          </th>
                          <td>
                            <span class="d-block">&bull;&bull;&bull;&bull; &bull;&bull;&bull;&bull; &bull;&bull;&bull;&bull; 8372</span>
                            <small class="text-muted">Exp: 06/22</small>
                          </td>
                          <td>
                            <div class="custom-control custom-radio">
                              <input id="radio1" name="payment-default" type="radio" class="custom-control-input" checked />
                              <label class="custom-control-label" for="radio1"></label>
                            </div>
                          </td>
                          <td>
                            <button type="submit" class="btn btn-sm btn-danger"><i class="icon-squared-cross"></i> Remove card</button>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">
                            <img alt="Image" src="pages/assets/img/logo-payment-amex.svg" class="avatar avatar-sm avatar-square" />
                          </th>
                          <td>
                            <span class="d-block">&bull;&bull;&bull;&bull; &bull;&bull;&bull;&bull; &bull;&bull;&bull;&bull; 1225</span>
                            <small class="text-muted">Exp: 07/21</small>
                          </td>
                          <td>
                            <div class="custom-control custom-radio">
                              <input id="radio2" name="payment-default" type="radio" class="custom-control-input">
                              <label class="custom-control-label" for="radio2"></label>
                            </div>
                          </td>
                          <td>
                            <button type="submit" class="btn btn-sm btn-danger"><i class="icon-squared-cross"></i> Remove card</button>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                    <button class="btn btn-success">Add new card</button>
                  </form>
                </div>
                <!--end of col-->
              </div>
              <!--end of row-->
            </div>
            <!--end of container-->
          </div>
          </div>
          <br>
          <br>
</form>
</asp:Content>
