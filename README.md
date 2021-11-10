## Resevation_app
Resevation_app is a Rest API with JWT-TOKEN authentication user can sign in and do any of the CRUD operations for all model.
It can be used as a back end salon Reservation front end.

[E-R Digram](./doc/er-digram.png)

[Routes](./routes/routes.pdf)

## Built With
- rails API

## Live link
 [API link](https://registeration-app.herokuapp.com/).

## Getting Started
To get a local copy up and running follow these simple example steps on the command line.

## Clone the project from its github repo.

> ### $ git clone https://github.com/vidhishweta01/reservation_api.git
  
## Change directory to the root of project

> ### $ cd reservation_api
  
## Install all dev reservation_api

> ###  $ bundle install


## Run the server

> ### $ rails s

### Prerequisites

Ruby: 3.0.0
Rails: 6.1.1
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install --path vendor/bundle
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Github Actions

To make sure the linters' checks using Github Actions work properly, you should follow the next steps:

1. On your recently forked repo, enable the GitHub Actions in the Actions tab.
2. Create the `feature/branch` and push.
3. Start working on your milestone as usual.
4. Open a PR from the `feature/branch` when your work is done.


### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```

## Authors

👤 **Author**

- GitHub: [@ShwetaSrivastava](https://github.com/vidhishweta01)
- Twitter: [@ShwetaSrivastava](https://twitter.com/vidhishweta01)
- LinkedIn: [ShwetaSrivastava](https://www.linkedin.com/in/vidhishweta01/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](LICENSE) licensed.


