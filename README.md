# NiFi Registry


Start NiFi Registry
    
```
    make user=gitusername token=gitpersonalaccesstoken run
```    
*Ref*: How to generate a personal access token https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line

Stop NiFi Registry

```
    make clean
```    
---

Once started, open webapp in browser at localhost:18080/nifi-registry

Follow start guide in https://nifi.apache.org/docs/nifi-registry-docs/index.html
The main steps are:

- Create a new bucket in settings from top right.
- Add registry in NiFi UI Settings -> Registry Clients
e.g. http://172.17.0.1:8084
*Note*: Get Nifi Registry hostname from ```docker inspect nifi-registry | grep Gateway```
- Start versioning your process groups, or import process groups from the registry.


### References:

https://community.cloudera.com/t5/Community-Articles/Storing-Apache-NiFi-Versioned-Flows-in-a-Git-Repository/ta-p/248713

https://hub.docker.com/r/apache/nifi-registry

