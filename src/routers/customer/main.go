package customerRouters

import (
	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/middlewares"
)


func CustomerRouter(r *gin.RouterGroup){
	authMiddleware, _ := middlewares.Auth()
	r.Use(authMiddleware.MiddlewareFunc())

	profileRouter(r.Group("/profile"))
	MovieRouter(r.Group("/movies"))
	HistoryOrderRouter(r.Group("/history-order"))
	PaymentInfoRouter(r.Group("/payment-info"))
  TicketRouter(r.Group("/ticket"))
	ReservedSeatRouter(r.Group("/reserved-seat"))
}