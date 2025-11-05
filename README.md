# Java Observability Demo

This repository demonstrates a Java OOP application (`oopApp/`) integrated with an observability stack.  
The project showcases how a standalone Java app can expose metrics and traces for Prometheus, Grafana, ElasticSearch, and OpenTelemetry.

## 📁 Structure

repo/
├── oopApp/ # Java application with OOP structure and metrics exporters
├── observability/ # Optional: Prometheus, Grafana, and OpenTelemetry configs
└── README.md


## ⚙️ Features
- Java OOP app (standalone runnable)
- Exposes metrics via Prometheus endpoint
- Configurable for ElasticSearch & OpenTelemetry exporters
- Ready to visualize in Grafana dashboards

## 🚀 Run Locally
```bash
You can use the sample configs in the observability/ folder to spin up:
Prometheus – scrapes metrics
Grafana – visualization
OpenTelemetry Collector – sends data to ElasticSearch or other backends

Docker Desktop as App, also as a Kubernetes context

To update the java App:
cd /oopApp
mvn clean package
docker build -t dockerhurepo/oopapp:latest .
docker push dockerhurepo/oopapp:latest

To run it:
helm install oopapp ./charts/oopapp --values ./charts/oopapp/values.yaml

Available on http://localhost:31080 or http://localhost:31080/metrics

To run the Observability tools - Note: ElasticSearch it's not properly adjusted:
cd Observability:
helm install prometheus ./charts/prometheus --values ./charts/prometheus/values.yaml
helm install grafana ./charts/grafana --values ./charts/grafana/values.yaml
helm install otel-collector ./charts/otel-collector --values ./charts/otel-collector/values.yaml
helm install elasticsearch ./charts/elasticsearch --values ./charts/elasticsearch/values.yaml

Prometheus: http://prometheus-prometheus:30900 
Grafana:  http://prometheus-prometheus:30080