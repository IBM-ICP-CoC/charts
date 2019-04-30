![jenkins](https://ibm-icp-coc.github.io/charts/repo/stable/jenkins.png "Jenkins logo")
# Jenkins for ICP

Package Version: 1.0.2

A packaging of Jenkins for ICP by the IBM ICP Center of Competency (CoC).  This specific packaging includes all 
the plugins necessary to leverage the [Kubernetes](https://wiki.jenkins.io/display/JENKINS/Kubernetes+Plugin) 
cloud for dynamic provisioning of worker nodes to perform individual build tasks.

This packaging also changes the default user to root (from Jenkins) which prevents any issues of accessing 
the shared file system.

A default admin user os created with the credentials `admin/admin`.  You should change the admin password 
as soon as you can.
  
## Configuration

The following tables lists the configurable parameters of the Jenkins chart and their default values.


|         Parameter                  |                       Description                       |           Default            |
|------------------------------------|---------------------------------------------------------|------------------------------|
| `image.repository`                 | The repository and image name                           | `ibmicpcoc/jenkins-icp`      |
| `image.tag`                        | The tag (version) of the image                          | `1.0.2`                      |
| `image.pullPolilcy`                | The pull policy for images                              | `IfNotPresent`               |
| `serviceAccount.useServiceAccount` | The name of the service resource                        | `false`                      |
| `serviceAccount.name`              | The name of the service account                         | `jenkins-sa`                 |
| `storage.createNewPvc`             | Enabled, indicates that a new PVC is created            | `true`                       |
| `storage.pvc`                      | The persistent volume claim name tp be created          | `jenkins-icp-pvc`            |
| `storage.accessMode`               | The access mode for persistent storage volume           | `ReadWriteOnce`              |
| `storage.size`                     | The size of the persistent volume                       | `1Gi`                        |

## Service Account

If Jenkins is deployed in a namespace other than `default`, then you need to provide a Kubernetes ServiceAccount 
with the roles and permissions necessary to perform the necessary trasks (see 
[kubernetes service account](https://github.com/jenkinsci/kubernetes-plugin/blob/master/src/main/kubernetes/service-account.yml)).

If you expect to deploy applications to other namespaces than the one Jenkins is deployed into, you will need
to create a role binding between the service account and the cluster admin role. For example if the service account 
is called jenkins-sa, then the following clusterrolebinding would accomplish the task.

```
kubectl create clusterrolebinding default-admin --clusterrole cluster-admin --serviceaccount=jenkins-sa:default
```


## Persistence

The image stores the Jenkins data and configurations at the `/var/jenkins_home` path of the container.  
The chart mounts a [Persistent Volume](kubernetes.io/docs/user-guide/persistent-volumes/) volume at this 
location. By default, a PVC is created for you with the name given.  If this already exists then you 
should un-check the option to create the PVC.


## Copyright
© Copyright IBM Corporation 2019. All Rights Reserved.