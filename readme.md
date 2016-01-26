# BuddyBeats

BuddyBeats is an application to help you make YouTube playlists with your friends, helpful for everything from deciding on the music at your wedding to ensuring crowd-pleasing bangers at your holiday party.

## Screenshot

Coming soon!

## Technologies Used
 * Active Record
 * Bootstrap
 * HTML 5
 * Javascript
 * jQuery
 * PostgreSQL
 * Rake
 * Ruby on Rails
 * Underscore

## General Approach

My first step was to sketch out what data I would need to capture in my database and the relations between all of the tables. This was the bulk of my pre-planning stage. I also sketched out a rough idea of the layout and flow of the website.

When this was complete, I set up the databases in PostgreSQL. I then created the basic structure of the Rails application, including the controllers. From there, I started with account authentication and then moved onto the core functionality of the website.

I saved most of the front-end for last, making sure everything was working properly before I dove into styling. After some basic styling, I started tweaking and adding new features, fixing small bugs and customizing the site.

I truly enjoyed making this site and I hope you like it!

## Possible Future Additions

While I completed everything I intended to with this project (and more, in fact -- hello, Spotify!), I kept a running list of other features I would like to experiment with.

 * Use [Kaminari](https://github.com/amatsuda/kaminari) to add pagination to browsing playlists. If the site were to scale up, it would need to not display all of the public playlists on one page.
 * Create an option where playlists are fully public, so users do not need to create an account to participate. This would remove the ability to limit the user by quantity. I could also toggle certain authorization settings, such as allowing users to view playlists without logging in, but still requiring them to log-in to create any data.
 * Create an e-mail form to send the playlist link.
 * Use bit.ly or Google URL Shortener to provide condensed URLs of the playlist links.
 * Add the ability to sort tables.
 * Experiment with [D3.js](http://d3js.org/) to visualize user data.
 * Allow the owner to change the order of the songs on their playlist.
 * An entirely different direction was to add a tool that helps users to convert an iTunes playlist into a YouTube or Spotify playlist.
 * Use OAuth with Facebook, Google, Spotify, etc.
 * Brainstorm a solution to make thumbnails on the search page a fixed height, in order to produce a clean display of the grid -- while still integrating responsive design.

## Installation Instructions

This site requires Ruby, Ruby on Rails, Rake and PostgreSQL. After those are installed, you will simply need to run the following commands:

```
bundle
rake db:create
rake db:migrate
rails s
```

If you have trouble with the rake commands, try:

```
bundle exec rake db:create
bundle exec rake db:migrate
```

## Wireframes / Proposed Architecture

 ![Wireframe](https://i.imgsafe.org/5a287f5.jpg =500x)

 ![Sketches](https://i.imgsafe.org/5798c53.jpg =500x)

## User stories
  * **Celine:** Celine's wedding is coming up and she wants a way to gather input from her friends about the music she should play at her wedding. She wants to make sure everyone has a good time and gets a special moment during the reception. On her invitation, she includes a bit.ly link for her playlist, so everyone can add two songs. Before the reception, she e-mails the playlist to the DJ so she can coordinate and after the wedding, she savors that the playlist will always be a little time capsule.

  * **Chad:** Chad is totally pumped about this week's rager, brah. But some of the crew is sick of hearing Calvin Harris and Chainsmokers every other song, so he is sending a link around and based on what everyone says, maybe he will add some David Guetta.
