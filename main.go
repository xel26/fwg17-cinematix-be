package main

import (
	"net/http"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/routers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func noLink(c *gin.Context) {
	c.JSON(http.StatusNotFound, &services.ResponseBack{
		Success: false,
		Message: "Resource not found!",
	})
}

func main() {
	r := gin.Default()
	r.Use(cors.New(cors.Config{
		AllowOrigins: []string{"http://localhost:5173", "https://astonishing-cheesecake-81f941.netlify.app", "http://cinematix.pasukanhosting.my.id"},
		AllowMethods: []string{"GET", "POST", "PATCH", "DELETE"},
		AllowHeaders: []string{"Authorization"},
	}))
	routers.Combine(r)
	r.NoRoute(noLink)
	// r.Run("127.0.0.1:9090") // for local
	r.Run("127.0.0.1:9090") // for production
}
