FROM ruby:3.2

# Set working directory
WORKDIR /app

# Copy all project files into the container
COPY . .

# Run the server script when the container starts
CMD ["ruby", "lib/phrase_generator.rb"]