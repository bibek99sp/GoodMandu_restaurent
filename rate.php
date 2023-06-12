<?php session_start(); ?>
<?php include "header.php"; ?>
<style>
    .rating {
        font-size: 24px;
        color: #FFD700;
        /* Yellow color for stars */
    }

    div.stars {

        width: 270px;

        display: inline-block;

    }

    .mt-200 {
        margin-top: 200px;
    }

    input.star {
        display: none;
    }



    label.star {

        float: right;

        padding: 10px;
        margin-left: 0.9em;

        font-size: 15px;

        color: #4A148C;

        transition: all .2s;

    }



    input.star:checked~label.star:before {

        content: '\f005';

        color: #FD4;

        transition: all .25s;

    }


    input.star-5:checked~label.star:before {

        color: #FE7;

        text-shadow: 0 0 20px #952;

    }



    input.star-1:checked~label.star:before {
        color: #F62;
    }



    label.star:hover {
        transform: rotate(-15deg) scale(1.3);
    }



    label.star:before {

        content: '\f006';

        font-family: FontAwesome;

    }
</style>

<div class="container pt-5">
    <div class="row pt-5">
        <div class="col-lg-12 pt-5">
            <div class="heading-title text-center">
                <h2>Rate</h2>
                <p>Rate Past Orders</p>
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
                        $select_query = "SELECT * FROM ratings WHERE userid = '" . $_SESSION['uid'] . "'";
                        $result = mysqli_query($con, $select_query);
                        $fetch_rating = mysqli_fetch_assoc($result);
                    ?>
                        <div class="col-lg-4 col-md-6 special-grid">
                            <div class="gallery-single fix">
                                <img src="admin/<?php echo $r['image']; ?>" class="img-fluid" alt="Image" style='width: 263px; height:170px;'>
                            </div>
                            <div class="name">
                                <?php echo $r['title']; ?>
                            </div>
                            <!-- Rating stars -->
                            <form action="" method="post" class="box">
                                <input type="hidden" name="item_id" value="<?php echo $r['id']; ?>">
                                <input class="star star-5" id="star-5-<?php echo $fetch_products['id']; ?>" type="radio" name="star" value="5" <?php if ($fetch_rating && $fetch_rating['rating'] == 5) { echo 'checked';} ?> />
                                <label class="star star-5" for="star-5-<?php echo $fetch_products['id']; ?>"></label>

                                <input class="star star-4" id="star-4-<?php echo $fetch_products['id']; ?>" type="radio" name="star" value="4" <?php if ($fetch_rating && $fetch_rating['rating'] == 4) {
                                                                                                                                                    echo 'checked';
                                                                                                                                                } ?> />
                                <label class="star star-4" for="star-4-<?php echo $fetch_products['id']; ?>"></label>

                                <input class="star star-3" id="star-3-<?php echo $fetch_products['id']; ?>" type="radio" name="star" value="3" <?php if ($fetch_rating && $fetch_rating['rating'] == 3) {
                                                                                                                                                    echo 'checked';
                                                                                                                                                } ?> />
                                <label class="star star-3" for="star-3-<?php echo $fetch_products['id']; ?>"></label>

                                <input class="star star-2" id="star-2-<?php echo $fetch_products['id']; ?>" type="radio" name="star" value="2" <?php if ($fetch_rating && $fetch_rating['rating'] == 2) {
                                                                                                                                                    echo 'checked';
                                                                                                                                                } ?> />
                                <label class="star star-2" for="star-2-<?php echo $fetch_products['id']; ?>"></label>

                                <input class="star star-1" id="star-1-<?php echo $fetch_products['id']; ?>" type="radio" name="star" value="1" <?php if ($fetch_rating && $fetch_rating['rating'] == 1) {
                                                                                                                                                    echo 'checked';
                                                                                                                                                } ?> />
                                <label class="star star-1" for="star-1-<?php echo $fetch_products['id']; ?>"></label>

                                <input type="submit" value="Rate" name="rate" class="btn">
                            </form>
                        </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>