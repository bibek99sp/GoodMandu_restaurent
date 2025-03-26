# GoodMandu Restaurant

> **Disclaimer**: GoodMandu is a fictional restaurant name created for a college project. This project is for educational purposes only and is not associated with any real restaurant.

A full-featured restaurant management system for GoodMandu, a fictional Nepalese restaurant concept developed as an academic project. The system demonstrates the implementation of a complete restaurant management solution with both customer-facing features and administrative capabilities.

## Description

GoodMandu Restaurant is known for its authentic Nepalese cuisine, especially its signature momos (dumplings). The website serves as both an online presence for customers and a management system for staff.

## Features

### Customer Features
- **Menu Browsing**: Browse menu items by categories including:
  - Momo (Traditional Nepalese dumplings)
  - Chowmein
  - Dal Bhat (Traditional Nepalese meal)
  - Burgers
- **Online Ordering**: Add items to cart and place orders
- **Customer Reviews**: Leave reviews and feedback
- **Gallery**: View restaurant ambiance and food images
- **User Accounts**: Register and manage personal accounts

### Administrative Features
- **Menu Management**: 
  - Add/edit/delete menu items
  - Manage food categories
  - Update prices and descriptions
- **Order Management**: Track and process customer orders
- **Review Management**: Moderate customer reviews
- **Gallery Management**: Update restaurant photo gallery
- **User Management**: Manage customer accounts and staff access

## Technical Details

### Technology Stack
- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap
- **Backend**: PHP
- **Database**: MySQL
- **Additional Libraries**:
  - jQuery
  - Font Awesome
  - Bootstrap
  - Custom CSS animations

### Database Structure
The system uses a comprehensive MySQL database (`maher`) with the following tables:

#### Core Tables
1. **`menu`**: Food items catalog
   - Primary fields: id, category, sub_cat, title, description, price, image
   - Stores all menu items with their details and categorization

2. **`food_cat`**: Food categories and subcategories
   - Primary fields: id, catnm, sub_cat
   - Manages the hierarchical food categorization system

3. **`registration`**: User management
   - Primary fields: id, userid, password, email
   - Handles user authentication and profile data

4. **`admin`**: Administrator accounts
   - Primary fields: adminid, password
   - Manages administrative access

#### Order Management
5. **`addcart`**: Shopping cart
   - Primary fields: id, p_id, u_id, price, qty, total
   - Tracks items in users' shopping carts

6. **`checkout`**: Order processing
   - Primary fields: id, p_id, u_id, name, mobile, email, location
   - Stores completed order information

7. **`food_parcel`**: Food delivery details
   - Primary fields: id, name, mobile, email, address, food_id
   - Manages delivery information

#### Content & Engagement
8. **`gallery`**: Image management
   - Primary fields: id, image
   - Stores restaurant and food images

9. **`review`**: Customer feedback
   - Primary fields: id, name, review, description
   - Stores customer reviews and testimonials

10. **`ratings`**: Rating system
    - Primary fields: id, userid, pid, rating
    - Stores user ratings for menu items
    - Foreign keys link to registration(id) and menu(id)

#### Views
- **`product_ratings_view_no_book_name`**: Dynamic view
  - Provides a matrix of product ratings by users
  - Used by the recommendation system

#### Key Features
- Proper foreign key constraints for data integrity
- Auto-incrementing primary keys
- UTF-8 character encoding support
- Optimized for the recommendation system
- Views for efficient data retrieval

## Installation

1. Clone the repository
2. Import the database file (`Bibek.session.sql`) - This is the main database file containing all necessary tables and initial data
3. Configure database connection in `connect.php`
4. Place the project in your web server directory
5. Access through web browser

## Security Features
- User authentication and authorization
- Admin panel protection
- Secure order processing
- Input validation and sanitization

## User Types
1. **Customers**: Can browse menu, place orders, and leave reviews
2. **Admin**: Full access to management features
3. **Staff**: Access to order processing and basic management features

## Recommendation Algorithm

The restaurant implements a sophisticated recommendation system using Matrix Factorization (MF), a collaborative filtering technique to suggest menu items to users based on their past preferences and ratings.

### Algorithm Overview

The recommendation system is implemented using the following components:

#### 1. Matrix Factorization
- **Core Concept**: Decomposes the user-item rating matrix R into two lower-dimensional matrices P and Q
- **Implementation**: Uses Gradient Descent optimization with the following parameters:
  - Learning rate (α) = 0.0002
  - Regularization parameter (β) = 0.02
  - Number of latent factors (K) = 2
  - Maximum iterations = 5000

#### 2. Mathematical Model
The algorithm minimizes the following objective function:
```
min Σ(r_ui - p_u * q_i)² + β(||p_u||² + ||q_i||²)
```
Where:
- r_ui: actual rating of item i by user u
- p_u: user latent factor vector
- q_i: item latent factor vector
- β: regularization parameter to prevent overfitting

