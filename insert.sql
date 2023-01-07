--resto.resto_menus
INSERT INTO resto.resto_menus
    (reme_name, reme_description, reme_price, reme_status, reme_modified_date)
VALUES
    ('Nasi Goreng', 'Nasi goreng dengan bahan dasar nasi yang ditumis bersama telur dan sayuran', 15000, 'Available', GETDATE()),
    ('Soto Ayam', 'Soto ayam dengan kuah yang gurih dan daging ayam yang empuk', 20000, 'Available', GETDATE()),
    ('Gado-gado', 'Gado-gado dengan bahan dasar lontong dan sayuran-sayuran segar', 10000, 'Available', GETDATE()),
    ('Bakso', 'Bakso dengan daging sapi yang dipotong-potong dan dimasak dengan bumbu khusus', 15000, 'Available', GETDATE()),
    ('Ayam Goreng', 'Ayam goreng dengan tepung yang renyah dan daging ayam yang empuk', 25000, 'Available', GETDATE()),
    ('Sate Ayam', 'Sate ayam dengan bumbu kacang yang lezat', 20000, 'Available', GETDATE()),
    ('Nasi Kuning', 'Nasi kuning dengan bahan dasar nasi yang dicampur dengan telur dan kecap', 10000, 'Available', GETDATE()),
    ('Sop Buntut', 'Sop buntut dengan bahan dasar daging buntut yang empuk dan kuah yang gurih', 30000, 'Available', GETDATE()),
    ('Bubur Ayam', 'Bubur ayam dengan bahan dasar nasi yang dicampur dengan daging ayam dan sayuran', 10000, 'Available', GETDATE()),
    ('Mie Goreng', 'Mie goreng dengan bahan dasar mie yang ditumis bersama telur dan sayuran', 15000, 'Available', GETDATE()),
    ('Cap Cay', 'Cap cay dengan bahan dasar sayuran yang dicampur dengan daging sapi dan kuah kaldu', 20000, 'Available', GETDATE());

SELECT *
FROM resto.resto_menus

--resto.order_menu
INSERT INTO resto.order_menus
    (orme_order_number, orme_order_date, orme_total_item, orme_total_discount, orme_total_amount, orme_pay_type, orme_cardnumber, orme_is_paid, orme_modified_date)
VALUES
    ('INV001', GETDATE(), 2, 0, 30000, 'C', NULL, 'P', GETDATE()),
    ('INV002', GETDATE(), 3, 5000, 45000, 'PG', NULL, 'P', GETDATE()),
    ('INV003', GETDATE(), 1, 0, 15000, 'CR', '4111-1111-1111-1111', 'P', GETDATE()),
    ('INV004', GETDATE(), 4, 10000, 60000, 'D', '5111-1111-1111-1111', 'P', GETDATE()),
    ('INV005', GETDATE(), 3, 8000, 42000, 'BO', NULL, 'P', GETDATE()),
    ('INV006', GETDATE(), 2, 4000, 30000, 'C', NULL, 'P', GETDATE()),
    ('INV007', GETDATE(), 1, 0, 15000, 'CR', '4111-1111-1111-1111', 'P', GETDATE()),
    ('INV008', GETDATE(), 3, 9000, 45000, 'PG', NULL, 'P', GETDATE()),
    ('INV009', GETDATE(), 2, 2000, 30000, 'D', '5111-1111-1111-1111', 'P', GETDATE());

SELECT *
FROM resto.order_menu_detail;

--resto order menu detail

INSERT INTO resto.order_menu_detail
    (orme_price, orme_qty, orme_subtotal, orme_discount)
VALUES
    (15000, 2, 30000, 0),
    (20000, 1, 20000, 0),
    (25000, 2, 50000, 0),
    (15000, 3, 45000, 0),
    (20000, 2, 40000, 0),
    (25000, 1, 25000, 0),
    (15000, 1, 15000, 0),
    (20000, 2, 40000, 0),
    (25000, 3, 75000, 0),
    (20000, 1, 20000, 0);


--resto photos

INSERT INTO resto.resto_menu_photos
    (remp_thumbnial_filname, remp_photo_filename, remp_primary, remp_url)
