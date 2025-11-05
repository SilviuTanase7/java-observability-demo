# ☸️ Java Observability Stack on Kubernetes

This project demonstrates a complete **observability stack** deployed in Kubernetes, built around a Java Spring Boot application instrumented with **OpenTelemetry** and monitored via **Prometheus** and **Grafana**.  
It’s designed to showcase DevOps practices like containerization, Helm-based deployments, metrics tracing, and persistence.

---

## 🧩 Project Structure


## 📁 Structure

java-observability-demo
├── oopApp/ # Spring Boot Java application (OpenTelemetry enabled)
│ ├── Dockerfile
│ ├── pom.xml
│ └── src/main/java/com/example/demo/App.java
│
└── Observability/ # Helm charts for observability stack
├── charts/
│ ├── grafana/
│ ├── prometheus/
│ ├── otel-collector/
│ ├── elasticsearch/
│ ├── kibana/
│ └── oopapp/
└── values.yaml


---

## 🧠 Stack Overview

| Component | Purpose | Tech |
|------------|----------|------|
| **oopApp** | Java REST API instrumented with OpenTelemetry | Spring Boot, Micrometer |
| **otel-collector** | Centralized telemetry receiver/exporter | OpenTelemetry Collector |
| **prometheus** | Metrics scraping and storage | Prometheus |
| **grafana** | Visualization dashboard for metrics | Grafana |
| **elasticsearch + kibana** *(optional)* | Log storage and visualization | Elastic Stack |

---

## 🚀 Deployment Steps

### 1️⃣ Build the Java App Docker Image
```bash
cd oopApp
mvn clean package
docker build -t oopapp:1.0.0 .

Docker Desktop as App, also as a Kubernetes context

To update the java App:
cd /oopApp
mvn clean package
docker build -t dockerhurepo/oopapp:latest .
docker push dockerhurepo/oopapp:latest

To run it:
helm install oopapp ./charts/oopapp --values ./charts/oopapp/values.yaml

Available on http://localhost:31080 or http://localhost:31080/metrics

2️⃣ Deploy the Observability Stack

Use Helm to install each component in Kubernetes.
Note: ElasticSearch, also Kibana it's not properly adjusted.

cd Observability
helm install prometheus ./charts/prometheus --values ./charts/prometheus/values.yaml
helm install grafana ./charts/grafana --values ./charts/grafana/values.yaml
helm install otel-collector ./charts/otel-collector --values ./charts/otel-collector/values.yaml
helm install elasticsearch ./charts/elasticsearch --values ./charts/elasticsearch/values.yaml

Prometheus: http://prometheus-prometheus:30900 
Grafana:  http://prometheus-prometheus:30080

💾 Persistent Volumes

Both Grafana and oopApp use PVCs to retain data across restarts:

Grafana stores dashboards and user configuration.

oopApp can mount a custom volume for persistent local data.

PVCs are defined in each Helm chart under:

charts/<service>/templates/pvc.yaml


To preserve data between Helm uninstall/install, create the PVC manually before deploying:

kubectl apply -f grafana-pvc.yaml

🧪 Smoke Test (oopApp)

A simple HTTP test ensures the app responds and is traceable:

curl http://localhost:31080/
# Response: Hello from Java App on Kubernetes!


Then verify metrics in:

Prometheus: search for http_server_requests_seconds_count

Grafana: visualize the same metrics in your dashboard

🧰 Key Skills Demonstrated

✅ Kubernetes
✅ Helm Chart authoring
✅ Docker & containerization
✅ OpenTelemetry integration
✅ Prometheus metrics exposure
✅ Grafana dashboards & persistence
✅ PVC and storage management
✅ DevOps automation and monitoring best practices