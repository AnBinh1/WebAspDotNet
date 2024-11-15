Create database WebASPDotNet
use WebASPDotNet


CREATE TABLE tblAccount(
	AccountId INT PRIMARY KEY IDENTITY(1,1),
	Username nvarchar(50) NULL,
	Password nvarchar(50) NULL,
	FullName nvarchar(50) NULL,
	Phone nvarchar(50) NULL,
	Email nvarchar(50) NULL,
	RoleId int NULL,
	LastLogin nchar(10) NULL,
	IsActive bit NOT NULL,
	FOREIGN KEY (RoleId) REFERENCES tblRole(RoleId)
)
CREATE TABLE tblRole(
	RoleId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	RoleName nvarchar(50) NULL,
	Description nvarchar(50) NULL,
)
CREATE TABLE tblCategory (
    CategoryId INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500) NULL,
	CreatedDate datetime NULL,
	CreatedBy nvarchar(150) NULL,
	ModifiedDate datetime NULL,
	ModifiedBy nvarchar(150) NULL,
);
CREATE TABLE tblCustomer(
	CustomerId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Username nvarchar(50) NULL,
	Password nvarchar(50) NULL,
	Birthday datetime NULL,
	Avatar nvarchar(50) NULL,
	Phone nvarchar(50) NULL,
	Email nvarchar(50) NULL,
	LocationId int NULL,
	LastLogin datetime NULL,
	IsActive bit NOT NULL,
);
CREATE TABLE tblProduct (
    ProductId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX),
    Price DECIMAL(18, 2) NOT NULL,
    CategoryId INT,
    Stock INT NULL,
    ImageUrl NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CategoryId) REFERENCES tblCategory(CategoryId)
);

CREATE TABLE tblOrder(
	OrderId INT PRIMARY KEY IDENTITY(1,1),
	Code nchar(10) NULL,
	CustomerName nvarchar(150) NULL,
	Phone nvarchar(15) NULL,
	Address nvarchar(250) NULL,
	TotalAmount int NULL,
	Quanlity int NULL,
	OrderStatusId int NULL,
);
CREATE TABLE tblOrderDetail (
    OrderDetailId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT,
    ProductId INT,
    Quantity INT NOT NULL,
    Price DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES tblOrder(OrderId),
    FOREIGN KEY (ProductId) REFERENCES tblProduct(ProductId)
);
CREATE TABLE tblMenu(
	MenuId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Title nvarchar(150) NULL,
	Alias nvarchar(150) NULL,
	Description nvarchar(500) NULL,
	Levels int NULL,
	ParentId int NULL,
	Position int NULL,
	IsActive bit NOT NULL,
);
CREATE TABLE tblBlog(
	BlogId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Title nvarchar(250) NULL,
	Alias nvarchar(250) NULL,
	CategoryId int NULL,
	Description nvarchar(max) NULL,
	Detail nvarchar(max) NULL,
	Image nvarchar(500) NULL,
	AccountId int NULL,
	IsActive bit NOT NULL,
	FOREIGN KEY (CategoryId) REFERENCES tblCategory(CategoryId)
);
CREATE TABLE tblBlogComment(
	CommentId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name nvarchar(50) NULL,
	Phone nvarchar(50) NULL,
	Email nvarchar(50) NULL,
	CreatedDate datetime NULL,
	Detail nvarchar(200) NULL,
	BlogId int NULL,
	IsActive bit NOT NULL,
	FOREIGN KEY (BlogId) REFERENCES tblBlog(BlogId)
);
CREATE TABLE tblContact(
	ContactId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name nvarchar(150) NULL,
	Phone nvarchar(50) NULL,
	Email nvarchar(150) NULL,
	Message nvarchar(max) NULL,
	IsRead bit NULL,
);
CREATE TABLE tblProductReview (
    ReviewId INT PRIMARY KEY IDENTITY(1,1),
    ProductId INT,
    AccountId INT,
    star INT CHECK (star >= 1 AND star <= 5),
    Comment NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductId) REFERENCES tblProduct(ProductId),
    FOREIGN KEY (AccountId) REFERENCES tblAccount(AccountId)
);
