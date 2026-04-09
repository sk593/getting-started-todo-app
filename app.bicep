extension radius

@description('The ID of the Radius environment. Injected automatically by the rad CLI.')
param environment string

@description('The name of the Radius application.')
param applicationName string

resource app 'Applications.Core/applications@2023-10-01-preview' = {
  name: applicationName
  properties: {
    environment: environment
  }
}

resource demo 'Applications.Core/containers@2023-10-01-preview' = {
  name: 'app'
  properties: {
    application: app.id
    container: {
      image: 'ghcr.io/radius-project/samples/demo:latest'
      ports: {
        web: {
          containerPort: 3000
        }
      }
    }
  }
}