#### 3. Implementation Details
1. **Initialization**:
   - Creates random matrices P (users × latent factors) and Q (items × latent factors)
   - Loads existing ratings from the database into matrix R

2. **Training Process**:
   - Iteratively updates P and Q matrices using gradient descent
   - Continues until convergence (error < 0.001) or maximum iterations reached
   - Uses regularization to prevent overfitting

3. **Prediction**:
   - Generates predictions using matrix multiplication of P and Q^T
   - Stores results in 'final_array_view' table for quick lookup

### Features of the Implementation
- **Dynamic User Adaptation**: Continuously learns from new user ratings
- **Scalability**: Efficient matrix operations for large numbers of users and items
- **Cold Start Handling**: Uses average ratings for new users/items
- **Performance Optimization**: 
  - Implements matrix transpose operations for efficient calculations
  - Uses MySQL for storing and retrieving rating data
  - Caches predictions for faster recommendation retrieval

### Integration with Restaurant System
- Recommendations appear on user's menu page
- Personalized suggestions based on:
  - User's previous orders
  - Rating history
  - Similar users' preferences
- Real-time updates as users provide new ratings

### Technical Implementation
The algorithm is implemented in PHP with the following key functions:
1. `matrix_factorization()`: Core MF algorithm implementation
2. `matrixmult()`: Efficient matrix multiplication
3. `transpose()`: Matrix transposition for calculations
4. `generateRandomArray()`: Initialization of factor matrices

This recommendation system helps in:
- Increasing user satisfaction through personalized suggestions
- Improving menu item discovery
- Providing insights into customer preferences
- Optimizing menu planning based on popular items

## About GoodMandu

GoodMandu is a restaurant that combines traditional Nepalese cuisine with modern dining experience. Located in Paknajol, Kathmandu, it's known for its:
- Authentic Nepalese dumplings (momos)
- Traditional Dal Bhat
- Fusion dishes
- Warm hospitality
- Open kitchen concept

## Business Hours
- Monday: Closed
- Tuesday-Wednesday: 9:00 AM - 10:00 PM
- Thursday-Friday: 9:00 AM - 10:00 PM
- Saturday-Sunday: 5:00 PM - 10:00 PM

# File Structure and Organization

## Core Files
- `index.php`: Main entry point, displays homepage with featured menu items, reviews and gallery
- `header.php`: Contains common header HTML, navigation menu and session management
- `footer.php`: Common footer with business hours and contact info
- `connect.php`: Database connection configuration
- `menu.php`: Displays full menu with categories and items
- `cart.php`: Shopping cart management
- `order.php`: Order processing and checkout
- `login.php`/`registration.php`: User authentication and account creation

## Administrative Files (`/admin` directory)
- `index.php`: Admin dashboard entry point
- `food.php`: Menu item management (add/edit/delete)
- `food_cat.php`: Food category management  
- `gallery.php`: Image upload and gallery management
- `review.php`: Customer review moderation
- `viewcart.php`: View and manage customer orders
- `after_login.php`: Admin session landing page

## Database Files (`/database` directory) 
- `maher.sql`: Main database schema and initial data
- `menu.sql`: Menu items and categories data

## Assets
- `/css`: Stylesheets including Bootstrap customizations
- `/js`: JavaScript files for interactivity
- `/images`: Image assets including food photos
- `/fonts`: Font Awesome and custom font files

## Key File Dependencies
1. Menu System:
   - `menu.php` -> `connect.php` for database access
   - `menu.php` -> `addcart.php` for cart functionality
   - Uses `menu` and `food_cat` database tables

2. Order Flow:
   - `cart.php` -> `checkout.php` -> `order.php`
   - Uses `addcart` and `checkout` database tables
   - Requires user authentication via `login.php`

3. Admin Interface:
   - All admin files require `admin/header.php` and `admin/footer.php`
   - Protected by admin authentication in `admin/loginck.php`
   - Database operations through `admin/connect.php`

4. Content Management:
   - Gallery: `admin/gallery.php` -> `gallery.php` (frontend display)
   - Reviews: `admin/review.php` -> `review.php` (frontend display)
   - Menu: `admin/food.php` -> `menu.php` (frontend display)

## Algorithm Implementation Files
- `ratingsample.php`: Contains the core Matrix Factorization algorithm implementation
  - Implements user-item rating matrix decomposition
  - Contains training logic and prediction generation
  - Handles new user/item cold start cases
- `rate.php`: Handles user rating submissions and updates
  - Processes new ratings from users
  - Updates the rating matrix
  - Triggers recommendation updates
- `menu.php`: Integrates recommendations into menu display
  - Shows personalized item suggestions
  - Displays rating UI components
  - Fetches recommendations for current user

Each frontend page includes the common header and footer files which maintain consistent navigation and styling throughout the site. All database operations are centralized through the connect.php file to ensure consistent database access patterns.