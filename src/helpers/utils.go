package helpers

import (
	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
	"net/http"
	"strings"
)


// KHUSUS ERROR HANDLING
func Utils(err error, ms string, c *gin.Context) {
	if strings.HasPrefix(err.Error(), "sql: no rows") {
		c.JSON(http.StatusNotFound, &services.ResponseBack{
			Success: false,
			Message: ms,
		})
		return
	}  else if strings.HasSuffix(err.Error(), `unique constraint "users_email_key"`) { // Hendler Email Already exists!
		c.JSON(http.StatusBadRequest, &services.ResponseBack{
			Success: false,
			Message: ms,
		})
		return
	} else if ms == "Internal Server Error" {
		c.JSON(http.StatusNotFound, &services.ResponseBack{
			Success: false,
			Message: ms,
		})
		return
    }
}
