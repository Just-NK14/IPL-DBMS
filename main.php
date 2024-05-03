<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- For all the css file import -->
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- For the title and the favicon -->
    <title>Indian Premier League Unofficial Website</title>
    <link rel="icon" type="image/x-icon" href="https://www.iplt20.com/img/favicon.ico">

    <!-- Importing fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200..700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Fjalla+One&family=Oswald:wght@200..700&display=swap"
        rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap"
        rel="stylesheet">


    <style>
    body {
        background: rgba(16, 23, 43, 255);
        margin: 0;
        padding: 0;
    }

    body>.navbar {
        background-color: #e0ecfc !important;
    }

    .card-link {
        text-decoration: none;
        color: inherit;
    }

    .card-link .card {
        transition: transform 0.3s ease;
    }

    .card-link .card:hover {
        transform: scale(1.05);
    }

    .image-container {
        position: relative;
        width: 100%;
    }

    .image-container img {
        width: 100%;
        height: auto;
        display: block;
        transition: filter 0.5s ease;
    }

    .image-container:hover img {
        filter: brightness(50%);
    }

    .image-text {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
        font-family: "IBM Plex Sans";
        font-size: 100px;
        font-weight: bold;
        opacity: 0;
        transition: opacity 0.5s ease;
    }

    .image-container:hover .image-text {
        opacity: 1;
    }
    </style>

</head>

<body>
    <!-- including the navigation bar -->
    <?php include 'navbar.html'; ?>


    <!-- IPL Trophy -->
    <div class="image-container">
        <img src="img/Vivo-IPL-Trophy.jpg" alt="">
        <div class="image-text">
            <span style="color: #0cbdff;">10 </span>Teams<br>
            <span style="color: #FFD700;">1 </span>Cup
        </div>
    </div>



    <!-- What are you looking for? -->
    <div class='mt-5 border mx-2'>
        <div class="mainhead mt-4">
            <h3 style="font-size:50px;">
                What Are You Looking For?
            </h3>
        </div>

        <center class='mt-5'>
            <div class="table-container">
                <div class="table-row">
                    <div class="table-cell">
                        <a href="pointable.php?year=2024" class="button"><span><img src='img\table-list.png'> Points
                                Table</span></a>
                    </div>
                    <div class="table-cell">
                        <a href="stats.php?type=batters&team=allteams" class="button"><span><img src='img\curve-arrow.png'> Overall
                                Stats</span></a>
                    </div>
                    <div class="table-cell">
                        <a href="teams.php" class="button"><span><img src='img\employees.png'> All Teams</span></a>
                    </div>
                </div>
            </div>
        </center>
        <br><br>
    </div>

    <div class="mainhead mt-5">
        <h3 style="font-size:50px;">
            Recent Stories
        </h3>
    </div>

    <!-- Cards with titles, image and a small description -->
    <div class="row row-cols-1 row-cols-md-3 g-4 mx-5 mt-3">
        <div class="col shadow-lg">
            <a href="https://www.iplt20.com/video/52863/m15-rcb-vs-lsg--match-highlights?tagNames=2024"
                class="card-link">
                <div class="card h-100 shadow-lg">
                    <center>
                        <img src="https://images.news18.com/ibnlive/uploads/2024/04/mayank-yadav-3-rcb-vs-lsg-ipl-2024-sportzpics-feature-2024-04-0f803700b83fc9a340aaf6a56e13bec2.jpg?impolicy=website&width=640&height=480"
                            class="card-img-top w-100" alt="...">
                    </center>
                    <div class="card-body">
                        <h5 class="card-title">Decoding LSG's bowling & fielding brilliance with Mayank Yadav & Devdutt
                            Padikkal</h5>
                        <p class="card-text">Mayank Yadav's consistent bowling and Devdutt Padikkal's exceptional
                            fielding have been instrumental in LSG's recent cricket victories, showcasing their pivotal
                            roles in the team's success.</p>
                    </div>
                    <div class="card-footer">
                        <small class="text-body-secondary">Last updated 3 mins ago</small>
                    </div>
                </div>
            </a>
        </div>
        <div class="col shadow-lg">
            <a href="https://www.iplt20.com/video/52751/m14-mi-vs-rr--match-highlights?tagNames=2024" class="card-link">
                <div class="card h-100 shadow-lg">
                    <center>
                        <img src="https://images.news18.com/ibnlive/uploads/2024/03/ipl-2024_rajasthan-royals_riyan-parag_nandre-burger-2024-03-98e2df3ed28aacec2da164554d61d15a.jpg?impolicy=website&width=640&height=480"
                            class="card-img-top w-100" alt="...">
                    </center>
                    <div class="card-body">
                        <h5 class="card-title">Celebrating RR's winning run with Radiant Riyan & Thunder Boult</h5>
                        <p class="card-text">Commending RR's victorious streak, Radiant Riyan and Thunder Boult shine as
                            the stars of the match, illuminating their team's path to success.</p>
                    </div>
                    <div class="card-footer">
                        <small class="text-body-secondary">Last updated 1 day ago</small>
                    </div>
                </div>
            </a>
        </div>
        <div class="col shadow-lg">
            <a href="https://www.iplt20.com/video/52592/m12-gt-vs-srh--match-highlights?tagNames=2024"
                class="card-link">
                <div class="card h-100 shadow-lg">
                    <img src="https://c.ndtvimg.com/2024-03/q00jsr9_david-miller-bcci_625x300_31_March_24.jpg?im=FeatureCrop,algorithm=dnn,width=806,height=605"
                        class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Finisher Miller takes GT past finish line with 44*(27)</h5>
                        <p class="card-text">Finisher Miller's remarkable performance propels GT past the finish line
                            with an impressive 44 runs off 27 balls, securing a decisive victory.</p>
                    </div>
                    <div class="card-footer">
                        <small class="text-body-secondary">Last updated 3 days ago</small>
                    </div>
                </div>
            </a>
        </div>
    </div>


    <br><br><br>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        var myCarousel = new bootstrap.Carousel(document.querySelector('#carouselExampleFade'), {
            interval: 1000,
            wrap: true
        });
    });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>

    <script>
    window.addEventListener('scroll', function() {
        var image = document.querySelector('.image-container img');
        var text = document.querySelectorAll('.image-container .text');

        var imageBottom = image.getBoundingClientRect().bottom;

        if (imageBottom <= window.innerHeight) {
            text.forEach(function(elem) {
                elem.style.opacity = 1;
            });
        } else {
            text.forEach(function(elem) {
                elem.style.opacity = 0;
            });
        }
    });
    </script>


</body>

</html>