# Breaking Changes
* Does not support ace + mq.  Only supports ace only.

# What’s new in Chart Version 1.2.0

This is a repackaging of the official IBM/charts offering of ACE-dev.  This version supports s390x
for ace only.  This helm chart does not support ACE + MQ


# Prerequisites
1. IBM Cloud Private version 3.1.1 or later

# Documentation
For more information go to [App Connect Enterprise Knowledge Center](https://www.ibm.com/support/knowledgecenter/en/SSTTDS_11.0.0/com.ibm.etools.mft.doc/bz91410_.htm)


# Version History

| Chart | Date | Kubernetes Required | Image(s) Supported | Breaking Changes | Details |
| ----- | ---- | ------------------- | ------------------ | ---------------- | ------- |
| 1.2.0 | May 23, 2019  | >=v1.11.1   | ibmicpcoc/ace:11.0.0.4 | Repackaging to include multi-arc server only (amd64, s390x) |
| 1.1.1 | May 10, 2019  | >=v1.11.1   | ibmcom/ace-dev:11.0.0.4, ibmcom/ace-mq-dev:11.0.0.4 | Pick up bug fixes, 11.0.0.4 FP Update |
| 1.1.0 | Jan 31, 2019  | >=v1.11.1  | ibmcom/ace-dev:11.0.0.3, ibmcom/ace-mq-dev:11.0.0.3 | 11.0.0.3 FP Update |
| 1.0.0 | Nov 14, 2018 | >=v1.11.1   | ibmcom/ace-dev:11.0.0.2, ibmcom/ace-mq-dev:11.0.0.2 | Initial Chart |
