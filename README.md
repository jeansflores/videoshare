# VideoShare [ ![Codeship Status for jeansflores/videoshare](https://app.codeship.com/projects/030463e0-d1bb-0136-3ad0-4295c3b24d40/status?branch=master)](https://app.codeship.com/projects/316239)

Social networks for sharing videos with extension .m3u8.

[VideoShare in Heroku](http://video-share.herokuapp.com/)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them

```
Ruby 2.5.3
Rails 5.2.1
Postgres >= 9.5
Docker && docker-compose (optional)
```

### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
git clone https://github.com/jeansflores/videoshare.git
cd videoshare/

bundle install
rake db:create && rake db:migrate
rails s
```

End with an example of getting some data out of the system or using it for a little demo
