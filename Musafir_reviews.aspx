<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Musafir_reviews.aspx.cs" Inherits="SuratDarshan.Musafir_reviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="slideshow-container">
        <!-- Slideshow images -->
        <div class="slideshow">
            <div class="slide" style="background-image: url('imgs/new_welcome_newest.png');"></div>    
        </div>

        <!-- Heading and search input on top of the slideshow -->
                <div class="slideshow-content">
            <h2>THOUGHT'S OF Musafir....</h2>
            <input type="text" id="searchInput" placeholder="Search for a tour..." oninput="filterTours()" style="padding: 10px; width: 300px;">
        </div>
    </div>

<!-- Container for review cards -->
<div id="Div2" runat="server" align="center" class="tour-container">
    <!-- review cards will be injected here -->
</div>

<!-- Search message -->
<p id="noResultsMessage" style="color: red; text-align: center; display: none;">Sorry, tour not found!</p>


    <style>
        /* Slideshow container taking half the viewport height */
    .slideshow-container {
        position: relative;
        height: 50vh;
        overflow: hidden;
        display: flex;
        justify-content: center;
        background-color: #000000;
    }

    /* Slideshow wrapper */
    .slideshow {
        position: absolute;
        display: flex;
        height: 100%;
        width: 100%; 
        animation: slide 18s infinite; /* Loop the slideshow, each cycle is 18 seconds */
    }

    .slide {
        width: 1519px; /* Each slide takes up 100% of its container */
        height: 420px;
        background-size: cover;
        background-position: center;
        flex-shrink: 0; /* Prevent slides from shrinking */
    }

    /* Add the images as background to the slides */
    .slide:nth-child(1) {
        background-image: url('imgs/new_welcome_newest.png');
    }

    /* Slideshow content (heading and search box) */
    .slideshow-content {
        position: absolute;
        z-index: 1;
        width: 100%;
        text-align: center;
        color: white;
        top: 50%;
        transform: translateY(-50%);
    }

    .slideshow-content h2 {
        font-size: 2.5em;
        margin-bottom: 20px;
    }

    /* Animation for sliding effect */
    @keyframes slide {
        0% { transform: translateX(0); } /* First slide is visible */
        16.66% { transform: translateX(0); } /* Hold first slide for 5 seconds (16.66% of 18s) */
        22.22% { transform: translateX(-100%); } /* Transition to second slide over 1 second */
        
        100% { transform: translateX(0); } /* Reset to the start */
    }

    /* Optional: Styling for the search box */
    #searchInput {
        padding: 10px;
        width: 300px;
    }
        .tour-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
        margin: 0 auto;
    }

        .tour-card {
        border: 1px solid #ddd;
        border-radius: 5px;
        width: 300px; /* Fixed width */
        height: 400px; /* Fixed height */
        margin: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        text-align: center;
        display: flex;
        flex-direction: column; /* Aligns content vertically */
        justify-content: space-between; /* Distributes the content inside the card */
        overflow: hidden; /* Prevents overflow if content exceeds the card height */
    }

        .tour-image {
        width: 150px;
        height: 150px;
        border-bottom: 1px solid #ddd;
        border-radius: 50%; /* Round image */
        object-fit: cover; /* Ensures the image fits within the circle without distortion */
        margin: 0 auto 20px; /* Center the image and add some bottom margin */
    }

        .tour-card h2 {
        font-size: 1.5em;
        margin: 10px 0;
        flex-grow: 1; /* Ensures the title can expand if needed */
        overflow: hidden; /* Truncates overflow text */
    }

        .tour-card p {
        font-size: 1em;
        color: #666;
        flex-grow: 1;
    }

        .tour-card strong {
        font-weight: bold;
        color: #333;
        margin-top: 10px;
    }
    </style>


    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        .tour-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin: 15px;
        }

        .tour-image {
            max-width: 100%;
            height: auto;
        }
    </style>

    <div class="container">
    <div class="tour-container" id="tourContainer" runat="server">
        <!-- Tour cards will be injected here -->
    </div>
</div>
    
<script>
    // JavaScript function to filter tours
    function filterTours() {
        var input = document.getElementById('searchInput').value.toLowerCase();
        var tourCards = document.getElementsByClassName('tour-card');
        var found = false;

        for (var i = 0; i < tourCards.length; i++) {
            var tourName = tourCards[i].getElementsByTagName('h2')[0].innerText.toLowerCase();
            var description = tourCards[i].getElementsByTagName('p')[0].innerText.toLowerCase();

            // Check if the tour name or description contains the search input
            if (tourName.includes(input) || description.includes(input)) {
                tourCards[i].style.display = 'block';
                found = true;
            } else {
                tourCards[i].style.display = 'none';
            }
        }

        // If no tour is found, display a message
        var noResultsMessage = document.getElementById('noResultsMessage');
        if (!found) {
            noResultsMessage.style.display = 'block';
        } else {
            noResultsMessage.style.display = 'none';
        }
    }
</script><br /><br />
    <br /><br /><br />

</asp:Content>
