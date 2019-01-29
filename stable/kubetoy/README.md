![KubeToy](https://ibm-icp-coc.github.io/charts/repo/stable/duck.png "KubeToy logo")
# Kubetoy 1.8.0

A Kubernetes Toy Application

This a simple Node.js app to be used with IBM Cloud Private demos.  It helps explore kubernetes deployments, config maps, secrets and optionally (persistent volumes)

See the GitHub [documentation](https://github.com/IBM-ICP-CoC/KubeToy) for examples of how to use this 
app.


Versions 1.8.0 is the first multiarch build, supporting amd64, ppc64le and x390s.


## Configuration

The following tables lists the configurable parameters of the Jenkins chart and their default values.

|         Parameter            |                       Description                       |           Default          |
|------------------------------|---------------------------------------------------------|----------------------------|
| `arch.amd64`                  | `Amd64 worker node scheduler preference in a hybrid cluster` | `2 - No preference` - worker node is chosen by scheduler       |
| `arch.ppc64le`                | `Ppc64le worker node scheduler preference in a hybrid cluster` | `2 - No preference` - worker node is chosen by scheduler       |
| `arch.s390x`                  | `S390x worker node scheduler preference in a hybrid cluster` | `2 - No preference` - worker node is chosen by scheduler       |
| `image.repository`         | The repository and image name                           | `ibmicpcoc/kubetoy`      |
| `image.pullPolilcy`        | The pull policy for images                              | `IfNotPresent`            |
| `service.name`              | The name of the service resource                        | `kubetoy-service`        |
| `service.type`              | The type of service                                     | `NodePort`                |
| `storage.useSharedStorage` | Enabled, Indicates that shared storage is used (filsystem tab)            | `true`                    |
| `storage.createPvc`         | Enabled, Indicates that a new PVC is created            | `true`                    |
| `storage.pvc`               | The persistent volume claim name to be created          | `kubetoy-pvc`             |
| `storage.accessmode`       | The access mode for persistent storage volume           | `NodePort`                 |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --name my-kubetoy-release \
  --set image.pullPolilcy=Always \
    ibmicpcoc/kubetoy
```

The above command sets the image pull policy to always.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-kubetoys-release -f values.yaml ibmicpcoc/kubetoy
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Persistence

The image stores the Jenkins data and configurations at the `/var/jenkins_home` path of the container.

The chart mounts a [Persistent Volume](kubernetes.io/docs/user-guide/persistent-volumes/) volume at this location. By default, 
a PVC is created for you with the name given.  If this already exists then you should un-check the option to create the PVC.

### Using Existing PersistentVolumeClaims

1. Create the PersistentVolume
2. Create the PersistentVolumeClaim
3. Install the chart:
    ```bash
    $ helm install --set storage.pvc=PVC_NAME ibmicpcoc/jenkins-icp
    ```

## Copyright
© Copyright IBM Corporation 2018. All Rights Reserved.