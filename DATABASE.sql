-- membuat database
USE tempdb;
GO

DROP DATABASE IF EXISTS Hotel_Realta;
GO

CREATE DATABASE Hotel_Realta;
GO


-- menggunakan db hotel_realta
USE Hotel_Realta;
GO

CREATE SCHEMA Users;
GO

CREATE SCHEMA Master;
GO

CREATE SCHEMA Hotel;
GO

CREATE SCHEMA HR;
GO

CREATE SCHEMA Booking;
GO

CREATE SCHEMA [Resto];

GO

-- MODULE MASTERS --

CREATE TABLE Master.regions
(
    region_code int IDENTITY(1, 1),
    region_name nvarchar(35) UNIQUE NOT NULL,
    CONSTRAINT pk_region_code PRIMARY KEY(region_code)
);

CREATE TABLE Master.country
(
    country_id int IDENTITY(1, 1),
    country_name nvarchar(55) UNIQUE NOT NULL,
    country_region_id int,
    CONSTRAINT pk_country_id PRIMARY KEY (country_id),
    CONSTRAINT fk_country_region_id FOREIGN KEY(country_region_id) REFERENCES Master.regions(region_code) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

CREATE TABLE Master.provinces
(
    prov_id int IDENTITY (1, 1),
    prov_name nvarchar(85) NOT NULL,
    prov_country_id int CONSTRAINT pk_prov_id PRIMARY KEY(prov_id),
    CONSTRAINT fk_prov_country_name FOREIGN KEY(prov_country_id) REFERENCES Master.country(country_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

CREATE TABLE Master.address
(
    addr_id int IDENTITY(1, 1),
    addr_line1 nvarchar(255) NOT NULL,
    addr_line2 nvarchar(255),
    addr_postal_code nvarchar(5),
    addr_spatial_location geography,
    addr_prov_id int,
    CONSTRAINT pk_addr_id PRIMARY KEY(addr_id),
    CONSTRAINT fk_addr_prov_id FOREIGN KEY(addr_prov_id) REFERENCES Master.provinces(prov_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

CREATE TABLE Master.category_group
(
    cagro_id int IDENTITY(1, 1),
    cagro_name nvarchar(25) UNIQUE NOT NULL CHECK (cagro_name IN ('1', '2', '3 ', '4', '5', '6', '7')),
    cagro_description nvarchar(255),
    cagro_type nvarchar(25) NOT NULL CHECK (cagro_type IN('category', 'service', 'facility')),
    cagro_icon nvarchar(255),
    cagro_icon_url nvarchar(255),
    CONSTRAINT pk_cagro_id PRIMARY KEY(cagro_id)
);

CREATE TABLE Master.policy
(
    poli_id int IDENTITY(1, 1),
    poli_name nvarchar(55) NOT NULL,
    poli_description nvarchar(255),
    CONSTRAINT pk_poli_id PRIMARY KEY(poli_id)
);

CREATE TABLE Master.policy_category_group
(
    poca_poli_id int NOT NULL,
    poca_cagro_id int NOT NULL,
    CONSTRAINT fk_poca_poli_id FOREIGN KEY(poca_poli_id) REFERENCES Master.policy(poli_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    CONSTRAINT fk_poca_cagro_id FOREIGN KEY(poca_cagro_id) REFERENCES Master.category_group(cagro_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

CREATE TABLE Master.price_item
(
    prit_id int IDENTITY(1, 1),
    prit_name nvarchar(55) UNIQUE NOT NULL,
    prit_price money NOT NULL,
    prit_description nvarchar(255),
    prit_type nvarchar(15) NOT NULL CHECK (prit_type IN ('SNACK', 'FACILITY', 'SOFTDRINK', 'FOOD', 'SERVICE')),
    prit_modified_date datetime,
    CONSTRAINT pk_prit_id PRIMARY KEY(prit_id)
);

CREATE TABLE Master.service_task
(
    seta_id int IDENTITY(1, 1),
    seta_name nvarchar(85) UNIQUE NOT NULL,
    seta_seq smallint CONSTRAINT pk_set_id PRIMARY KEY(seta_id)
);

CREATE TABLE Master.members
(
    memb_name nvarchar(15) NOT NULL,
    memb_description nvarchar(100),
    CONSTRAINT pk_memb_name PRIMARY KEY(memb_name)
);

-- MODULE USERS	--

CREATE TABLE users.users
(
    user_id INT IDENTITY(1,1) NOT NULL,
    user_full_name NVARCHAR (55) DEFAULT 'guest' NOT NULL,
    user_type NVARCHAR (15) CHECK(user_type IN('T','C','I')),
    user_company_name NVARCHAR (255),
    user_email NVARCHAR(256),
    user_phone_number NVARCHAR (25) UNIQUE NOT NULL,
    user_modified_date DATETIME,
    CONSTRAINT pk_user_id PRIMARY KEY(user_id)
);

CREATE TABLE users.user_members
(
    usme_user_id INT,
    usme_memb_name NVARCHAR (15) CHECK(usme_memb_name IN('Silver','Gold','VIP','Wizard')),
    usme_promote_date DATETIME,
    usme_points SMALLINT,
    usme_type NVARCHAR(15) DEFAULT 'Expired',
    CONSTRAINT pk_usme_user_id PRIMARY KEY(usme_user_id),
    CONSTRAINT fk_usme_user_id FOREIGN KEY(usme_user_id) REFERENCES users.users (user_id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,
    CONSTRAINT fk_usme_memb_name FOREIGN KEY (usme_memb_name) REFERENCES master.members(memb_name)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE users.roles
(
    role_id INT IDENTITY(1,1),
    role_name NVARCHAR (35) NOT NULL,
    CONSTRAINT pk_role_id PRIMARY KEY(role_id)
);

CREATE TABLE users.user_roles
(
    usro_user_id INT,
    usro_role_id INT,
    CONSTRAINT pk_usro_user_id PRIMARY KEY(usro_user_id),
    CONSTRAINT fk_usro_user_id FOREIGN KEY (usro_user_id) REFERENCES users.users (user_id) 
	ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_usro_role_id FOREIGN KEY (usro_role_id) REFERENCES users.roles (role_id) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE users.user_profiles
(
    uspro_id INT IDENTITY(1,1),
    uspro_national_id NVARCHAR (20) NOT NULL,
    uspro_birth_date DATE NOT NULL,
    uspro_job_title NVARCHAR (50),
    uspro_marital_status NCHAR(1) CHECK(uspro_marital_status IN('M','S')),
    uspro_gender NCHAR(1) CHECK(uspro_gender IN('M','F')),
    uspro_addr_id INT,
    uspro_user_id INT,
    CONSTRAINT pk_usro_id PRIMARY KEY(uspro_id),
    CONSTRAINT fk_uspro_user_id FOREIGN KEY (uspro_user_id) REFERENCES users.users (user_id) 
	ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_uspro_addr_id FOREIGN KEY (uspro_addr_id) REFERENCES master.address (addr_id) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE users.bonus_points
(
    ubpo_id INT IDENTITY(1,1),
    ubpo_user_id INT,
    ubpo_total_points SMALLINT,
    ubpo_bonus_type NCHAR (1),
    ubpo_created_on DATETIME,
    CONSTRAINT pk_ubpo_id PRIMARY KEY(ubpo_id),
    CONSTRAINT fk_ubpo_user_id FOREIGN KEY (ubpo_user_id) REFERENCES users.users (user_id) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE users.user_password
(
    uspa_user_id INT IDENTITY(1,1),
    uspa_passwordHash VARCHAR (128),
    uspa_passwordSalt VARCHAR (10),
    CONSTRAINT pk_uspa_user_id PRIMARY KEY(uspa_user_id),
    CONSTRAINT fk_uspa_user_id FOREIGN KEY (uspa_user_id) REFERENCES users.users (user_id)
);

--MODULE HOTELS --

-- Create a new table called 'hotels' in schema 'Hotel'
-- Drop the table if it already exists
IF OBJECT_ID('Hotel.hotels', 'U') IS NOT NULL DROP TABLE Hotel.hotels
-- Create the table in the specified schema
CREATE TABLE Hotel.hotels
(
    hotel_id INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_hotel_id PRIMARY KEY,
    -- primary key column
    hotel_name NVARCHAR(85) NOT NULL,
    hotel_description NVARCHAR(500) NULL,
    hotel_rating_star SMALLINT NULL,
    hotel_phonenumber NVARCHAR(25) NOT NULL,
    hotel_modified_date DATETIME NULL,
    -- Primary Key
    hotel_addr_id INT NOT NULL,
    -- Add this later, on production
    CONSTRAINT fk_hotel_addr_id FOREIGN KEY (hotel_addr_id) REFERENCES Master.address(addr_id)
);

-- Create a new table called 'hotel_reviews' in schema 'Hotel'
-- Drop the table if it already exists
IF OBJECT_ID('Hotel.hotel_reviews', 'U') IS NOT NULL DROP TABLE Hotel.hotel_reviews
-- Create the table in the specified schema
CREATE TABLE Hotel.hotel_reviews
(
    hore_id INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_hore_id PRIMARY KEY,
    -- primary key column
    hore_user_review NVARCHAR(125) NOT NULL,
    hore_rating BIT NOT NULL CHECK(hore_rating IN(1, 2, 3, 4, 5)) DEFAULT 5,
    hore_created_on DATETIME NULL,
    -- FOREIGN KEY
    hore_user_id INT NOT NULL,
    hore_hotel_id INT NOT NULL,
    -- Add this later, on production
    CONSTRAINT pk_hore_user_id FOREIGN KEY (hore_user_id) REFERENCES Users.users(user_id),
    CONSTRAINT fk_hore_hotel_id FOREIGN KEY (hore_hotel_id) REFERENCES Hotel.hotels(hotel_id) ON DELETE CASCADE ON
  UPDATE
    CASCADE
);

-- Create a new table called 'facilities' in schema 'Hotel'
-- Drop the table if it already exists
IF OBJECT_ID('Hotel.facilities', 'U') IS NOT NULL DROP TABLE Hotel.facilities
-- Create the table in the specified schema
CREATE TABLE Hotel.facilities
(
    faci_id INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_faci_id PRIMARY KEY,
    -- primary key column
    faci_description NVARCHAR(255) NULL,
    faci_max_number INT NULL,
    faci_measure_unit VARCHAR(15) NULL CHECK(faci_measure_unit IN('People', 'Beds')),
    faci_room_number NVARCHAR(6) NOT NULL,
    faci_startdate DATETIME NOT NULL,
    faci_endate DATETIME NOT NULL,
    faci_low_price MONEY NOT NULL,
    faci_high_price MONEY NOT NULL,
    faci_rate_price MONEY NOT NULL,
    faci_discount SMALLMONEY NULL,
    faci_tax_rate SMALLMONEY NULL,
    faci_modified_date DATETIME NULL,
    --FOREIGN KEY
    faci_cagro_id INTEGER NOT NULL,
    faci_hotel_id INT NOT NULL,
    -- UNIQUE ID
    CONSTRAINT uq_faci_room_number UNIQUE (faci_room_number),
    -- Add this later, on production
    CONSTRAINT fk_faci_cagro_id FOREIGN KEY (faci_cagro_id) REFERENCES Master.category_group(cagro_id) ON DELETE CASCADE ON
  UPDATE
    CASCADE,
    CONSTRAINT fk_faci_hotel_id FOREIGN KEY (faci_cagro_id) REFERENCES Hotel.hotels(hotel_id) ON DELETE CASCADE ON
  UPDATE
    CASCADE
);

-- Create a new table called 'facility_price_history' in schema 'Hotel'
-- Drop the table if it already exists
IF OBJECT_ID('Hotel.facility_price_history', 'U') IS NOT NULL DROP TABLE Hotel.facility_price_history
-- Create the table in the specified schema
CREATE TABLE Hotel.facility_price_history
(
    faph_id INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_faph_id PRIMARY KEY,
    -- primary key column
    faph_startdate DATETIME NOT NULL,
    faph_enddate DATETIME NOT NULL,
    faph_low_price MONEY NOT NULL,
    faph_high_price MONEY NOT NULL,
    faph_rate_price MONEY NOT NULL,
    faph_discount SMALLMONEY NOT NULL,
    faph_tax_rate SMALLMONEY NOT NULL,
    faph_modified_date DATETIME,
    -- FOREIGN KEY
    faph_faci_id INT NOT NULL,
    faph_user_id INT NOT NULL,
    -- Add this later, on production
    CONSTRAINT fk_faph_faci_id FOREIGN KEY (faph_faci_id) REFERENCES Hotel.facilities(faci_id) ON DELETE CASCADE ON
  UPDATE
    CASCADE,
    CONSTRAINT fk_faph_user_id FOREIGN KEY (faph_user_id) REFERENCES Users.users(user_id) ON DELETE CASCADE ON
  UPDATE
    CASCADE
);

-- Create a new table called 'facility_photos' in schema 'Hotel'
-- Drop the table if it already exists
IF OBJECT_ID('Hotel.facility_photos', 'U') IS NOT NULL DROP TABLE Hotel.facility_photos
-- Create the table in the specified schema
CREATE TABLE Hotel.facility_photos
(
    fapho_id INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_fapho_id PRIMARY KEY,
    -- primary key column
    fapho_thumbnail_filename NVARCHAR(50) NULL,
    fapho_photo_filename NVARCHAR(50) NULL,
    fapho_primary BIT NULL CHECK(fapho_primary IN(0, 1)),
    fapho_url NVARCHAR(255) NULL,
    fapho_modified_date DATETIME,
    -- FOREIGN KEY
    fapho_faci_id INT NOT NULL,
    CONSTRAINT pk_fapho_faci_id FOREIGN KEY (fapho_faci_id) REFERENCES Hotel.facilities(faci_id) 
    ON DELETE CASCADE ON UPDATE CASCADE
)

-- MODULE HR --
-- create table
create table hr.job_role
(
    joro_id int identity(1, 1) not null,
    joro_name nvarchar(55) not null,
    joro_modified_date datetime,
    CONSTRAINT pk_joro_id PRIMARY KEY(joro_id),
    CONSTRAINT uq_joro_name UNIQUE (joro_name)
);

create table hr.department
(
    dept_id int identity (1,1) not null,
    dept_name nvarchar(50) not null,
    dept_modified_date datetime,
    constraint pk_dept_id primary key (dept_id)
);

create table hr.employee
(
    emp_id int identity(1,1) not null,
    emp_national_id nvarchar(25) not null,
    emp_birth_date datetime not null,
    emp_marital_status nchar(1) not null,
    emp_gender nchar(1) not null,
    emp_hire_date datetime not null,
    emp_salaried_flag nchar(1) not null,
    emp_vacation_hours int,
    emp_sickleave_hourse int,
    emp_current_flag int,
    emp_emp_id int,
    emp_photo nvarchar(255),
    emp_modified_date datetime,
    emp_joro_id int not null,
    constraint pk_emp_id primary key (emp_id),
    constraint uq_emp_national_id unique (emp_national_id),
    constraint fk_emp_joro_id foreign key (emp_joro_id) references hr.job_role(joro_id),
    constraint fk_emp_id foreign key (emp_emp_id) references hr.employee(emp_id)
);

create table hr.employee_pay_history
(
    ephi_emp_id int not null,
    ephi_rate_change_date datetime not null,
    ephi_rate_salary money,
    ephi_pay_frequence int,
    ephi_modified_date datetime,
    constraint pk_ephi_emp_id_ephi_rate_change_date primary key(ephi_emp_id, ephi_rate_change_date),
    constraint fk_ephi_emp_id foreign key(ephi_emp_id) references hr.employee(emp_id)
);

create table hr.shift
(
    shift_id int identity(1,1),
    shift_name nvarchar(25) not null,
    shift_start_time datetime not null,
    shift_end_time datetime not null,
    constraint pk_shift_id primary key(shift_id),
    constraint uq_shift_name unique (shift_name),
    constraint uq_shift_start_time unique (shift_start_time),
    constraint uq_shift_end_time unique (shift_end_time)
);

create table hr.employee_department_history
(
    edhi_id int identity(1,1) not null,
    edhi_emp_id int not null,
    edhi_start_date datetime,
    edhi_end_date datetime,
    edhi_modified_date datetime,
    edhi_dept_id int not null,
    edhi_shift_id int not null,
    constraint pk_edhi_id_edhi_emp_id primary key (edhi_id, edhi_emp_id),
    constraint fk_edhi_emp_id foreign key(edhi_emp_id) references hr.employee(emp_id),
    constraint fk_shift_id foreign key (edhi_shift_id) references hr.shift(shift_id),
    constraint fk_edhi_dept_id foreign key (edhi_dept_id) references hr.department(dept_id)
);
-- this table can't create after users.users
create table hr.work_orders
(
    woro_id int identity(1,1),
    woro_date datetime not null,
    woro_status nvarchar(15),
    woro_user_id int,
    constraint pk_woro_id primary key(woro_id),
    constraint fk_woro_user_id foreign key(woro_user_id) references users.users(user_id)
    -- comment alter
);

-- this table can't create after hotel.facilites, master.service_task, and hr.work_orders
create table hr.work_order_detail
(
    wode_id int identity(1,1),
    wode_task_menu nvarchar(255),
    wode_status nvarchar(15),
    wode_start_date datetime,
    wode_end_date datetime,
    wode_notes nvarchar(255),
    wode_emp_id int,
    wode_seta_id int,
    wode_faci_id int,
    wode_woro_id int,
    constraint pk_wode_id primary key(wode_id),
    constraint fk_woro_wode_id foreign key(wode_woro_id) references hr.work_orders(woro_id),
    constraint fk_wode_emp_id foreign key(wode_emp_id) references hr.employee(emp_id),
    -- comment alter
    constraint fk_wode_seta_id foreign key(wode_seta_id) references master.service_task(seta_id),
    -- comment alter
    constraint fk_faci_id foreign key(wode_faci_id) references hotel.facilities(faci_id)-- comment alter
);


-- MODULE BOOKING --
CREATE TABLE Booking.special_offers
(
    spof_id INT IDENTITY(1,1) NOT NULL,
    spof_name NVARCHAR(55) NOT NULL,
    spof_description NVARCHAR(255) NOT NULL,
    spof_type NCHAR(5) NOT NULL CHECK (spof_type in ('T','C','I')),
    spof_discount SMALLMONEY NOT NULL,
    spof_start_date DATETIME NOT NULL,
    spof_end_date DATETIME NOT NULL,
    spof_min_qty INT,
    spof_max_qty INT,
    spof_modified_date DATETIME
        constraint pk_spof_id PRIMARY KEY(spof_id)
)
create table Booking.booking_order
(
    boor_id INT IDENTITY (1,1),
    boor_order_number nvarchar(20) NOT NULL,
    boor_order_date DATETIME NOT NULL,
    boor_arrival_date DATETIME,
    boor_total_room SMALLINT,
    boor_total_guest SMALLINT,
    boor_discount SMALLMONEY,
    boor_total_tax SMALLMONEY,
    boor_total_ammount MONEY,
    boor_down_payment MONEY,
    boor_pay_type NCHAR(2) NOT NULL check (boor_pay_type in ('CR','C','D ','PG')),
    boor_is_paid NCHAR(2) NOT NULL check (boor_is_paid in ('DP','P','R ')),
    boor_type NVARCHAR(15) NOT NULL check (boor_type in ('T','C','I')),
    boor_cardnumber NVARCHAR(25),
    boor_member_type NVARCHAR(15),
    boor_status NVARCHAR(15) check (boor_status in ('BOOKING','CHECKIN','CHECKOUT','CLEANING','CANCELED')),
    boor_user_id INT,
    boor_hotel_id INT
        CONSTRAINT pk_boor_id PRIMARY KEY (boor_id),
    CONSTRAINT unique_boor_order_number UNIQUE (boor_order_number),
    CONSTRAINT fk_boor_user_id FOREIGN KEY (boor_user_id) REFERENCES Users.users (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_boor_hotel_id FOREIGN KEY (boor_hotel_id) REFERENCES Hotel.hotels (hotel_id) ON DELETE CASCADE ON UPDATE CASCADE

)

CREATE TABLE Booking.booking_order_detail
(
    borde_boor_id INTEGER,
    borde_id Int IDENTITY (1,1) UNIQUE NOT NULL,
    borde_checkin DATETIME NOT NULL,
    borde_checkout DATETIME NOT NULL,
    borde_adults INTEGER,
    borde_kids INTEGER,
    borde_price MONEY,
    borde_extra MONEY,
    borde_discount SMALLMONEY,
    borde_tax SMALLMONEY,
    borde_subtotal MONEY,
    borde_faci_id INTEGER,
    CONSTRAINT pk_borde_id_boor_id PRIMARY KEY (borde_id, borde_boor_id),
    CONSTRAINT fk_border_boor_id FOREIGN KEY(borde_boor_id)
		REFERENCES Booking.booking_order(boor_id),
    -- 	ON DELETE CASCADE ON UPDATE CASCADE - REMINDER FOR MAKE TRIGGER
    CONSTRAINT fk_borde_faci_id FOREIGN KEY(borde_faci_id) 
		REFERENCES Hotel.facilities(faci_id) 
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Booking.booking_order_detail_extra
(
    boex_id Int IDENTITY (1,1),
    boex_price MONEY,
    boex_qty SMALLINT,
    boex_subtotal MONEY,
    boex_measure_unit NVARCHAR (50),
    check(boex_measure_unit in ('people','unit','kg')),
    boex_borde_id int,
    boex_prit_id int
        CONSTRAINT pk_boex_id PRIMARY KEY (boex_id),
    CONSTRAINT fk_boex_borde_id FOREIGN KEY (boex_borde_id) 
		REFERENCES Booking.booking_order_detail (borde_id) 
		ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_boex_prit_id FOREIGN KEY (boex_prit_id) 
		REFERENCES Master.price_item(prit_id) 
		ON DELETE CASCADE ON UPDATE CASCADE
)


CREATE TABLE Booking.special_offer_coupons
(
    soco_id INT IDENTITY(1,1),
    soco_borde_id INT,
    soco_spof_id INT,
    CONSTRAINT pk_soco_id PRIMARY KEY(soco_id),
    CONSTRAINT fk_soco_borde_id FOREIGN KEY(soco_borde_id) 
		REFERENCES Booking.booking_order_detail(borde_id) 
		on DELETE CASCADE on UPDATE CASCADE,
    CONSTRAINT fk_soco_spof_id FOREIGN KEY(soco_spof_id) 
		REFERENCES Booking.special_offers(spof_id) 
		on DELETE CASCADE on UPDATE CASCADE
)

create table Booking.user_breakfast
(
    usbr_borde_id INT,
    usbr_modified_date DATETIME,
    usbr_total_vacant SMALLINT NOT NULL,
    CONSTRAINT pk_usbr_borde_id_usbr_modified_date PRIMARY KEY(usbr_borde_id,usbr_modified_date),
    CONSTRAINT fk_usbr_borde_id FOREIGN KEY(usbr_borde_id) 
		REFERENCES Booking.booking_order_detail(borde_id) 
		ON DELETE CASCADE ON UPDATE CASCADE
)

-- MODULE RESTO --

CREATE TABLE resto.resto_menus
(
    reme_faci_id INT,
    reme_id INT IDENTITY(1,1),
    reme_name NVARCHAR(55) NOT NULL,
    reme_description NVARCHAR(255),
    reme_price MONEY NOT NULL,
    reme_status NVARCHAR(15) NOT NULL CHECK (reme_status IN ('Available', 'Empty')),
    reme_modified_date DATETIME,
    CONSTRAINT pk_reme_faci_id PRIMARY KEY (reme_id),
    CONSTRAINT reme_faci_id FOREIGN KEY (reme_faci_id) REFERENCES Hotel.facilities(faci_id) ON DELETE CASCADE ON UPDATE CASCADE

);


CREATE TABLE resto.order_menus
(
    orme_id INT IDENTITY,
    orme_order_number NVARCHAR (20) NOT NULL,
    orme_order_date DATETIME NOT NULL,
    orme_total_item SMALLINT,
    orme_total_discount SMALLMONEY,
    orme_total_amount MONEY,
    orme_pay_type NCHAR(2) NOT NULL,
    orme_cardnumber NVARCHAR(25),
    orme_is_paid CHAR(1) CHECK(orme_is_paid IN('P', 'B')),
    orme_modified_date DATETIME,
    orme_user_id INTEGER,
    CONSTRAINT pk_orme_id PRIMARY KEY (orme_id),
    CONSTRAINT fk_orme_user_id FOREIGN KEY (orme_user_id) REFERENCES users.users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_orme_cardnumber CHECK(
        (orme_pay_type = 'CR' OR orme_pay_type = 'D') AND orme_cardnumber IS NOT NULL
        OR
        orme_pay_type NOT IN('CR', 'D') AND orme_cardnumber IS NULL
    )
);


CREATE TABLE resto.order_menu_detail
(
    omde_id INT IDENTITY,
    orme_price MONEY NOT NULL,
    orme_qty SMALLINT NOT NULL,
    orme_subtotal MONEY NOT NULL,
    orme_discount SMALLMONEY,
    omde_orme_id INTEGER,
    omde_reme_id INTEGER,
    CONSTRAINT pk_omme_id PRIMARY KEY (omde_id),
    CONSTRAINT fk_omde_orme_id FOREIGN KEY (omde_orme_id) REFERENCES resto.order_menus(orme_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_omde_reme_id FOREIGN KEY (omde_reme_id) REFERENCES resto.resto_menus(reme_id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE resto.resto_menu_photos
(
    remp_id INT IDENTITY,
    remp_thumbnial_filname NVARCHAR (50),
    remp_photo_filename NVARCHAR (50),
    remp_primary BIT,
    remp_url NVARCHAR (255),
    remp_reme_id INT,
    CONSTRAINT pk_remp_id PRIMARY KEY (remp_id),
    CONSTRAINT fk_remp_reme_id FOREIGN KEY (remp_reme_id) REFERENCES resto.resto_menus(reme_id)
);

