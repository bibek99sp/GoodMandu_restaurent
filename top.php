<?php session_start();
$user_id = $_SESSION['id'];
include "connect.php";
?>
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
<?php include "header.php"; ?>

<div class="container pt-5">

    <div class="row pt-5">
        <div class="col-lg-12 pt-5">
            <div class="heading-title text-center">
                <h2>Top Foods</h2>
                <p>User's Top Picks</p>
            </div>
        </div>
    </div>

    <div class="row inner-menu-box">

    </div>

    <div class="col-12">
        <div class="tab-content" id="v-pills-tabContent">
            <div class="row">
                <?php
                $productRatings = array();
                // Clear the existing values in $final
                $final = array();

                // Retrieve the values from the final_array_view table
                $sql = "SELECT * FROM final_array_view";
                $result = mysqli_query($con, $sql);

                while ($row = mysqli_fetch_assoc($result)) {
                    // Extract the book name from the 'BOOK' column
                    $bookid = $row['id'];

                    // Extract the ratings from the remaining columns
                    $ratings = array_slice($row, 2);

                    // Create a new row array with the book name and ratings
                    $newRow = array_merge([$bookid], $ratings);

                    // Append the new row to the $final array
                    $final[] = $newRow;
                }
                $productRatings = array();

                foreach ($final as $row) {
                    // Extract the product name from the first column
                    $productid = $row[0];

                    // Extract the ratings from the remaining columns
                    $ratings = array_slice($row, 1);

                    // Calculate the average rating for the product
                    $averageRating = array_sum($ratings) / count($ratings);

                    // Store the product name and average rating in the array
                    $productRatings[$productid] = $averageRating;
                }
                arsort($productRatings);

                $select_products = mysqli_query($con, "SELECT * FROM `menu`") or die('query failed');
                $fetch_rating = array();
                if (mysqli_num_rows($select_products) > 0) {
                    while ($fetch_products = mysqli_fetch_assoc($select_products)) {
                        $select_query = "SELECT ROUND(AVG(rating), 0) AS rating FROM ratings WHERE pid = '" . $fetch_products['id'] . "'";
                        $result = mysqli_query($con, $select_query);
                        $fetch_rating[] = mysqli_fetch_assoc($result);
                    }

                    // Sort the product ratings array in descending order
                    arsort($productRatings);
                    $count = 0;
                    foreach ($productRatings as $productID => $rating) {
                        // Retrieve the product details based on the product ID
                        $select_product_query = "SELECT * FROM `menu` WHERE id = '$productID'";
                        $product_result = mysqli_query($con, $select_product_query);
                        $product = mysqli_fetch_assoc($product_result);
                        $averageRating = $fetch_rating[$productID - 35]['rating'];
                        if ($count > 5) {
                            break;
                        }
                        $count++;

                ?>

                        <!-- Show the three item -->


                        <!-- Show the three items -->
                        <div class="col-lg-4 col-md-6 special-grid drinks">
                            <div class="gallery-single fix">
                                <img src="admin/<?php echo $product['image']; ?>" class="img-fluid" alt="Image" style='width: 100%; height:auto;'>
                                <div class="why-text">
                                    <h4><?php echo $product['title']; ?></h4>
                                    <p><?php echo $product['description']; ?></p>
                                    <p>Rs <?php echo $product['price']; ?> /-</p>
                                    <h5 align="center">
                                        <?php if (isset($_SESSION['uid'])) { ?>
                                            <a href="addcart.php?pid=<?php echo $product['id']; ?>&uid=<?php echo $_SESSION['uid']; ?>&price=<?php echo $product['price']; ?>">Add Cart</a>
                                        <?php } else { ?>
                                            <a href="login.php">Add Cart</a>
                                        <?php } ?>
                                    </h5>
                                </div>

                            </div>
                            <form action="" method="post" class="box">
                            <input class="star star-5" id="star-5-<?php echo $product['id']; ?>" type="radio" name="star" value="5" <?php if ($averageRating == 5) {
                                                                                                                                        echo 'checked';
                                                                                                                                    } ?> disabled />
                            <label class="star star-5" for="star-5-<?php echo $product['id']; ?>"></label>

                            <input class="star star-4" id="star-4-<?php echo $product['id']; ?>" type="radio" name="star" value="4" <?php if ($averageRating == 4) {
                                                                                                                                        echo 'checked';
                                                                                                                                    } ?> disabled />
                            <label class="star star-4" for="star-4-<?php echo $product['id']; ?>"></label>

                            <input class="star star-3" id="star-3-<?php echo $product['id']; ?>" type="radio" name="star" value="3" <?php if ($averageRating == 3) {
                                                                                                                                        echo 'checked';
                                                                                                                                    } ?> disabled />
                            <label class="star star-3" for="star-3-<?php echo $product['id']; ?>"></label>

                            <input class="star star-2" id="star-2-<?php echo $product['id']; ?>" type="radio" name="star" value="2" <?php if ($averageRating == 2) {
                                                                                                                                        echo 'checked';
                                                                                                                                    } ?> disabled />
                            <label class="star star-2" for="star-2-<?php echo $product['id']; ?>"></label>

                            <input class="star star-1" id="star-1-<?php echo $product['id']; ?>" type="radio" name="star" value="1" <?php if ($averageRating == 1) {
                                                                                                                                        echo 'checked';
                                                                                                                                    } ?> disabled />
                            <label class="star star-1" for="star-1-<?php echo $product['id']; ?>"></label>
                            </form>
                        </div>


                <?php
                    }
                } else {
                    echo '<p class="empty">no products added yet!</p>';
                }
                ?>
            </div>
        </div>
    </div>
</div>