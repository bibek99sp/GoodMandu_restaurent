<?php session_start();
$user_id = $_SESSION['id'];
include "connect.php";
?>
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

    </div>
    <?php
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['rate'])) {
        $item_id = $_POST['item_id'];
        $rating = $_POST['star'];

        // Perform necessary validation and sanitization of the input values

        // Check if the rating already exists for the user and item
        $select_query = "SELECT * FROM ratings WHERE userid = '$user_id' AND pid = '$item_id'";
        $result = mysqli_query($con, $select_query);

        if (mysqli_num_rows($result) > 0) {
            // Update the existing rating
            $update_query = "UPDATE ratings SET rating = '$rating' WHERE userid = '$user_id' AND pid = '$item_id'";
            $update_result = mysqli_query($con, $update_query);

            if ($update_result) {
                echo "Rating updated successfully!";
            } else {
                echo "Error updating rating: " . mysqli_error($conn);
            }
        } else {
            // Insert the rating into the 'user_rating' table
            $uid = $_SESSION['id'];
            $insert_query = "INSERT INTO ratings (userid, pid, rating) VALUES ('$uid', '$item_id', '$rating')";
            $insert_result = mysqli_query($con, $insert_query);

            if ($insert_result) {
                echo "Rating stored successfully!";
            } else {
                echo "Error storing rating: " . mysqli_error($con);
            }
        }
        include 'ratingsample.php';
    }
    ?>
    <div class="col-12">
        <div class="tab-content" id="v-pills-tabContent">
            <div class="row">
                <?php
                $s = mysqli_query($con, "select DISTINCT m.id, m.image, m.title, c.p_id from menu as m join checkout as c on m.id = c.p_id");
                while ($r = mysqli_fetch_array($s)) {
                    $select_query = "SELECT * FROM ratings WHERE userid = '" . $_SESSION['id'] . "' AND pid = '" . $r['p_id'] . "'";
                    $result = mysqli_query($con, $select_query);
                    $fetch_rating = mysqli_fetch_assoc($result);
                ?>
                    <div class="col-lg-4 col-md-6 special-grid">
                        <div class="gallery-single fix">
                            <img src="admin/<?php echo $r['image']; ?>" class="img-fluid" alt="Image" style='width: 100%; height:auto;'>
                        </div>
                        <div class="name">
                            <?php echo $r['title']; ?>
                        </div>
                        <!-- Rating stars -->
                        <form action="" method="post" class="box">
                            <input type="hidden" name="item_id" value="<?php echo $r['p_id']; ?>">
                            <input class="star star-5" id="star-5-<?php echo $r['p_id']; ?>" type="radio" name="star" value="5" <?php if ($fetch_rating && $fetch_rating['rating'] == 5) {
                                                                                                                                    echo 'checked';
                                                                                                                                } ?> />
                            <label class="star star-5" for="star-5-<?php echo $r['p_id']; ?>"></label>

                            <input class="star star-4" id="star-4-<?php echo $r['p_id']; ?>" type="radio" name="star" value="4" <?php if ($fetch_rating && $fetch_rating['rating'] == 4) {
                                                                                                                                    echo 'checked';
                                                                                                                                } ?> />
                            <label class="star star-4" for="star-4-<?php echo $r['p_id']; ?>"></label>

                            <input class="star star-3" id="star-3-<?php echo $r['p_id']; ?>" type="radio" name="star" value="3" <?php if ($fetch_rating && $fetch_rating['rating'] == 3) {
                                                                                                                                    echo 'checked';
                                                                                                                                } ?> />
                            <label class="star star-3" for="star-3-<?php echo $r['p_id']; ?>"></label>

                            <input class="star star-2" id="star-2-<?php echo $r['p_id']; ?>" type="radio" name="star" value="2" <?php if ($fetch_rating && $fetch_rating['rating'] == 2) {
                                                                                                                                    echo 'checked';
                                                                                                                                } ?> />
                            <label class="star star-2" for="star-2-<?php echo $r['p_id']; ?>"></label>

                            <input class="star star-1" id="star-1-<?php echo $r['p_id']; ?>" type="radio" name="star" value="1" <?php if ($fetch_rating && $fetch_rating['rating'] == 1) {
                                                                                                                                    echo 'checked';
                                                                                                                                } ?> />
                            <label class="star star-1" for="star-1-<?php echo $r['p_id']; ?>"></label>

                            <input type="submit" value="Rate" name="rate" class="btn">
                        </form>
                    </div>

                <?php } ?>
            </div>
        </div>
    </div>
</div>
</div>