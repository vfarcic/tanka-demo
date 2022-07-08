{
  devopstoolkit: {
    deployment: $.k.deployment.new(
      "devops-toolkit",
      $._config.devopstoolkit.image,
      80,
      {
        limits: {
          cpu: "250m",
          memory: "256Mi",
        },
        requests: {
          cpu: "100m",
          memory: "128Mi",
        },
      },
    ),
    service: $.k.service.new(
        "devops-toolkit", 
        80,
        "frontend",
    ),
    ingress: $.k.ingress.new(
        "devops-toolkit", 
        80,
        "devopstoolkitseries.com",
    ),
  },
}
