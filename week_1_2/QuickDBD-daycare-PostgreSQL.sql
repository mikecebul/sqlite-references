-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hlfijZ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Child" (
    "ChildID" int   NOT NULL,
    "ChildFName" text(20)   NOT NULL,
    "ChildLName" text(30)   NOT NULL,
    "Age" int   NOT NULL,
    "Birthdate" text(10)   NOT NULL,
    "DropOffTime" text(7)   NOT NULL,
    "PickUpTime" text(7)   NOT NULL,
    CONSTRAINT "pk_Child" PRIMARY KEY (
        "ChildID"
     )
);

CREATE TABLE "Parent" (
    "ParentID" int   NOT NULL,
    "ChildID" int   NOT NULL,
    "ParentFName" text(20)   NOT NULL,
    "ParentLName" text(30)   NOT NULL,
    "ParentState" text(20)   NOT NULL,
    "ParentCity" text(20)   NOT NULL,
    "ParentAddress" text(20)   NOT NULL,
    "DriversLicenseNumber" text(20)   NOT NULL,
    CONSTRAINT "pk_Parent" PRIMARY KEY (
        "ParentID"
     )
);

CREATE TABLE "CoParent" (
    "CoParentID" int   NOT NULL,
    "ParentID" int   NOT NULL,
    "CoParentFName" text(20)   NOT NULL,
    "CoParentLName" text(30)   NOT NULL,
    "CoParentState" text(20)   NOT NULL,
    "CoParentCity" text(20)   NOT NULL,
    "CoParentAddress" text(20)   NOT NULL,
    "DriversLicenseNumber" text(20)   NOT NULL,
    CONSTRAINT "pk_CoParent" PRIMARY KEY (
        "CoParentID"
     )
);

CREATE TABLE "Vehicle" (
    "LicensePlateNumber" text(10)   NOT NULL,
    "ParentID" text(10)   NULL,
    "Make" text(20)   NOT NULL,
    "Model" text(20)   NOT NULL,
    "Color" text(20)   NOT NULL,
    CONSTRAINT "pk_Vehicle" PRIMARY KEY (
        "LicensePlateNumber"
     )
);

CREATE TABLE "StaffData" (
    "StaffID" int   NOT NULL,
    "ChildID" int   NOT NULL,
    "StaffFName" text(20)   NOT NULL,
    "StaffLName" text(30)   NOT NULL,
    CONSTRAINT "pk_StaffData" PRIMARY KEY (
        "StaffID"
     )
);

CREATE TABLE "StaffPay" (
    "StaffID" int   NOT NULL,
    "PayRate" int   NOT NULL,
    CONSTRAINT "pk_StaffPay" PRIMARY KEY (
        "StaffID"
     )
);

CREATE TABLE "Books" (
    "ISBN" int   NOT NULL,
    "ChildID" int   NOT NULL,
    "Title" text(20)   NOT NULL,
    "AuthorLName" text(30)   NOT NULL,
    CONSTRAINT "pk_Books" PRIMARY KEY (
        "ISBN"
     )
);

CREATE TABLE "Tech" (
    "SerialNumber" int   NOT NULL,
    "ChildID" int   NOT NULL,
    "Type" text(20)   NOT NULL,
    CONSTRAINT "pk_Tech" PRIMARY KEY (
        "SerialNumber"
     )
);

CREATE TABLE "Supplies" (
    "ChildID" int   NOT NULL,
    "pens" int   NOT NULL,
    "pencils" int   NOT NULL,
    "crayons" int   NOT NULL,
    CONSTRAINT "pk_Supplies" PRIMARY KEY (
        "ChildID"
     )
);

ALTER TABLE "Parent" ADD CONSTRAINT "fk_Parent_ChildID" FOREIGN KEY("ChildID")
REFERENCES "Child" ("ChildID");

ALTER TABLE "CoParent" ADD CONSTRAINT "fk_CoParent_ParentID" FOREIGN KEY("ParentID")
REFERENCES "Parent" ("ParentID");

ALTER TABLE "Vehicle" ADD CONSTRAINT "fk_Vehicle_ParentID" FOREIGN KEY("ParentID")
REFERENCES "Parent" ("ParentID");

ALTER TABLE "StaffData" ADD CONSTRAINT "fk_StaffData_ChildID" FOREIGN KEY("ChildID")
REFERENCES "Child" ("ChildID");

ALTER TABLE "StaffPay" ADD CONSTRAINT "fk_StaffPay_StaffID" FOREIGN KEY("StaffID")
REFERENCES "StaffData" ("StaffID");

ALTER TABLE "Books" ADD CONSTRAINT "fk_Books_ChildID" FOREIGN KEY("ChildID")
REFERENCES "Child" ("ChildID");

ALTER TABLE "Tech" ADD CONSTRAINT "fk_Tech_ChildID" FOREIGN KEY("ChildID")
REFERENCES "Child" ("ChildID");

ALTER TABLE "Supplies" ADD CONSTRAINT "fk_Supplies_ChildID" FOREIGN KEY("ChildID")
REFERENCES "Child" ("ChildID");

