<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">

    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-top:1px;">
        <!-- Indicators -->
        
        <div class="carousel-inner" role="listbox">  
            <div class="item active">
              <!--A pic 1  -->
              <img class="third-slide" src="Contents/3906_1.jpg"style="width:100%;height:300px;" alt="Third slide">
            </div>
            <!-- picture -->
            <div class="item">
               <img class="second-slide" src="Contents/dos_RIAA.png" style="width:100%;height:300px;" alt="Second slide"><!--A pic 2  -->
                <div class="container">
                   
                </div>
            </div>

            <div class="item">
                <img class="third-slide" src="Contents/bau.jpg" style="width:100%;height:300px;" alt="Third slide"> <!-- pic 3-->
                <div class="container">
                    
                </div>
            </div>

            <div class="item">   <img class="first-slide" src="Contents/images.png" style="width:100%;height:300px;"   alt="First slide"> 
                <div class="container">
                    <div class="carousel-caption">
                    </div>
                </div>  
            </div>

        </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
   
    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">
            <div class="col-lg-4">
                <img class="img-circle" src="Contents/education.png" alt="Generic placeholder image" width="140" height="140">
                <h2>Heading</h2>
                 <p>This system serves students so much that the student gets p files of materials at any time easily and from anywhere either from the university or home</p>
                <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img class="img-circle" src="Contents/OSR.jpg" alt="Generic placeholder image" width="140" height="140">
                <h2>Heading</h2>
                 <p>This system enables you to upload all types of files. There is no specific file type, but the largest file size you can upload is hidden</p>
                <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img class="img-circle" src="Contents/download.png" alt="Generic placeholder image" width="140" height="140">
                <h2>Heading</h2>
                <p>This program serves faculty members so that faculty members can control the files that are uploaded to students and give them greater powers to control such as deleting files and other removal of the file from a particular student and others</p>
                 <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div>
            <!-- /.col-lg-4 -->
        </div>
        
    </div>
</asp:Content>

