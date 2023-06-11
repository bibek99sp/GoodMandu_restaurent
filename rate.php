<?php session_start(); ?>
<?php include "header.php"; ?>


<div class="container ">
    <div class="row pt-5">
        <div class="col-lg-12">
            <div class="heading-title text-center">
                <h2>Special Menu</h2>
                <p>Enjoy the new Tasty</p>
            </div>
        </div>
    </div>

    <div class="row inner-menu-box">
        <div class="col-3">

        </div>

        <div class="col-9">
            <div class="tab-content" id="v-pills-tabContent">
                <div class="row">
                    <?php include "connect.php";
                    $s = mysqli_query($con, "select * from menu as m join checkout as c on m.id = c.p_id");
                    while ($r = mysqli_fetch_array($s)) {
                        ?>
                        <div class="col-lg-4 col-md-6 special-grid">
                            <div class="gallery-single fix">
                                <img src="admin/<?php echo $r['image']; ?>" class="img-fluid" alt="Image"
                                    style='width: 263px; height:170px;'>
                                <div class="why-text">
                                    <h4>
                                        <?php echo $r['title']; ?>
                                    </h4>
                                    <p>
                                        <?php echo $r['description']; ?>
                                    </p>
                                    <p>Rs
                                        <?php echo $r['price']; ?> /-
                                    </p>
                                    <h5 align="center">
                                        <?php if (isset($_SESSION['uid'])) {
                                            ?>
                                            <a
                                                href="addcart.php?pid=<?php echo $r['id']; ?>&uid=<?php echo $_SESSION['uid']; ?>&price=<?php echo $r['price']; ?>">Add
                                                Cart</a>
                                        </h5>

                                        <?php
                                        } else {
                                            ?>
                                        <a href="login.php">Add Cart</a>
                                    <?php } ?>

                                </div>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>