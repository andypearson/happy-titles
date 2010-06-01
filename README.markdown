# Happy Titles!

A simple (and cheerful) way to handle page titles in your layouts.

## Getting Started

### Install the Gem

Run the following:

	sudo gem install happy-titles
	
And add it to your environment.rb configuration as a gem dependency:

	config.gem "happy-titles", :lib => 'happy_titles'
	
### Set the Defaults

Create a new file in `config/initializers` called `happy_titles.rb` or something else which makes sense!

In this new file, add the following lines to set the default Site and Tagline.

	ActionView::Base.happy_title_setting(:site, 'Your Site')
	ActionView::Base.happy_title_setting(:tagline, 'Your witty but informative tagline')
	
### Update your Layout

In the layout where you want to display your title add the following call to the Happy Titles helper method.

	<%= happy_title %>
	
The header element of your layout might end up looking something like:

	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<%= happy_title %>
	</head>

Notice you don't need to wrap the helper in a `<title>` element, this is done for you.
	
### Set the Title in your Views

In each of your views call the `title` method to set the title for that page.

	<% title 'Your very first Happy Title!' %>
	
### See your Titles!

Given the above settings, let's have a look at the output you will receive when you call the `happy_title` method in your layouts.

On pages where the title has not been set you will see...

	<title>Your Site | Your witty but informative tagline</title>
	
...and on pages where the title _has_ been set you will see...

	<title>Your very first Happy Title! | Your Site</title>

That really is all there is to setting up and using Happy Titles!


## Customising the Title Templates

### Intro

You have already seen how to set up and use Happy Titles, now let's take a look at how to customise the individual title templates.

In all of the following examples I am going to assume the same defaults that are set up in the Set the Defaults section of this Readme.

Before we have a look at that, let's have a look at the **placeholders** you can use. These placeholders will be replaced with the real content when the title is rendered.

	:site 		-> 'Your Site'
	:tagline 	-> 'Your witty but informative tagline'
	:title 		-> Will become 'Your very first Happy Title!' or :tagline if a page title has not been set
	
Now let's have a look at the default templates.

	':site | :title'	-> Is used when there is no title set: 'Your Site | Your witty but informative tagline'
	':title | :site'	-> Is used when there IS a title set: 'Your very first Happy Title! | Your Site'
	
You can change the default templates by using the following setting in `config/initializers/happy_titles.rb`

	# The first param sets the name of the template and takes a symbol
	# The second param is the template to use when there is no title set
	# The third param is the template to use when there is a title set
	ActionView::Base.happy_title_template(:default, '[:site]', '[:site] :title')

Then when you render your titles you will see the following

	<title>[Your Site]</title> <!-- when there is no title -->
	<title>[Your Site] Your very first Happy Title!</title> <!-- when the title is set -->

### Adding Additional Templates

As well as changing the default template, you can also add new templates and then use those when you need a different title format in a different layout.
	
	# config/initializers/happy_titles.rb
	ActionView::Base.happy_title_template(:extra, '++ :site ++', '++ :site ++ :title ++')

Then in your layout, you can use the following to call the extra template.

	<%= happy_title :extra %>
	
And you will get the following output, as you probably would of guessed by now!

	<title>++ Your Site ++</title> <!-- when there is no title -->
	<title>++ Your Site ++ Your very first Happy Title! ++</title> <!-- when the title is set -->
	
You can add as many additional title templates as you need!

One final thing to mention, you can create templates that just have one format. So...

	# config/initializers/happy_titles.rb
	ActionView::Base.happy_title_template(:single, ':site (:title)')
	
	# In your layout
	<%= happy_title :single %>
	
	# Output
	<title>Your Site (Your witty but informative tagline)</title> <!-- when there is no title -->
	<title>Your Site (Your very first Happy Title!)</title> <!-- when the title is set -->
	

## Other Things...

### Why Use Happy Titles?

Happy Titles is a simple way to use multiple title formats in the same app. In my case, the app I was working on at the time required different title formats for public and private pages, and this is the best way I could think of managing that requirement in a suitably DRY fashion.

### Why on earth is it called Happy Titles?

What can I say, I was in a good mood when I started writing the plugin and I couldn't think of anything better to call it!

### Inspiration and Thanks

When it came to actually writing the plugin I studied the [Headliner plugin][hl] to see how that was done and got some ideas on how to set up my specs. I also want to thank [Justin French][jf] for his help when I created some small patches for his [Formtastic][ft] plugin. He made me realise that even though I don't have a lot of experience I can still help out the open source community. Please take a look at [Formtastic][ft] for a great way to make semantic forms really easy in Rails. Thanks also to all the clever chaps working on GitHub, I don't think I would of ever had the oomph to release this if GitHub wasn't here to make it so wonderfully easy and fun!

### Please give me some feedback

This plugin was written as an experiment and a learning experience. I am a relative newcomer to the world of Ruby, Rails and Github so if you have 5 Minutes to skim read the code and maybe suggest something I could do better in the future then please leave a comment and I will be very grateful of the feedback, thanks in advance!


[hl]: http://github.com/mokolabs/headliner/tree/master "mokolabs Headliner on GitHub"
[jf]: http://justinfrench.com/ "Justin French"
[ft]: http://github.com/justinfrench/formtastic/tree/master "justinfrench Formtastic on GitHub"