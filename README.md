# Trailview

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Trailview will allow users to fetch location-based data
about trails in their area based on their preferences.  
They can also share their experiences by commenting, uploading
pictures, etc.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Social, Outdoor, Forum
- **Mobile:** Uses location services, camera
- **Story:** Allows users to explore trails in their area
                and share their experiences
- **Market:** Anyone who loves the outdoors and wants to find new
                places to hike, share their experiences, and connect with
                other users will enjoy this app
- **Habit:** Users can add reviews and comments to trails they have visited.
                They are rewareded with experience points for reviewing trails
                or checking in at trails they are visiting.
- **Scope:** The current goal for this app is a useful but lean feature set which
                can be expanded upon in the future.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

[x] User can create an account.
[x] User can log in.
[x] User can view their location on a map.
[ ] User can search for trails in their area
[ ] User can add comments and media to comment section for each trail
[x] User has a profile with basic info
[ ] User has a trail "wishlist"

**Optional Nice-to-have Stories**

* User can search for other users
* Users can check in to trail locations
* User with most checkins at a given location becomes "trailguide"
* Users have an experience score based on total number of checkins
* Dark Mode
* Animations

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/trailview/Trailview/blob/main/Trailview-11-16-2021.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

### 2. Screen Archetypes

* Login
   * User can log in or sign up
* Stream
   * List of trails based on user defined location
   * User can view trails on a map
* Detail
   * User can view details about individual trails, such as:
   * Comments
   * Pictures
   * Local Weather
* Creation
   * User can comment on trails
   * User can upload pictures of trails
* Profile
   * Users have profile pictures
   * User can change display name
   * Users have an experience ranking
   * Users have a "wishlist" of trails they would like to visit
   * Imperial / Metric measurements
   * User can view their own reviews, pictures, experience ranking

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Main Tab (search / map)
* User Profile Tab


**Flow Navigation** (Screen to Screen)

* Login screen
   * Username Field
   * Password Field
* Main screen
   * User Profile Tab
   * Main/Map Tab

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://i.imgur.com/6GGTHxS.png" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema
### Models
#### User

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | id            | String   | unique id for the user (default field) |
   | name          | String   | user name for login purposes|
   | password      | String   | user's password for login purposes|
   | profileImage  | File     | user profile image|
   | displayName   | String   | user's display name |
   | favorites     | Array    | array of id's of favorite trails |
   
#### Trail

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | id            | String   | Trail ID |
   | name          | String   | Name of Trail |
   | state         | String   | State where trail is located |
   | country       | String   | Country where country is located |
   | latitude      | String   | Latitude of Trail |
   | longitude     | String   | Longitude of Trail |
   | description   | String   | Description of Trail |
   | trailImage    | File     | Image of Trail |
   | activityTypes | Array    | Activities available at this trail |
   | difficulty    | Number   | difficulty rating |  
   
      
#### Review

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | id            | String   | unique id for this review |
   | text          | String   | text for this review |
   | author        | PFObject | pointer to user object |

   
### Networking
#### List of network requests by screen
   - Trail List View
      - (Read/GET) Populate list view with trails in user's area
      - (Delete) Delete existing like
      - (Create/POST) Create a new comment on a post
      - (Delete) Delete existing comment
   - Trail Detail View
      - (Read/GET) Populate Detail view with selected trail image and data
      - (Create/POST) Create a new review about this trail
      - (Update/PUT) Edit posted review
      - (Delete) Delete review
   - Map View
      - (Read/GET) Display map for selected area
   - User Profile View
      - (Read/GET) Populate User profile View with profile picture / username
      - (Update/PUT) Change User profile picture
      - (Update/PUT) Change User display name
      
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
