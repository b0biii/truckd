import { pgTable, serial, text, varchar, date, integer, numeric } from "drizzle-orm/pg-core";

/*export const users = pgTable('users', {
    id: serial('id').primaryKey(),
    username: text('username').notNull(),

});*/

export const trip_types = pgTable('trip_types', {
    id: serial('id').primaryKey(),
    type: text('type').unique().notNull(),
});

export const billings = pgTable('billings', {
    id: serial('id').primaryKey(),
    billing_no: text('billing_no').notNull(),
    invoice_no: text('invoice_no'),
    date: date('date').notNull()
});

export const destinations = pgTable('destinations', {
    id: serial('id').primaryKey(),
    name: text('name').notNull(),
    tin: text('tin').notNull(),
    address: text('address').notNull()
});


export const trucks = pgTable('trucks', {
    id: serial('id').primaryKey(),
    plate_no: text('plate_no').notNull(),
    description: text('description').notNull(),
});

export const employees = pgTable('employees', {
    id: serial('id').primaryKey(),
    name: text('name').notNull(),
    age: integer('age'),
    address: text('address').notNull(),
    image_url: text('image_url')
});

export const trips = pgTable('trips', {
    id: serial('id').primaryKey(),
    type_id: integer('type_id').references(() => trip_types.id).notNull(),
    billing_id: integer('billing_id').references(() => billings.id).notNull(),
    employee_id: integer('employee_id').references(() => employees.id).notNull(),
    truck_id: integer('truck_id').references(() => trucks.id).notNull(),
    origin: text('origin').notNull(),
    destination_id: integer('destination_id').references(() => destinations.id).notNull(),
    date: date('date').notNull(),
    order_no: text('order_no').notNull(),
    quantity: integer('quantity').notNull(),
    weight: numeric('weight').notNull(),
    quarantine: numeric('quarantine'),
    rate: numeric('rate'),
});