package auth

import (
	"github.com/gin-gonic/gin"
	authController "github.com/putragabrielll/fwg17-cinematix-be/src/controllers/auth"
)


func AuthRouter(r *gin.RouterGroup){
	// AuthLogin(r.Group("/login"))
	r.POST("/register", authController.Register)
	// AuthRegister(r.Group("/register"))
}