package adminControllers

import (
	"fmt"
	"net/http"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/middlewares"
	adminModels "github.com/putragabrielll/fwg17-cinematix-be/src/models/admin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func AddNewMovie(c *gin.Context) {

	// ambil data dari form
	dataMovie := services.AddNewMovie{}
	err := c.ShouldBind(&dataMovie)
	if err != nil {
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}


	// upload file
	file, _ := c.FormFile("image")


	if file != nil {
		image, err := middlewares.UploadFile(c, "image", "movies")
		if err != nil {
			msg := err.Error()
			helpers.Utils(err, msg, c)
			return
		}
		fmt.Println(image)
		dataMovie.Image = image
	}



	// cek apakah rating tersedia
	_, err = adminModels.FindOneRating(dataMovie.RatingId)
	if err != nil {
		msg := err.Error()
		if strings.HasPrefix(err.Error(), "sql: no rows"){
			msg = fmt.Sprintf("rating with id %v not found", dataMovie.RatingId)
		}

		helpers.Utils(err, msg, c)
		return
	}




	// cek apakah genre tersedia
	sliceGenre := strings.Split(dataMovie.Genre, ",")
	sliceGenreId := []int{}

	for i := 0; i < len(sliceGenre); i++ {
		genre, err := adminModels.FindGenreByName(sliceGenre[i])
		if err != nil {
			msg := err.Error()
			if strings.HasPrefix(err.Error(), "sql: no rows"){
				msg = fmt.Sprintf("genre %v not found", sliceGenre[i])
			}

			helpers.Utils(err, msg, c)
			return
		}

		sliceGenreId = append(sliceGenreId, genre.Id)
	}



	// cek apakah lokasi tersedia
	sliceLocation := strings.Split(dataMovie.Location, ",")
	sliceLocationId := []int{}

	for i := 0; i < len(sliceLocation); i++ {
		location, err := adminModels.FindLocationByName(sliceLocation[i])
		if err != nil {
			msg := err.Error()
			if strings.HasPrefix(err.Error(), "sql: no rows"){
				msg = fmt.Sprintf("location %v not found", sliceLocation[i])
			}

			helpers.Utils(err, msg, c)
			return
		}

		sliceLocationId = append(sliceLocationId, location.Id)
	}
	


	// cek cinema yg ada di lokasi tersebut
	sliceCinemaId := []int{}

	for i := 0; i < len(sliceLocationId); i++ {
		listCinema, err := adminModels.FindByLocationId(sliceLocationId[i])
		if err != nil {
			msg := err.Error()
			helpers.Utils(err, msg, c)
			return
		}

		if len(listCinema) == 0{
			msg := fmt.Sprintf("cinema at %v not found", sliceLocation[i])
			helpers.Utils(err, msg, c)
			return
		}


		for _, data := range listCinema {
			sliceCinemaId = append(sliceCinemaId, data.CinemaId)
		}
	}



	// cek apakah date tersedia jika tidak tersedia maka insert data baru
	var dateId int

	findDate, err := adminModels.FindByDate(dataMovie.Date)
	if err != nil{
		if strings.HasPrefix(err.Error(), "sql: no rows") {
			data := adminModels.Date{
				Date: dataMovie.Date,
			}
	
			insertDate, err := adminModels.InsertDate(data)
			if err != nil {
				msg := err.Error()
				helpers.Utils(err, msg, c)
				return
			}
			dateId = insertDate.Id
	
		}else{
			msg := err.Error()
			helpers.Utils(err, msg, c)
			return
		}
	}else{
		dateId = findDate.Id
	}

	fmt.Println("date", dateId, dataMovie.Date)




	// cek apakah airingTime tersedia
	sliceAiringTime := strings.Split(dataMovie.AiringTime, ",")
	sliceAiringTimeId := []int{}

	for i := 0; i < len(sliceAiringTime); i++{
		airingTime, err := adminModels.FindByTime(sliceAiringTime[i])
		if err != nil {
			msg := err.Error()
			if strings.HasPrefix(err.Error(), "sql: no rows"){
				msg = fmt.Sprintf("airingTime %v not found", sliceAiringTime[i])
			}

			helpers.Utils(err, msg, c)
			return
		}

		sliceAiringTimeId = append(sliceAiringTimeId, airingTime.Id)
	}
	fmt.Println("airingTime", dataMovie.AiringTime, sliceAiringTime, sliceAiringTimeId)




	// cek apakah relasi antara date dan airingTime di airingTimeDate sudah tersedia jika tidak maka insert data baru
	airingTimeDateId := []int{}

	for i := 0; i < len(sliceAiringTimeId); i++ {
		findAiringTimeDate, err := adminModels.FindAiringTimeDate(sliceAiringTimeId[i], dateId)
		if err != nil {
			if strings.HasPrefix(err.Error(), "sql: no rows") {
				data := adminModels.AiringTimeDate{
					AiringTimeId: sliceAiringTimeId[i],
					DateId: dateId,
				}

				insertAiringTimeDate, err := adminModels.InsertAiringTimeDate(data)
				if err != nil {
					msg := err.Error()
					helpers.Utils(err, msg, c)
					return
				}

				airingTimeDateId = append(airingTimeDateId, insertAiringTimeDate.Id)
			}
		}else{
			airingTimeDateId = append(airingTimeDateId, findAiringTimeDate.Id)
		}
	}
	fmt.Println("airingTimeDateId", airingTimeDateId)





	// set status, jika releaseDate bukan hari ini maka coming soon jika hari ini atau hari sebelumnya maka now airing 
	releaseDate, err := time.Parse("2006-01-02", dataMovie.ReleaseDate)
	if err != nil {
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	if time.Now().Before(releaseDate){
		dataMovie.StatusId = 1
	}else{
		dataMovie.StatusId = 2
	}



	// set default isRecomended true
	dataMovie.IsRecomended = true



	// insert ke table movies
	movie, err := adminModels.InsertMovie(dataMovie)
	if err != nil {
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}



	// insert ke table genreMovies
	for i := 0; i < len(sliceGenreId); i++ {
		data := adminModels.GenreMovies{
			GenreId: sliceGenreId[i],
			MoviesId: movie.Id,
		}

		_, err := adminModels.InsertGenreMovies(data)
		if err != nil {
			msg := err.Error()
			helpers.Utils(err, msg, c)
			return
		}
	}




	// Insert ke table movieCinema
	movieCinemaId := []int{}

	for i := 0; i < len(sliceCinemaId); i++ {
		data := adminModels.MovieCinema{
			CinemaId: sliceCinemaId[i],
			MoviesId: movie.Id,
		}
		movieCinema, err := adminModels.InsertMovieCinema(data)
		if err != nil {
			msg := err.Error()
			helpers.Utils(err, msg, c)
			return
		}

		movieCinemaId = append(movieCinemaId, movieCinema.Id)
	}
	fmt.Println("movieCinemaId", movieCinemaId)




	// insert ke table moviesTime
	moviesTimeId := []int{}

	for i := 0; i < len(movieCinemaId); i++ {
		for j := 0 ; j < len(airingTimeDateId); j++ {
			data := adminModels.MoviesTime{
				AiringTimeDateId: airingTimeDateId[j],
				MovieCinemaId: movieCinemaId[i],
			}

			moviesTime, err := adminModels.InsertMoviesTime(data)
			if err != nil {
				msg := err.Error()
				helpers.Utils(err, msg, c)
				return
			}

			moviesTimeId = append(moviesTimeId, moviesTime.Id)
		}
	}

	fmt.Println("moviesTimeId", moviesTimeId)




	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Add New Movie Successfully",
		Results: movie,
	})
}