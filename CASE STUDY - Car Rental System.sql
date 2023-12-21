
-- CASE STUDY - Car Rental System

CREATE TABLE Vehicle (
vehicleID INT PRIMARY KEY,
make VARCHAR(50) ,
model VARCHAR(50),
year INT,
dailyRate DECIMAL(5, 2),
status INT CHECK (status IN (0, 1)),
passengerCapacity INT,
engineCapacity INT
);

CREATE TABLE Customer (
customerID INT PRIMARY KEY IDENTITY(1,1),
firstName VARCHAR(50) ,
lastName VARCHAR(50),
email VARCHAR(50),
phoneNumber CHAR(12)
);

CREATE TABLE Lease (
leaseID INT PRIMARY KEY,
vehicleID INT,
customerID INT,
startDate DATE,
endDate DATE,
type VARCHAR(50),
FOREIGN KEY (vehicleID) REFERENCES Vehicle(vehicleID) ON DELETE CASCADE,
FOREIGN KEY (customerID) REFERENCES Customer(customerID) ON DELETE CASCADE
);

CREATE TABLE Payment (
paymentID INT PRIMARY KEY IDENTITY(1,1),
leaseID INT,
paymentDate DATE,
amount DECIMAL(6, 2),
FOREIGN KEY (leaseID) REFERENCES Lease(leaseID) ON DELETE CASCADE
);

INSERT INTO Vehicle (vehicleID, make, model, year, dailyRate, status, passengerCapacity, engineCapacity)
VALUES
    (1, 'Toyota', 'Camry', 2022, 50.00, 1, 4, 1450),
    (2, 'Honda', 'Civic', 2023, 45.00, 1, 7, 1500);

INSERT INTO Customer (firstName, lastName, email, phoneNumber)
VALUES
    ('Srinu', 'Singh', 'Srinu@Singh.com', '918242398712'),
    ('Suresh', 'Rathod', 'Suresh@Rathod.com', '123456789012');

INSERT INTO Lease (leaseID, vehicleID, customerID, startDate, endDate, type)
VALUES
    (1, 1, 1, '2023-01-01', '2023-01-05', 'Daily'),
    (2, 2, 2, '2023-02-15', '2023-02-28', 'Monthly');
    
INSERT INTO Payment (leaseID, paymentDate, amount)
VALUES
    (1, '2023-01-03', 200.00),
    (2, '2023-02-20', 1000.00);

