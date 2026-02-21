CREATE TABLE "billings" (
	"id" serial PRIMARY KEY NOT NULL,
	"billing_no" text NOT NULL,
	"invoice_no" text,
	"date" date NOT NULL
);
--> statement-breakpoint
CREATE TABLE "destinations" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"tin" text NOT NULL,
	"address" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "employees" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"age" integer,
	"address" text NOT NULL,
	"image_url" text
);
--> statement-breakpoint
CREATE TABLE "trip_types" (
	"id" serial PRIMARY KEY NOT NULL,
	"type" text NOT NULL,
	CONSTRAINT "trip_types_type_unique" UNIQUE("type")
);
--> statement-breakpoint
CREATE TABLE "trips" (
	"id" serial PRIMARY KEY NOT NULL,
	"type_id" integer NOT NULL,
	"billing_id" integer NOT NULL,
	"employee_id" integer NOT NULL,
	"truck_id" integer NOT NULL,
	"origin" text NOT NULL,
	"destination_id" integer NOT NULL,
	"date" date NOT NULL,
	"order_no" text NOT NULL,
	"quantity" integer NOT NULL,
	"weight" numeric NOT NULL,
	"quarantine" numeric,
	"rate" numeric
);
--> statement-breakpoint
CREATE TABLE "trucks" (
	"id" serial PRIMARY KEY NOT NULL,
	"plate_no" text NOT NULL,
	"description" text NOT NULL
);
--> statement-breakpoint
ALTER TABLE "trips" ADD CONSTRAINT "trips_type_id_trip_types_id_fk" FOREIGN KEY ("type_id") REFERENCES "public"."trip_types"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "trips" ADD CONSTRAINT "trips_billing_id_billings_id_fk" FOREIGN KEY ("billing_id") REFERENCES "public"."billings"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "trips" ADD CONSTRAINT "trips_employee_id_employees_id_fk" FOREIGN KEY ("employee_id") REFERENCES "public"."employees"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "trips" ADD CONSTRAINT "trips_truck_id_trucks_id_fk" FOREIGN KEY ("truck_id") REFERENCES "public"."trucks"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "trips" ADD CONSTRAINT "trips_destination_id_destinations_id_fk" FOREIGN KEY ("destination_id") REFERENCES "public"."destinations"("id") ON DELETE no action ON UPDATE no action;