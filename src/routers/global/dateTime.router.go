package globalRouters

import (
	"github.com/gin-gonic/gin"
	globalControllers "github.com/putragabrielll/fwg17-cinematix-be/src/controllers/global"
)

func DateTimeRouter(r *gin.RouterGroup){
	r.GET("movie-time", globalControllers.GetDate)
	r.GET("airing-time-date", globalControllers.GetAiringTime)
	r.GET("movie-time-id", globalControllers.GetMovieTimeId)
	r.GET("airing-time-date-id", globalControllers.GetAiringTimeDateId)
}