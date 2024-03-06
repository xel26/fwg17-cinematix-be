package auth

import (
	"github.com/gin-gonic/gin"
	authController "github.com/putragabrielll/fwg17-cinematix-be/src/controllers/auth"
	"github.com/putragabrielll/fwg17-cinematix-be/src/middlewares"
)


func AuthRouter(r *gin.RouterGroup){
	r.POST("/register", authController.Register)
	
	authMiddleware, _ := middlewares.Auth()
	r.POST("/login", authMiddleware.LoginHandler)
}