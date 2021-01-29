-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employee" (
    "employee_id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "age" INT   NOT NULL,
    "address" VARCHAR(255)   NOT NULL,
    "zip_code" INT   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "employee_id"
     )
);

CREATE TABLE "Zipcode" (
    "zip_code" INT   NOT NULL,
    "city" VARECHAR(255)   NOT NULL,
    "state" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Zipcode" PRIMARY KEY (
        "zip_code"
     )
);

CREATE TABLE "Employee_Email" (
    "email_id" INT   NOT NULL,
    "employee_id" INT   NOT NULL,
    "email" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Employee_Email" PRIMARY KEY (
        "email_id"
     )
);

CREATE TABLE "Owners" (
    "owner_id" INT   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Owners" PRIMARY KEY (
        "owner_id"
     )
);

CREATE TABLE "Estates" (
    "estate_id" INT   NOT NULL,
    "owner_id" INT   NOT NULL,
    "estate_type" VARCHAR(255)   NOT NULL,
    "address" VARCHAR(255)   NOT NULL,
    "zip_code" INT   NOT NULL,
    CONSTRAINT "pk_Estates" PRIMARY KEY (
        "estate_id"
     )
);

CREATE TABLE "Estate_Type" (
    "estate_id" VARCHAR(255)   NOT NULL,
    "estate_type" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Estate_Type" PRIMARY KEY (
        "estate_id"
     )
);

CREATE TABLE "Agents" (
    "agent_id" INT   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Agents" PRIMARY KEY (
        "agent_id"
     )
);

CREATE TABLE "Regions" (
    "region_id" INT   NOT NULL,
    "region_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "region_id"
     )
);

CREATE TABLE "Agent_Regent_Junctions" (
    "agent_id" INT   NOT NULL,
    "region_id" INT   NOT NULL
);

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_zip_code" FOREIGN KEY("zip_code")
REFERENCES "Zipcode" ("zip_code");

ALTER TABLE "Employee_Email" ADD CONSTRAINT "fk_Employee_Email_employee_id" FOREIGN KEY("employee_id")
REFERENCES "Employee" ("employee_id");

ALTER TABLE "Estates" ADD CONSTRAINT "fk_Estates_owner_id" FOREIGN KEY("owner_id")
REFERENCES "Owners" ("owner_id");

ALTER TABLE "Estates" ADD CONSTRAINT "fk_Estates_estate_type" FOREIGN KEY("estate_type")
REFERENCES "Estate_Type" ("estate_id");

ALTER TABLE "Estates" ADD CONSTRAINT "fk_Estates_zip_code" FOREIGN KEY("zip_code")
REFERENCES "Zipcode" ("zip_code");

ALTER TABLE "Agent_Regent_Junctions" ADD CONSTRAINT "fk_Agent_Regent_Junctions_agent_id" FOREIGN KEY("agent_id")
REFERENCES "Agents" ("agent_id");

ALTER TABLE "Agent_Regent_Junctions" ADD CONSTRAINT "fk_Agent_Regent_Junctions_region_id" FOREIGN KEY("region_id")
REFERENCES "Regions" ("region_id");

