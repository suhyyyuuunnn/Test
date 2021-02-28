FROM golang:1.12-alpine AS build
#Install git
RUN apk add --no-cache git
#Get the hello world package from a GitHub repository
RUN go get github.com/suhyyyuuunnn/Test
WORKDIR /go/src/github.com/suhyyyuuunnn/Test
# Build the project and send the output to /bin/HelloWorld
RUN go build -o /bin/Test

FROM golang:1.12-alpine
#Copy the build's output binary from the previous build container
COPY --from=build /bin/Test /bin/Test
ENTRYPOINT ["/bin/Test"]
