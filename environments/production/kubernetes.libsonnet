{
  k:: {
    deployment: {
      new(name, image, port, resources): {
        apiVersion: "apps/v1",
        kind: "Deployment",
        metadata: {
          name: name,
          labels: {
            app: name
          }
        },
        spec: {
          selector: {
            matchLabels: {
              app: name
            }
          },
          template: {
            metadata: {
              labels: {
                app: name
              }
            },
            spec: {
              containers: [{
                image: image,
                name: name,
                ports: [{
                  containerPort: port,
                }],
                resources: resources,
                livenessProbe: {
                  httpGet: {
                    path: "/",
                    port: port,
                  },
                },
                readinessProbe: {
                  httpGet: {
                    path: "/",
                    port: port,
                  },
                },
              }],
            }
          }
        }
      }
    },
    service: {
      new(name, port, portName): {
        apiVersion: "v1",
        kind: "Service",
        metadata: {
          labels: {
            app: name
          },
          name: name,
        },
        spec: {
          type: "ClusterIP",
          ports: [{
            name: portName,
            port: port,
            protocol: "TCP",
          }],
          selector: {
            app: name
          },
        },
      },
    },
    ingress: {
      new(name, port, host): {
        apiVersion: "networking.k8s.io/v1",
        kind: "Ingress",
        metadata: {
          name: name,
          labels: {
            app: name,
          },
          annotations: {
            "ingress.kubernetes.io/ssl-redirect": "false"
          },
        },
        spec: {
          rules: [{
            http: {
              paths: [{
                path: "/",
                pathType: "ImplementationSpecific",
                backend: {
                  service: {
                    name: name,
                    port: {
                      number: port,
                    }
                  }
                },
              }],
            },
            host: host,
          }],
        }
      }
    }
  }
}
