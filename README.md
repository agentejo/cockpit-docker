
# Usage
Start a container with:

    docker run -d --name cockpit-next -p 8080:80 aheinze/cockpit-next


# Build  
docker build -t aheinze/cockpit-next:latest .

# Update Repo
docker push aheinze/cockpit-next

# Run
docker run -p 8080:80 aheinze/cockpit-next:latest

# Cleanup
docker rmi $(docker images -f "dangling=true" -q) aheinze/cockpit-next:latest -f