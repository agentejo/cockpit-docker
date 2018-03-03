
# Usage
Start a container with:

    docker run -d --name cockpit -p 8080:80 agentejo/cockpit


# Build  
docker build -t agentejo/cockpit:latest .

# Update Repo
docker push agentejo/cockpit

# Run
docker run -p 8080:80 agentejo/cockpit:latest

# Login
You can find the default user and password at URL [/install](http://localhost:8080/install)

# Cleanup
docker rmi $(docker images -f "dangling=true" -q) agentejo/cockpit:latest -f
