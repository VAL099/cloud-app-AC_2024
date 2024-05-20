## Done

1. **Project should run as a Docker image**
    - The Dockerfile ensures that the project will be turned into a Docker image.

2. **Docker image should be published to a Docker registry**
    - The image is published to the Google Container Registry: `us-central1-docker.pkg.dev/ac-laboratory-423906/gke-repo/ac-cloud-app:latest`.

3. **Docker image should be deployed to a Kubernetes cluster**
    - The deployment configuration `cloud-app-deployment-v1` deploys the Docker image to the Kubernetes cluster.

4. **Kubernetes cluster should be running on a cloud provider**
    - Kubernetes is running on Google Cloud.

5. **Kubernetes cluster should be accessible from the internet**
    - The service type `LoadBalancer` ensures that the service is accessible from the internet.

6. **Kubernetes cluster should be able to scale the application**
    - The `replicas: 3` in `_kube/deployment.yaml` allows manual scaling.

7. **Kubernetes cluster should be able to update the application without downtime**
    - The `strategy` field with `type: RollingUpdate` in `kubernetes/deployment.yaml` ensures updates happen without downtime.

8. **Kubernetes cluster should be able to rollback the application to a previous version**
    - It's not deploying the new version if this has bugs.
        - Manually:
        `kubectl get deployments`
        `kubectl rollout undo deployment <deployment-name>`

9. **Kubernetes cluster should be able to monitor the application**
    - Using built int state tracker

10. **Kubernetes cluster should be able to autoscale the application based on the load**
    - Kubernetes cluster autoscales using HPA (Horizontal Pod Autoscaler):
        - `minReplicas` - The minimum number of pod replicas to maintain.
        - `maxReplicas` - The maximum number of pod replicas to maintain.
        - `targetCPUUtilizationPercentage` - The target average CPU utilization across all pods.
