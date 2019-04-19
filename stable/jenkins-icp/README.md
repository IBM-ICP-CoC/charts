![jenkins](https://ibm-icp-coc.github.io/charts/repo/stable/jenkins.png "Jenkins logo")
# Jenkins for ICP

Package Version: 1.0.2

A packaging of Jenkins for ICP by the IBM ICP Center of Competency (CoC).  This specific packaging includes all the plugins necessary to leverage the [Kubernetes](https://wiki.jenkins.io/display/JENKINS/Kubernetes+Plugin) cloud for dynamic provisioning of worker nodes to perform individual build tasks.

This packaging also changes the default user to root (from Jenkins) which prevents any issues of accessing the shared file system.

A default admin user os created with the credentials `admin/admin`.  You should change the admin password as soon as you can.
  
## Configuration

The following tables lists the configurable parameters of the Jenkins chart and their default values.

|         Parameter          |                       Description                       |           Default            |
|----------------------------|---------------------------------------------------------|------------------------------|
| `image.repository`         | The repository and image name                           | `ibmicpcoc/jenkins-icp`      |
| `image.tag`                | The tag (version) of the image                          | `latest`                     |
| `image.pullPolilcy`        | The pull policy for images                              | `IfNotPresent`               |
| `service.name`             | The name of the service resource                        | `jenkins-icp-service`        |
| `service.type`             | The type of service                                     | `NodePort`                   |
| `storage.createNewPvc`     | Enabled, indicates that a new PVC is created            | `true`                       |
| `storage.pvc`              | The persistent volume claim name tp be created          | `jenkins-icp-pvc`            |
| `storage.accessMode`       | The access mode for persistent storage volume           | `NodePort`                   |
| `storage.size`             | The size of the persistent volume                       | `5Gi`                        |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --name my-jenkins-release \
  --set image.pullPolilcy=Always \
    ibmicpcoc/jenkins-icp
```

The above command sets the image pull policy to always.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-jenkins-release -f values.yaml ibmicpcoc/jenkins-icp
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