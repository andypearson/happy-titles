# happy-titles

A simple (and cheerful) way to handle page titles in your layouts.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'happy-titles'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install happy-titles


## Usage

### Setting up default values

Create a new file in `config/initializers` called `happy_titles.rb` or something else which makes sense!

In this new file, add the following lines to set the default site and tagline.

```ruby
HappyTitles.configure do |config|
  config.site = "Your Site"
  config.tagline = "Your witty but informative tagline"
end
```


### Update your layout

In the layout where you want to display your title add the following call to the Happy Titles helper method.

```
<%= page_title %>
```

The header element of your layout might end up looking something like:

```html
<head>
  <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
  <%= page_title %>
</head>
```

Notice you don't need to wrap the helper in a `<title>` element, this is done for you.


### Set the title in your views

In each of your views call the `title` method to set the title for that page.

```
<% title 'Your very first Happy Title!' %>
```

### See your titles!

Given the above settings, let's have a look at the output you will receive when you call the `page_title` method in your layouts.

On pages where the title has not been set you will see...

```html
<title>Your Site | Your witty but informative tagline</title>
```

...and on pages where the title _has_ been set you will see...

```html
<title>Your very first Happy Title! | Your Site</title>
```

That really is all there is to setting up and using Happy Titles!


## Customising the Title Templates

### Intro

You have already seen how to set up and use Happy Titles, now let's take a look at how to customise the individual title templates.

In all of the following examples I am going to assume the same defaults that are set up in the Set the Defaults section of this README.

Before we have a look at that, let's have a look at the **placeholders** you can use. These placeholders will be replaced with the real content when the title is rendered.

| Placeholder | Example                                                                                   |
|:------------|:------------------------------------------------------------------------------------------|
| :site       | "Your Site"                                                                               |
| :tagline    | "Your witty but informative tagline"                                                      |
| :title      | Will become "Your very first Happy Title!" or `:tagline` if a page title has not been set |

Now let's have a look at the default templates.

| Template            | Description                                                                               |
|:--------------------|:------------------------------------------------------------------------------------------|
| :site &#124; :title | Is used when there is no title set: "Your Site &#124; Your witty but informative tagline" |
| :title &#124; :site | Is used when there *is* a title set: "Your very first Happy Title! &#124; Your Site"      |

You can change the default templates by using the following setting in `config/initializers/happy_titles.rb`

```ruby
HappyTitles.configure do |config|
  config.templates do
    # The second param is the template to use when there is no title set
    # The third param is the template to use when there is a title set
    default "[:site]", "[:site] :title"
  end
end
```

Then when you render your titles you will see the following

```html
<title>[Your Site]</title> <!-- when there is no title -->
<title>[Your Site] Your very first Happy Title!</title> <!-- when the title is set -->
```


### Adding Additional Templates

As well as changing the default template, you can also add new templates and then use those when you need a different title format in a different layout.

In `config/initializers/happy_titles.rb`:

```ruby
HappyTitles.configure do |config|
  config.templates do
    extra "++ :site ++", "++ :site ++ :title ++"
  end
end
```

Then in your layout, you can use the following to call the extra template.

```
<%= page_title :extra %>
```

And you will get the following output, as you probably would've guessed by now!

```html
<title>++ Your Site ++</title> <!-- when there is no title -->
<title>++ Your Site ++ Your very first Happy Title! ++</title> <!-- when the title is set -->
```

You can add as many additional title templates as you need!

One final thing to mention, you can create templates that just have one format. So...

In `config/initializers/happy_titles.rb`:

```ruby
HappyTitles.configure do |config|
  config.templates do
    single ":site (:title)"
  end
end
```

In your layout:

```
<%= page_title :single %>
```

The output:

```html
<title>Your Site (Your witty but informative tagline)</title> <!-- when there is no title -->
<title>Your Site (Your very first Happy Title!)</title> <!-- when the title is set -->
```


## Contributing

1. Fork it ( https://github.com/andypearson/happy-titles/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
