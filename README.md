<h1 align="center">TODO List Whatsapp Chatbot</h1>

<p align="center">
  <img src="https://badges.pufler.dev/visits/bc-nogueira/whatsapp-todo" />
  <img src="https://badges.pufler.dev/created/bc-nogueira/whatsapp-todo" />
  <img src="https://badges.pufler.dev/updated/bc-nogueira/whatsapp-todo" />
</p>

This is a simple whatsapp chatbot to manage a todo list.
This was done for study purposes, to learn more about [Twilio](https://www.twilio.com/).

## Technologies used

- ![Ruby](https://img.shields.io/badge/ruby-2.7.0-CC342D?logo=ruby&style=flat)
- ![RubyOnRails](https://img.shields.io/badge/ruby_on_rails-6.0.3.4-CC0000?logo=ruby-on-rails&style=flat)
- ![Twilio](https://img.shields.io/badge/twilio-F22F46?logo=twilio&style=flat&logoColor=white) using 
  [![Twilio-Ruby](https://img.shields.io/badge/twilio_ruby-E9573F?logo=rubygems&style=flat&logoColor=white)](https://github.com/twilio/twilio-ruby)

## How to run it

The project was using Twilio Whatsapp Sandbox which expires three days after joining. Since this was a project to study I did not set any production environment to run it.

But it is possible to run this project on your machine, configure a Twilio account, connect them and make it work.

- Configure Twilio Whatsapp Sandbox
  - To configure it read **Configure your Whatsapp sandbox** section from [this article](https://www.twilio.com/blog/whatsapp-chatbot-ruby-sinatra-twilio).
- Run Rails server
  1. Clone this repository.
  2. Run `bundle install` to install dependencies.
  3. Run `rails db:migrate` to set the database.
  4. Run `rails s` to execute the rails server.
- Hooking up the bot to Whatsapp
  - Read the section **Hooking up the bot to Whatsapp** from [the same article](https://www.twilio.com/blog/whatsapp-chatbot-ruby-sinatra-twilio).
  - **Important:** After starting ngrok replace the ngrok URL [here](https://github.com/bc-nogueira/whatsapp-todo/blob/main/config/environments/development.rb#L53) with your own ngrok URL.

You are good to go! :smile:

## Available commands

| Command                | Description                                   |
|------------------------|:---------------------------------------------:|
| `list`                 | List all items showing their numbers          |
| `add item_name`        | Create a new item with given item name        |
| `delete item_number`   | Delete item with given item number            |
| `complete item_number` | Mark the item with given item number complete |
| `help`                 | List all available commands                   |
| `about`                | Show information about this project           |

## Important notes

- Used a basic structure with only one controller, one model and one service.
- Didn't use authentication, at least not to begin with.
