package globalRouters

import "github.com/gin-gonic/gin"


func GlobalRouter(r *gin.RouterGroup){
	MovieRouter(r.Group("/movies"))
	CinemaLocation(r.Group("/cinema-location"))
	// variantRouters(r.Group("/product-variant"))
}