package globalRouters

import "github.com/gin-gonic/gin"


func GlobalRouter(r *gin.RouterGroup){
	MovieRouter(r.Group("/movies"))
	// sizeRouters(r.Group("/product-size"))
	// variantRouters(r.Group("/product-variant"))
}