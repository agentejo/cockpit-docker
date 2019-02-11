
# Usage
Start a container with:

    docker run -d --name cockpit -p 8080:80 agentejo/cockpit


# Build  
docker build -t agentejo/cockpit:latest . --no-cache

# Update Repo
docker push agentejo/cockpit

# Run
docker run -p 8080:80 agentejo/cockpit:latest

# Cleanup
docker rmi $(docker images -f "dangling=true" -q) agentejo/cockpit:latest -f
