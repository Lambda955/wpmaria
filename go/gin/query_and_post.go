package main

import (
	"fmt"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()

	router.POST("/post", func(c *gin.Context) {
		id := c.Query("id")
		page := c.DefaultQuery("page", "0")
		name := c.PostForm("name")
		message := c.PostForm("message")

		fmt.Printf("id : %s; page : %s; name : %s; message : %s", id, page, name, message)
	})
	router.Run(":8080")
}

// Request : curl -X POST "localhost:8080/post?id=1234&page=1" -d 'name=manu' -d 'message=test'
