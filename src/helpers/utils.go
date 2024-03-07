package helpers

import (
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

// KHUSUS ERROR HANDLING
func Utils(err error, ms string, c *gin.Context) {
	if err == nil {
        c.JSON(http.StatusNotFound, &services.ResponseBack{
            Success: false,
            Message: ms,
        })
        return
    } else if strings.HasPrefix(err.Error(), "sql: no rows") {
		c.JSON(http.StatusNotFound, &services.ResponseBack{
			Success: false,
			Message: ms,
		})
		return
	} else if strings.HasSuffix(err.Error(), `unique constraint "users_email_key"`) { // Hendler Email Already exists!
		c.JSON(http.StatusBadRequest, &services.ResponseBack{
			Success: false,
			Message: ms,
		})
		return
	} else if ms == "No Data Match" {
		c.JSON(http.StatusNotFound, &services.ResponseBack{
			Success: false,
			Message: ms,
		})
		return
	} else {
		c.JSON(http.StatusInternalServerError, &services.ResponseBack{
			Success: false,
			Message: "Internal Server Error",
		})
		return
	}
}
