<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewApplications.aspx.cs" Inherits="ViewApplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section class="space-sm">
        <div class="container">
          <div class="row justify-content-between">
            <div class="col-auto order-md-2 mb-4">
               <div class="row justify-content-center">
            <div class="col-auto">
              <nav aria-label="Page navigation example">
                <ul class="pagination">
                  <li class="page-item active"><a class="page-link" href="ViewApplications.aspx"><i class="icon-grid"></i></a>
                  </li>
                  <li class="page-item"><a class="page-link" href="Applications.aspx"><i class="icon-menu"></i></a>
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
      <!--end of section-->

      
      <section class="flush-with-above">
        <div class="container">
          <ul class="row mb-4 feature-list feature-list-sm">
            
             <li class="col-12 col-md-6 col-lg-4">
             <div class="card" style="width: 18rem;">
  				<div class="card-body">
    			<h5 class="card-title">Cameron Vols</h5>
   					 <h6 class="card-subtitle mb-2 text-muted">Applying For: Sales Intern</h6>
    				 <p class="card-text">Applied On: April 3, 2019. 
    				 <br>
    				 Relevant course work. Honors student. Interested in Sales, Marketing and Business.</p>
    					<span><a href="#" class="btn btn-success btn-sm">View Application</a></span>
						<a href="#" class="card-link">Delete</a>
  					</div>
				</div>
			</li>
             
             <li class="col-12 col-md-6 col-lg-4">
             <div class="card" style="width: 18rem;">
  				<div class="card-body">
    			<h5 class="card-title">Hannah King</h5>
   					 <h6 class="card-subtitle mb-2 text-muted">Applying For: Marketing Intern</h6>
    				 <p class="card-text">Applied On: April 3, 2019. 
    				 <br>
    				 Relevant course work. Honors student. Varsity athlete. Interested in Marketing and Social Media.</p>
    					<span><a href="#" class="btn btn-success btn-sm">View Application</a></span>
						<a href="#" class="card-link">Delete</a>
  					</div>
				</div>
			</li>
			
			  <li class="col-12 col-md-6 col-lg-4">
             <div class="card" style="width: 18rem;">
  				<div class="card-body">
    			<h5 class="card-title">John Green</h5>
   					 <h6 class="card-subtitle mb-2 text-muted">Applying For: Marketing Intern</h6>
    				 <p class="card-text">Applied On: April 2, 2019. 
    				 <br>
    				 Relevant course work. Honors student. Interested in Social Media and Graphic Design.</p>
    					<span><a href="#" class="btn btn-success btn-sm">View Application</a></span>
						<a href="#" class="card-link">Delete</a>
  					</div>
				</div>
			</li>
            
            <li class="col-12 col-md-6 col-lg-4">
             <div class="card" style="width: 18rem;">
  				<div class="card-body">
    			<h5 class="card-title">Kelly Zhang</h5>
   					 <h6 class="card-subtitle mb-2 text-muted">Applying For: Sales Intern</h6>
    				 <p class="card-text">Applied On: April 3, 2019. 
    				 <br>
    				 Relevant course work. Honors student. Interested in Sales, Marketing and Business.</p>
    					<span><a href="#" class="btn btn-success btn-sm">View Application</a></span>
						<a href="#" class="card-link">Delete</a>
  					</div>
				</div>
			</li>
            
            <li class="col-12 col-md-6 col-lg-4">
             <div class="card" style="width: 18rem;">
  				<div class="card-body">
    			<h5 class="card-title">Claire James</h5>
   					 <h6 class="card-subtitle mb-2 text-muted">Applying For: Sales Rep</h6>
    				 <p class="card-text">Applied On: April 2, 2019. 
    				 <br>
    				 Relevant course work. Honors student. Interested in Sales, Marketing and Business.</p>
    					<span><a href="#" class="btn btn-success btn-sm">View Application</a></span>
						<a href="#" class="card-link">Delete</a>
  					</div>
				</div>
			</li>
           
            <li class="col-12 col-md-6 col-lg-4">
             <div class="card" style="width: 18rem;">
  				<div class="card-body">
    			<h5 class="card-title">Dean Kennington</h5>
   					 <h6 class="card-subtitle mb-2 text-muted">Applying For: Sales Intern</h6>
    				 <p class="card-text">Applied On: April 2, 2019. 
    				 <br>
    				 Relevant course work. Varsity Student. Interested in Sales, Marketing and Business.</p>
    					<span><a href="#" class="btn btn-success btn-sm">View Application</a></span>
						<a href="#" class="card-link">Delete</a>
  					</div>
				</div>
			</li>

            <li class="col-12 col-md-6 col-lg-4">
             <div class="card" style="width: 18rem;">
  				<div class="card-body">
    			<h5 class="card-title">Cooper Cullen</h5>
   					 <h6 class="card-subtitle mb-2 text-muted">Applying For: Social Media Intern</h6>
    				 <p class="card-text">Applied On: April 1, 2019. 
    				 <br>
    				 Relevant course work. Honors student. Interested in Sales, Marketing and Business.</p>
    					<span><a href="#" class="btn btn-success btn-sm">View Application</a></span>
						<a href="#" class="card-link">Delete</a>
  					</div>
				</div>
			</li>

            <li class="col-12 col-md-6 col-lg-4">
             <div class="card" style="width: 18rem;">
  				<div class="card-body">
    			<h5 class="card-title">Hannah Clark</h5>
   					 <h6 class="card-subtitle mb-2 text-muted">Applying For: Business Rep.</h6>
    				 <p class="card-text">Applied On: April 1, 2019. 
    				 <br>
    				 Relevant course work. Honors student. Interested in Sales, Marketing and Business.</p>
    					<span><a href="#" class="btn btn-success btn-sm">View Application</a></span>
						<a href="#" class="card-link">Delete</a>
  					</div>
				</div>
			</li>

            <li class="col-12 col-md-6 col-lg-4">
             <div class="card" style="width: 18rem;">
  				<div class="card-body">
    			<h5 class="card-title">Jake Parker</h5>
   					 <h6 class="card-subtitle mb-2 text-muted">Applying For: Marketing Intern</h6>
    				 <p class="card-text">Applied On: April 1, 2019. 
    				 <br>
    				 Relevant course work. Honors student. Interested in Sales, Marketing and Business.</p>
    					<span><a href="#" class="btn btn-success btn-sm">View Application</a></span>
						<a href="#" class="card-link">Delete</a>
  					</div>
				</div>
			</li>
            
            <li class="col-12 col-md-6 col-lg-4">
             <div class="card" style="width: 18rem;">
  				<div class="card-body">
    			<h5 class="card-title">Sam Walters</h5>
   					 <h6 class="card-subtitle mb-2 text-muted">Applying For: Social Media Intern</h6>
    				 <p class="card-text">Applied On: March 31, 2019. 
    				 <br>
    				 Relevant course work. Honors student. Interested in Sales, Marketing and Business.</p>
    					<span><a href="#" class="btn btn-success btn-sm">View Application</a></span>
						<a href="#" class="card-link">Delete</a>
  					</div>
				</div>
			</li>
            
            <li class="col-12 col-md-6 col-lg-4">
             <div class="card" style="width: 18rem;">
  				<div class="card-body">
    			<h5 class="card-title">Mark Salles</h5>
   					 <h6 class="card-subtitle mb-2 text-muted">Applying For: Sales Intern</h6>
    				 <p class="card-text">Applied On: March 31, 2019
    				 <br>
    				 Relevant course work. Honors student. Interested in Sales, Marketing and Business.</p>
    					<span><a href="#" class="btn btn-success btn-sm">View Application</a></span>
						<a href="#" class="card-link">Delete</a>
  					</div>
				</div>
			</li>
            
            <li class="col-12 col-md-6 col-lg-4">
             <div class="card" style="width: 18rem;">
  				<div class="card-body">
    			<h5 class="card-title">Meredith Bryan</h5>
   					 <h6 class="card-subtitle mb-2 text-muted">Applying For: Social Media Intern</h6>
    				 <p class="card-text">Applied On: March 31, 2019
    				 <br>
    				 Relevant course work. Honors student. Interested in Sales, Marketing and Business.</p>
    					<span><a href="#" class="btn btn-success btn-sm">View Application</a></span>
						<a href="#" class="card-link">Delete</a>
  					</div>
				</div>
			</li>
          </ul>
         
          <!--end of row-->
         
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
            <!--end of col-->
          </div>
          <!--end of row-->
        </div>
        <!--end of container-->
      </section>
      <!--end of section-->
</asp:Content>

