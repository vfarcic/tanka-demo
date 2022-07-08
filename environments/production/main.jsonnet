(import "kubernetes.libsonnet") +
(import "devops-toolkit.jsonnet") +
(import "silly-demo.jsonnet") +
{
  _config:: {
    devopstoolkit: {
      image: "vfarcic/devops-toolkit-series"
    },
    sillydemo: {
      image: "vfarcic/silly-demo"
    }
  },
  namespace: {
    apiVersion: "v1",
    kind: "Namespace",
    metadata: {
      name: "production"
    }
  },
}
