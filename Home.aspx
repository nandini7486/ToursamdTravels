<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SuratDarshan.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="slideshow-container">
        <!-- Slideshow images -->
        <div class="slideshow">
            <div class="slide" style="background-image: url('imgs/new_welcome_newest.png');"></div>    
        </div>

        <!-- Heading and search input on top of the slideshow -->
        <div class="slideshow-content">
            <h2>Travel Surat With Musafir....</h2>
            <input type="text" id="searchInput" placeholder="Search for a tour..." oninput="filterTours()" style="padding: 10px; width: 300px;">
        </div>
    </div>

    <!-- Tour Cards Section -->

    <div class="container" style="margin-top: 20px;">
        <h4><u>Current Tours</u></h4>
        <div class="tour-container" id="Div1" runat="server">
            <!--current Tour cards will be injected here -->
        </div><br />
        <h4><u>Weekend Tours</u></h4>
        <div class="tour-container" id="Div2" runat="server">
            <!--weekend Tour cards will be injected here -->
        </div><br />
        <h4><u>Seasonal Tours</u></h4>
        <div class="tour-container" id="tourContainer" runat="server">
            <!-- all Tour cards will be injected here -->
        </div><br />
        
        <p id="noResultsMessage" style="color: red; text-align: center; display: none;">Sorry, tour not found!</p>
    </div>

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

    /* Tour cards styling (same as before) */
    .tour-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
    }

    .tour-card {
        border: 1px solid #ddd;
        border-radius: 5px;
        width: 200px;
        height: 300px;
        margin: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        text-align: center;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        overflow: hidden;
    }

    .tour-image {
        width: 120px;
        height: 150px;
        border-bottom: 1px solid #ddd;
        object-fit: cover;
        margin: 0 auto 20px;
    }
</style>


    <script>
        // JavaScript function to filter tours
        function filterTours() {
            var input = document.getElementById('searchInput').value.toLowerCase();
            var tourCards = document.getElementsByClassName('tour-card');
            var found = false;

            for (var i = 0; i < tourCards.length; i++) {
                var tourName = tourCards[i].getElementsByTagName('h5')[0].innerText.toLowerCase();  // Correct the typo here
                var price = tourCards[i].getElementsByTagName('p')[0].innerText.toLowerCase();  // Correct 'inerText' to 'innerText'

                if (tourName.includes(input) || price.includes(input)) {  // Use 'price' instead of 'description'
                    tourCards[i].style.display = 'block';
                    found = true;
                } else {
                    tourCards[i].style.display = 'none';
                }
            }

            var noResultsMessage = document.getElementById('noResultsMessage');
            if (!found) {
                noResultsMessage.style.display = 'block';
            } else {
                noResultsMessage.style.display = 'none';
            }
        }

    </script>
    <br /><br /><br/>
</asp:Content>
