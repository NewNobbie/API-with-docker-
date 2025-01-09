# Script-with-docker-

This project demonstrates the basics of using Docker Compose and a Dockerfile with a simple Ruby application.

---

## **Overview**

This project includes:
1. **Dockerfile**: Describes how to containerize the Ruby application.
2. **Docker Compose**: Simplifies the management of containers and related configurations.

The application runs a Ruby script (`lib/phrase_generator.rb`) inside a Docker container.

---

## **Step by Step**

### 1. **Clone the Repository**:
   ```dockerfile
   git clone https://github.com/NewNobbie/API-with-docker-.git
   cd API-with-docker-
  ```

### 2. **Build the images**
  Build the image using the files `docker-compose.yml` with the next cmd:
  ```
  docker-compose build
  ```
### 3. **Execute the phrases generator**
  While the image stay build, you can execute the project with docker compose, use the next cmd to init and execute the file `phrase_generator.rb`:
  ```
  docker-compose run phrase-generator
  ```
### 4. **Verify the output**
  The phrases generator must be stay runnig. verify the steps into the termial, if the phrases are added the result is successful
  
