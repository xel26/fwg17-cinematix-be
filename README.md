# CinemaTix-be

Welcome to the CinemaTix Backend Web Project! This repository contains the back-end source code for an online movie ticket booking application. With Go programming language and using Gin-Gonic structure.

You can choose your favorite movie, time, and seat, and make payments safely and conveniently. CinemaTix also provides complete information about movies and theaters, real-time theater layouts, barcode tickets.


## Features

- Complete Film Information and Bioskop Schedule.
- Choose films, dates, times, and seats conveniently.
- Efficient and User-Friendly Booking Process
- View nationwide cinema schedules and seat layouts.
- Access trailers, synopses, ratings, and cast details.

Built using

![JWT](https://img.shields.io/badge/JWT-black?style=for-the-badge&logo=JSON%20web%20tokens)
![Nodemon](https://img.shields.io/badge/NODEMON-%23323330.svg?style=for-the-badge&logo=nodemon&logoColor=%BBDEAD)
![Go](https://img.shields.io/badge/Go-blue?style=for-the-badge&logo=go&logoColor=white)
![gin-gonic](https://img.shields.io/badge/gin-1DA1F2?style=for-the-badge&logo=gin&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)
![Google Chrome](https://img.shields.io/badge/Google%20Chrome-4285F4?style=for-the-badge&logo=GoogleChrome&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white)


## 📌 Getting Started

To run the project locally, follow these simple steps:

1. Clone this repository
```sh
  git clone https://github.com/putragabrielll/fwg17-cinematix-be
  cd fwg17-cinematix-be
```

2. Open in VSCode
```sh
  code .
```

3. install all the dependencies
```sh
  go mod tidy
```

4. run the project
```sh
  go run .
```


## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`DATABASE_CONNECT`

`APP_SECRET`

`CLOUDINARY_CLOUD_NAME`

`CLOUDINARY_API_KEY`

`CLOUDINARY_API_SECRET`


## API Reference

#### Login

```http
  POST /auth/login
```
#### Register

```http
  POST /auth/register
```

### Customer API
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `/customer/profile` | `GET` | Get a profile data |
| `/customer/profile` | `PATCH` | Update a profile data |
| `/customer/payment-info` | `GET` | Get a payments data |
| `/customer/history-order` | `GET` | Get a history order |
| `/customer/history-order/ticket?orderId=` | `GET` | Get a tickets |
| `/customer/payment-method` | `GET` | Get list all payment method |
| `/customer/create-order` | `POST` | Create orders |
| `/customer/update-paid-status/:orderId` | `POST` | Update paid status |

### Global API
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `/movies` | `GET` | Get a list of movie data |
| `/movies/:id` | `GET` | Get a detailed movie data |
| `/movie-time` | `GET` | Get a movie time |
| `/airing-time-date` | `GET` | Get airing time date |
| `/movie-time-id` | `GET` | Get movie time ID |
| `/airing-time-date-id` | `GET` | Get airing time date ID |
| `/movie-cinema/:movieId` | `GET` | Get movie cinema |
| `/cinema-location/:cinemaid` | `GET` | Get cinema location |


## Technologies Used

**Gin-Gonic:** a fast and minimalist web framework, this effort is dedicated to creating fast as well as resilient and scalable server-side applications.

**Go:** Go serves as the foundation for this project, utilizing a non-blocking and event-driven architecture to ensure scalable and high-performance server-side application development.

## ✍️ CinemaTix - Frontend Repository
[Front End Cinematix](https://github.com/rayfarandi/fwg17-cinematix-fe)

## Technologies Used

The project structure is organized as follows: 
- src/: contains the source code of the project.
- asset/: image and icon media.
- components/: Reusable component used throughout the project.
- pages/: Individual pages of the application.


## Contributing

Contributions are always welcome!

## Authors

- [@dzulfiqar](https://github.com/DzulfiqarSiraj)
- [@haidar](https://github.com/patih1)
- [@nanda](https://github.com/xel26)
- [@putragabrielll](https://github.com/putragabrielll)
- [@ray](https://github.com/rayfarandi)
- [@wisnu](https://github.com/wisnu31899)

## Feedback

If you have any feedback, please create new issue.
