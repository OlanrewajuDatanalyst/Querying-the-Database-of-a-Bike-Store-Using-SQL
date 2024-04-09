-- -----------------------------------------------------
-- Table `bikestore`.`stores`
-- -----------------------------------------------------

CREATE TABLE Stores
(
	store_id integer,
	store_name varchar (50),
	phone varchar (20),
	email varchar (100),
	street varchar (100),
	city varchar (50),	
	state varchar (10),
	zip_code integer,
	PRIMARY KEY (store_id)

);

-- -----------------------------------------------------
-- Table `bikestore`.`staffs`
-- -----------------------------------------------------

CREATE TABLE Staffs 
(
	staff_id integer,	
	first_name varchar (50),
	last_name varchar (50),
	email varchar (100),
	phone varchar (20),
	active integer,
	store_id integer,
	manager_id integer,
	PRIMARY KEY (staff_id),
	FOREIGN KEY (store_id) REFERENCES Stores(store_id)

);

-- -----------------------------------------------------
-- Table `bikestore`.`brands`
-- -----------------------------------------------------

CREATE TABLE Brands
(
	brand_id integer,
	brand_name varchar (50),
	PRIMARY KEY (brand_id)

);

-- -----------------------------------------------------
-- Table `bikestore`.`categories`
-- -----------------------------------------------------

CREATE TABLE Categories
(
	category_id	integer,
	category_name varchar (50),
	PRIMARY KEY (category_id)

);

-- -----------------------------------------------------
-- Table `bikestore`.`products`
-- -----------------------------------------------------

CREATE TABLE Products
(
	product_id integer,
	product_name varchar (100),	
	brand_id integer,
	category_id	integer,
	model_year date,	
	list_price decimal,
	PRIMARY KEY (product_id),
	FOREIGN KEY (brand_id) REFERENCES Brands(brand_id),
	FOREIGN KEY (category_id) REFERENCES Categories(category_id)

);

-- -----------------------------------------------------
-- Table `bikestore`.`stocks`
-- -----------------------------------------------------

CREATE TABLE Stocks
(
	store_id integer,	
	product_id integer,
	quantity integer,
	FOREIGN KEY (store_id) REFERENCES Stores(store_id),
	FOREIGN KEY (product_id) REFERENCES Products (product_id)

);

-- -----------------------------------------------------
-- Table `bikestore`.`customers`
-- -----------------------------------------------------

CREATE TABLE Customers
(
	customer_id	integer,
	first_name varchar (50),
	last_name varchar (50),
	phone varchar (50),
	email varchar (50),
	street varchar (100),
	city varchar (50),
	state varchar (50),
	zip_code varchar (20),
	PRIMARY KEY (customer_id)

); 

-- -----------------------------------------------------
-- Table `bikestore`.`orders`
-- -----------------------------------------------------

CREATE TABLE Orders
(
	order_id integer,
	customer_id integer,	
	order_status integer,
	order_date date,	
	required_date date,	
	shipped_date date,	
	store_id integer,	
	staff_id integer,
	PRIMARY KEY (order_id),
	FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
	FOREIGN KEY (store_id) REFERENCES Stores(store_id),
	FOREIGN KEY (staff_id) REFERENCES Staffs(staff_id)

);

-- -----------------------------------------------------
-- Table `bikestore`.`order_items`
-- -----------------------------------------------------

CREATE TABLE Order_Items
(
	order_id integer,	
	item_id	integer,
	product_id integer,
	quantity integer,
	list_price decimal,	
	discount decimal,
	FOREIGN KEY (order_id) REFERENCES Orders(order_id),
	FOREIGN KEY (product_id) REFERENCES Products(product_id)

);
