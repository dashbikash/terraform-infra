package main

import (
	"context"
	"encoding/json"

	"log"

	"github.com/aws/aws-lambda-go/lambda"
)

func init() {
	// This function is called before the main function.
	// You can use it to set up any necessary configurations or initializations.
	log.Println("Initializing the Lambda function...")
}

func handleRequest(ctx context.Context, event json.RawMessage) error {
	// Your business logic here
	// For example, you can use the cfg to create clients for AWS services
	log.Printf("Received event: %s", event)
	return nil
}

func main() {
	lambda.Start(handleRequest)
	// Note: The lambda function above is a simple example.
}