VALUES
    ('mie-ayam.jpg', 'mie-ayam-large.jpg', 1, 'https://www.example.com/mie-ayam.jpg'),
    ('nasi-goreng.jpg', 'nasi-goreng-large.jpg', 1, 'https://www.example.com/nasi-goreng.jpg'),
    ('soto-ayam.jpg', 'soto-ayam-large.jpg', 1, 'https://www.example.com/soto-ayam.jpg'),
    ('ayam-goreng.jpg', 'ayam-goreng-large.jpg', 0, 'https://www.example.com/ayam-goreng.jpg'),
    ('sate-ayam.jpg', 'sate-ayam-large.jpg', 0, 'https://www.example.com/sate-ayam.jpg'),
    ('kare-ayam.jpg', 'kare-ayam-large.jpg', 0, 'https://www.example.com/kare-ayam.jpg'),
    ('sushi.jpg', 'sushi-large.jpg', 1, 'https://www.example.com/sushi.jpg'),
    ('udon.jpg', 'udon-large.jpg', 0, 'https://www.example.com/udon.jpg'),
    ('ramen.jpg', 'ramen-large.jpg', 0, 'https://www.example.com/ramen.jpg'),
    ('gyudon.jpg', 'gyudon-large.jpg', 1, 'https://www.example.com/gyudon.jpg');


SET IDENTITY_INSERT Users.users ON
INSERT INTO Users.users
    (user_id, user_full_name, user_type, user_company_name, user_email, user_phone_number, user_modified_date)
VALUES
    (1, 'John Doe', 'I', 'Doe Industries', 'john.doe@gmail.com', '555-555-1212', '2022-01-01'),
    (2, 'Jane Smith', 'C', 'Smith Enterprises', 'jane.smith@acme.com', '555-555-1213', '2022-01-02'),
    (3, 'Bob Johnson', 'T', 'Johnson Travel', 'bob.johnson@travelagency.com', '555-555-1214', '2022-01-03'),
    (4, 'Alice Williams', 'I', 'Williams Consulting', 'alice.williams@gmail.com', '555-555-1215', '2022-01-04'),
    (5, 'Mike Brown', 'C', 'Brown & Associates', 'mike.brown@acme.com', '555-555-1216', '2022-01-05'),
    (6, 'Sara Davis', 'T', 'Davis Travel Agency', 'sara.davis@travelagency.com', '555-555-1217', '2022-01-06'),
    (7, 'Jason Thompson', 'I', 'Thompson Solutions', 'jason.thompson@gmail.com', '555-555-1218', '2022-01-07'),
    (8, 'Emily Johnson', 'C', 'Johnson Corp', 'emily.johnson@acme.com', '555-555-1219', '2022-01-08'),
    (9, 'William Smith', 'T', 'Smith Travel Co.', 'william.smith@travelagency.com', '555-555-1220', '2022-01-09'),
    (10, 'Ashley Williams', 'I', 'Williams & Co.', 'ashley.williams@gmail.com', '555-555-1221', '2022-01-10'),
    (11, 'David Brown', 'C', 'Brown Industries', 'david.brown@acme.com', '555-555-1222', '2022-01-11'),
    (12, 'Jessica Davis', 'T', 'Davis Travel', 'jessica.davis@travelagency.com', '555-555-1223', '2022-01-12'),
    (13, 'James Thompson', 'I', 'Thompson Consultants', 'james.thompson@gmail.com', '555-555-1224', '2022-01-13'),
    (14, 'Sarah Johnson', 'C', 'Johnson & Associates', 'sarah.johnson@acme.com', '555-555-1225', '2022-01-14'),
    (15, 'Michael Smith', 'T', 'Smith Travel Group', 'michael.smith@travelagency.com', '555-555-1226', '2022-01-15'),
    (16, 'Jessica Williams', 'I', 'Williams & Partners', 'jessica.williams@gmail.com', '555-555-1227', '2022-01-16'),
    (17, 'Robert Brown', 'C', 'Brown Inc.', 'robert.brown@acme.com', '555-555-1228', '2022-01-17'),
    (18, 'Emily Davis', 'T', 'Davis Travel Co.', 'emily.davis@travelagency.com', '555-555-1229', '2022-01-18'),
    (19, 'Jason Thompson', 'I', 'Thompson Enterprises', 'jason.thompson@gmail.com', '555-555-1230', '2022-01-19'),
    (20, 'Sarah Johnson', 'C', 'Johnson & Co.', 'sarah.johnson@acme.com', '555-555-1231', '2022-01-20')
SET IDENTITY_INSERT Users.users OFF
SELECT *
FROM resto.order_menus
TRUNCATE TABLE resto.order_menu;




INSERT INTO resto.order_menus
    (orme_order_number, orme_order_date, orme_total_item, orme_total_discount, orme_total_amount, orme_pay_type, orme_cardnumber, orme_is_paid, orme_modified_date, orme_user_id)
VALUES
    ('OR100001', '2022-01-01', 3, 1000, 80000, 'CA', NULL, 'P', GETDATE(), 1),
    ('OR100002', '2022-01-02', 5, 2000, 125000, 'CR', '123456', 'P', GETDATE(), 2);