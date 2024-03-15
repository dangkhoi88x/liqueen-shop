<?php require 'app/pages/includes/header.php' ?>

<section class="mymainmenu bg-danger">
    <div class="container">
        <div class="row">
            <div class="col-md-3 text-white py-3">Danh mục sản phẩm</div>
            <div class="col-md-9">
                <nav class="navbar navbar-expand-lg bg-danger">
                    <div class="container-fluid">
                        <a class="navbar-brand d-none" href="#">Navbar</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link text-white active" aria-current="page" href="#">Trang chủ</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="#">Giới thiệu</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Sản phẩm
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Action</a></li>
                                        <li><a class="dropdown-item" href="#">Another action</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" aria-disabled="true">Tin tức</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" aria-disabled="true">Tuyển dụng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" aria-disabled="true">Liên hệ</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</section>
<section class="mymaincontent my-3">
    <div class="container">
        <div class="slider">
            <div id="carouselExampleIndicators" class="carousel slide">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="public/assets/images/slider1.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="public/assets/images/slider2.webp" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!-- slider -->
        <div class="slider">

        </div>
        <!-- slider -->
    </div>
</section>
<?php require 'app/pages/includes/footer.php' ?>
