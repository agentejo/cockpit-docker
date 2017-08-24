
# Usage
Start a container with:

    docker run -d --name cockpit-next -p 8080:80 aheinze/cockpit-next


# Build  
docker build -t cockpit-next .

# Run
docker run -p 4000:80 cockpit-next

# Cleanup
docker rmi $(docker images -f "dangling=true" -q) cockpit-next -f