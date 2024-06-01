# StayEase: Simplified Hotel Booking Solution

## Links
- [YouTube Video](https://www.youtube.com/watch?v=lPtjPyWZ6ro)
- [Project Website](https://adt-stay-ease-web-app.vercel.app/)

## Purpose
The purpose of our project was to develop a user-friendly web application that helps travelers easily find and book hotels in India. The application utilizes a dataset from Kaggle of over 4,000 hotels extracted from the Goibibo travel website, providing detailed information on amenities, ratings, reviews, and pricing. The key objectives were to create a well-organized database system to store and manage the hotel data, build an interactive interface that allows users to search, filter, and compare hotels based on their preferences, and enable convenient hotel booking directly through the application. The web app also provides hotel managers with a dashboard to monitor and manage their properties listed on the StayEase platform by viewing the total bookings, room availabilities, and customer booking information.

## How the project is built
Flowchart Depicting Web Application Workflow -

![image](https://github.com/vatsalparikh07/ADT-StayEase/assets/65659649/d3059c79-c205-42c0-b4c3-1c843b3b0004)

### Front-end (React)
The front-end of the application is developed using ReactJS for building user interfaces. The front-end comprises several components, including:
1. Search Component: Allows users to search for hotels based on the property location, name, check-in/check-out dates, and other preferences.
2. Hotel List Component: Displays a list of hotels matching the search criteria.
3. Hotel Details Component: Provides information about a selected hotel, including amenities, ratings, reviews, and pricing.
4. Booking Component: Enables users to securely book their desired hotel rooms and complete the reservation process.
5. User Dashboard: Provides a personalized interface for users to manage their bookings and account information.
6. Hotel Manager Dashboard: Offers hotel managers a dedicated dashboard to monitor bookings, room availability, and customer information for their listed properties.

### Back-end (Node.js, Express.js, GraphQL, MongoDB)
- **Node.js and Express.js:**
  - Set up the server and API routes.
  - Implemented middleware for tasks such as retrieving data, processing incoming requests, and validating user identity.
  - Integrated with MongoDB using the official Node.js driver.
- **GraphQL:**
  - Defined the GraphQL schema and data models.
  - Set up functions for handling data fetching and manipulation.
  - Set up a GraphQL server for the front-end to make queries and mutations.
- **MongoDB:**
  - Stored and managed hotel data, bookings, and user information.
  - Performed CRUD operations using MongoDB's Node.js driver.
  - Utilized data aggregation for complex queries and filtering.

### Application Deployment (Vercel)
The application is deployed on Vercel, a cloud-based hosting platform that provides easy integration with GitHub repositories.

## Data
The "StayEase" application utilizes a dataset from Kaggle, containing information about 4,000 hotels in India. This dataset was originally extracted from Goibibo.com, a leading travel website in India. It comprises 37 columns and 4,000 rows, providing details about each hotel through columns such as city, hotel description, hotel facilities, hotel star rating, room count, room facilities, room type, price per night, etc.

Data preprocessing techniques were applied to clean the dataset using techniques such as:
1. Handling missing values.
2. Removing duplicates.
3. Standardizing data formats across columns.

Data normalization was employed to design an efficient database schema along with defining constraints and relationships. Specifically, entities such as Location, Property, Room, and Ratings were defined, and constraints like Primary Key, Foreign Key, Not Null, Check, Unique were implemented.


The preprocessed data was then modeled into MongoDB schemas. A MongoDB Cluster named hotel_booking_app was hosted, and subsequent collections were created:
1. Bookings: Contains data of hotel reservations made by users.
2. Hotels: Contains data of the hotels listed on the website.
3. Rooms: Contains data of the different room types for each hotel.
4. Users: Contains data of the user and admin profiles.

## Functionalities

1. **User Registration**
   - Allows new users to create an account on the "StayEase" platform.
   - Users provide personal information: name, username, email address, date of birth, and password.
   
   ![Registration Page](https://github.com/vatsalparikh07/ADT-StayEase/assets/65659649/55e2a28f-5c44-423f-8ccb-adffb0fa5483)

2. **Hotel Search**
   - Enables users to search for hotels based on location (city or area), check-in and check-out dates, and number of guests.
   
![image](https://github.com/vatsalparikh07/ADT-StayEase/assets/65659649/b2533c79-609b-4ce9-891b-c302eaaeb79a)

3. **Hotel Listing**
   - Displays a list of hotels that meet the user's search criteria.
   - Includes hotel name, location, star rating, pricing, room availability, and amenities overview.
   
![image](https://github.com/vatsalparikh07/ADT-StayEase/assets/65659649/9646aba4-73b0-4840-a0c0-a648447ad2a4)

4. **Hotel Description**
   - Provides detailed information about a specific hotel.
   - Includes hotel description, manager details, room types, pricing details, amenities, and room availabilities.
   
![image](https://github.com/vatsalparikh07/ADT-StayEase/assets/65659649/ab4f9755-0f3c-436f-90b5-9dd72e84317a)

5. **Hotel (Room) Booking**
   - Allows users to securely book their preferred room type and complete the reservation process.
   - Involves selecting the room type, entering guest details, and providing payment information.
   
![image](https://github.com/vatsalparikh07/ADT-StayEase/assets/65659649/afed7060-d298-4500-a30f-76ab7441c0e6)

6. **Hotel Booking Confirmation**
   - After successful booking, users receive confirmation including check-in and check-out dates, room type, total cost, etc.
   
![image](https://github.com/vatsalparikh07/ADT-StayEase/assets/65659649/fbbb7ef5-8988-4244-8b60-3a04a3dd4333)

7. **Login**
   - Allows existing users to access their account.
   - Users enter their registered email address (or username) and password.
   
![image](https://github.com/vatsalparikh07/ADT-StayEase/assets/65659649/210c9bd9-0413-46a9-b961-2a32c840e0dd)

8. **Admin Dashboard**
   - Interface for hotel managers or administrators to manage listed properties.
   - Functionalities include:
     - Managing and viewing bookings for properties.
     - Updating room availability and viewing today's bookings.
     - Managing property information such as descriptions, amenities, pricing, etc.
   
![image](https://github.com/vatsalparikh07/ADT-StayEase/assets/65659649/ae305df9-6b81-4a5a-a712-16462edfe1ca)
   
![image](https://github.com/vatsalparikh07/ADT-StayEase/assets/65659649/83fe1d7d-954d-45e7-aa3b-e5d6ab327bb3)
