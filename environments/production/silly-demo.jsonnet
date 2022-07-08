{
  sillydemo: {
    deployment: $.k.deployment.new(
      "silly-demo",
      $._config.sillydemo.image,
      8080,
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
        "silly-demo", 
        8080,
        "api",
    ),
  },
}
