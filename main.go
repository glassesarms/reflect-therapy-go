package main

import (
	"net/http"
	"github.com/gin-gonic/gin"
)

func main() {
	// Create a default Gin router
	router := gin.Default()

	// Health check endpoint
	router.GET("/health", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"status": "We are alive and ready to therapise"})
	})

	// This is where more endpoints can go

	// Run the server on port 8080
	router.Run(":8080")
}
